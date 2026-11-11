#!/usr/bin/env bash

set -Eeuo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
version_list="$(bash "$script_dir/../scripts/image-versions.sh" "$script_dir")"
mapfile -t versions <<< "$version_list"
latest="${versions[${#versions[@]}-1]}"
image="danilo55555/flutter-sdk"
platforms="linux/amd64,linux/arm64/v8"
builder="docker-images-multiarch"

cd "$script_dir"

if ! docker buildx inspect "$builder" >/dev/null 2>&1; then
  docker buildx create --name "$builder" --driver docker-container
fi

docker buildx use "$builder"
docker buildx inspect --bootstrap

for version in "${versions[@]}"; do
  tags=(--tag "$image:$version")
  if [[ "$version" == "$latest" ]]; then
    tags+=(--tag "$image:latest")
  fi

  docker buildx build \
    --platform "$platforms" \
    "${tags[@]}" \
    --push \
    "$version"
done
