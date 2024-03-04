#/bin/bash
cd 3.19.2
docker buildx build --platform linux/amd64,linux/arm64/v8 -t danilo55555/flutter-sdk:3.19.2 --push .
docker buildx build --platform linux/amd64,linux/arm64/v8 -t danilo55555/flutter-sdk:latest --push .
