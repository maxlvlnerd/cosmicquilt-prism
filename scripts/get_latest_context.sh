#!/bin/bash
set -euo pipefail
# really just an update script.
# gets the latest versions of Cosmic Reach and Cosmic Quilt
# aswell as the dependencies (<MMC Library>) for cosmic quilt
# and returns them in JSON for use with tera in ./render.sh

# these line are quite fragile so expect it to cause issues
# ie if versions.json is out of date, or the format changes
versions="$(curl -s "https://raw.githubusercontent.com/CRModders/CosmicArchive/main/versions.json")"
latest_cosmic="$(echo "$versions" | jq -r '.latest.pre_alpha')"
cr_jar_url="$(echo "$versions" | jq -r --arg latest "$latest_cosmic" '.versions[] | select(.id == $latest) | .url')"

# should work quite well but only results in taged releases being used
latest_quilt="$(curl -s "https://codeberg.org/api/v1/repos/CRModders/cosmic-quilt/releases/latest" | jq -r '.tag_name')"

# ./fetch_dependencies.sh could fail if a dependency isnt found in
# the list of maven repositories it uses in the script.

# dont really like the fact that doing it this way means you have
# to cd into the folder with fetch_dependencies.sh in it
quilt_libraries="$(source ./fetch_dependencies.sh "org.codeberg.CRModders:cosmic-quilt:$latest_quilt" | jq -s .)"

jq -n --arg cr_version "$latest_cosmic" \
	--arg quilt_version "$latest_quilt" \
	--argjson quilt_libraries "$quilt_libraries" \
	--arg cr_jar_url "$cr_jar_url" \
	'{$cr_version,$quilt_version,$cr_jar_url,$quilt_libraries}'
