#!/bin/bash
set -euo pipefail

# <MMC Library> See https://github.com/MultiMC/Launcher/wiki/JSON-Patches
# Reference https://maven.apache.org/pom.html#Maven_Coordinates
# for additional info

# <maven path> <maven repository i> <maven repository i+1>
# used to find the first repo the givon url exists in
function locate_url() {
	maven_path=$1
	shift # shift to read the repo urls

	for repo_url in "$@"; do
		response=$(curl -s -o /dev/null -w "%{http_code}" "$repo_url/$maven_path" 2>/dev/null)
		if [ "$response" -eq 200 ]; then
			echo "$repo_url"
			return 0
		fi
	done

	return 1
}
# <extension> <maven coordinate>
# turns a coordinate into a path for a maven repo
function coordinate_to_path() {
	IFS=':' read -r group artifact version <<<"$2"
	group=$(echo "$group" | tr '.' '/')
	echo "$group/$artifact/$version/$artifact-$version.$1"
}
# <maven coordinate>
# using couriser, gets the dependencies of a coordinate (including transitive)
function get_dependencies() {
	artifact="$1"
	cs resolve -r jitpack \
		-r https://maven.quiltmc.org/repository/release \
		-r https://maven.fabricmc.net/ \
		-r https://repo.spongepowered.org/maven/ \
		"$artifact" | awk -F: '{print $1":"$2":"$3}'
}
# <maven coordinate> -> [<maven coordinate>] -> JSON array of <MMC Library>
get_dependencies "$1" | while IFS= read -r artifact; do
	maven_path=$(coordinate_to_path "pom" "$artifact")
	# repo order is take from https://codeberg.org/CRModders/cosmic-quilt-example/src/branch/main/build.gradle
	lib_url=$(
		locate_url "$maven_path" \
			"https://jitpack.io/" \
			"https://maven.quiltmc.org/repository/release" \
			"https://maven.fabricmc.net/" \
			"https://repo.spongepowered.org/maven/" \
			"https://repo1.maven.org/maven2/"
	)
	echo "{\"name\": \"$artifact\",\"url\": \"$lib_url\"}"
done
