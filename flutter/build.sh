#!/usr/bin/env bash

set -Eeuo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
image="danilo55555/flutter-sdk"
platforms="linux/amd64,linux/arm64/v8"
builder="docker-images-multiarch"

cd "$script_dir"

if ! docker buildx inspect "$builder" >/dev/null 2>&1; then
  docker buildx create --name "$builder" --driver docker-container
fi

docker buildx use "$builder"
docker buildx inspect --bootstrap

for version in 3.19.2 3.22.1 3.24.1 3.35.1 3.38.5 3.47.9; do
  tags=(--tag "$image:$version")
  if [[ "$version" == "3.47.9" ]]; then
    tags+=(--tag "$image:latest")
  fi

  docker buildx build \
    --platform "$platforms" \
    "${tags[@]}" \
    --push \
    "$version"
done
