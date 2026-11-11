#!/usr/bin/env bash

set -Eeuo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
image="danilo55555/postgres"

cd "$script_dir"

for version in 9.6 14.2 15.4 16.0; do
  docker build --tag "$image:$version" "$version"
done

docker tag "$image:16.0" "$image:latest"

for version in 9.6 14.2 15.4 16.0 latest; do
  docker push "$image:$version"
done
