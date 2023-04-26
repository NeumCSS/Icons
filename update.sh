#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir "$SCRIPT_DIR/src"

head=$(git ls-remote https://github.com/iconify/icon-sets HEAD | awk '{print $1}')
json=$(curl -s "https://api.github.com/repos/iconify/icon-sets/git/trees/$head" | jq -r '.tree|.[]|select(.path=="json")|.url')
files=$(curl -s "$json" | jq -r '.tree|.[]|.path')

for i in $(echo "$files"); do
  file=$(curl -s "https://raw.githubusercontent.com/iconify/icon-sets/master/json/$i")
  prefix=$(echo "$file" | jq -r '.prefix')
  size=$(echo "$file" | jq -r '.info|.height|.[0]' 2> /dev/null || echo "$file" | jq -r '.info|.height' ) # heroicons have to be so annoying
  echo "$file" | jq -r ".icons|keys[] as \$k | \"i-$prefix-\(\$k) => background-image:url(\\\"data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E\(.[\$k] | .body | @uri)%3C%2Fsvg%3E\\\");width:${size}px;height:${size}px\"" | dd of="$SCRIPT_DIR/src/$prefix.neum"
  split --numeric-suffixes=1 --suffix-length=1 --additional-suffix=.neum "$SCRIPT_DIR/src/$prefix.neum" "$SCRIPT_DIR/src/$prefix"
  rm "$SCRIPT_DIR/src/$prefix.neum"
done
