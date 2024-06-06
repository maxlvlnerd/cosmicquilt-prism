#!/bin/bash

# uses tera-cli to render all the templates out
# Usage <Templates Directory> <Output Directory> <Context>
# <Templates Directory> - this and its subfolders have all files in them passed rendered through tera-cli using <Context> and get output to <Output Directory>
# <Context> - a JSON object passed to tera-cli # See https://github.com/chevdor/tera-cli
set -eou pipefail

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
