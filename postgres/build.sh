#!/usr/bin/env bash

set -Eeuo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
version_list="$(bash "$script_dir/../scripts/image-versions.sh" "$script_dir")"
mapfile -t versions <<< "$version_list"
latest="${versions[${#versions[@]}-1]}"
image="danilo55555/postgres"

cd "$script_dir"

for version in "${versions[@]}"; do
  docker build --tag "$image:$version" "$version"
done

docker tag "$image:$latest" "$image:latest"

for version in "${versions[@]}" latest; do
  docker push "$image:$version"
done
