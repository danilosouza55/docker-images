#!/usr/bin/env bash

set -Eeuo pipefail

if [[ $# -ne 1 || ! -d "$1" ]]; then
  echo "Usage: $0 <image-directory>" >&2
  exit 1
fi

shopt -s nullglob
versions=()
for directory in "$1"/*/; do
  version="${directory%/}"
  version="${version##*/}"
  if [[ "$version" =~ ^[0-9]+(\.[0-9]+)+$ && -f "${directory}Dockerfile" ]]; then
    versions+=("$version")
  fi
done

if (( ${#versions[@]} == 0 )); then
  echo "No version directories with a Dockerfile found in $1" >&2
  exit 1
fi

printf '%s\n' "${versions[@]}" | LC_ALL=C sort -V
