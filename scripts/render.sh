#!/bin/bash
# Usage <Templates Directory> <Output Directory> <Context>
# <Templates Directory> - this and subfolders get all files passed in them through tera-cli using <Context> and are output to <Output Directory>
# <JSON Context> - a JSON string passed to tera-cli # See https://github.com/chevdor/tera-cli
set -eou pipefail
# uses tera-cli to render all the templates out
# the result ends up in "./rendered"

template_dir="$1"
output_dir="$2"
# !! $3 has to be a JSON
data="$3"

# dont really like doing it this way but oh well
find "$template_dir" -type f | while read -r file; do
	relative_path="$(realpath --relative-to="$template_dir" "$file")"
	mkdir --parents "$(dirname "$output_dir/$relative_path")"
	echo "$data" | tera --template "$file" --out "$output_dir/$relative_path" --stdin
done
