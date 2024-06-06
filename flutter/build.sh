#/bin/bash
docker buildx create --use

cd 3.19.2
docker buildx build --platform linux/amd64,linux/arm64/v8 -t danilo55555/flutter-sdk:3.19.2 --push .

cd 3.22.1
docker buildx build --platform linux/amd64,linux/arm64/v8 -t danilo55555/flutter-sdk:3.22.1 --push .
docker buildx build --platform linux/amd64,linux/arm64/v8 -t danilo55555/flutter-sdk:latest --push .
