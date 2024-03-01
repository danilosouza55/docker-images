#/bin/bash
cd 3.19.2
docker build -t danilo55555/flutter-sdk:3.19.2 .
docker build -t danilo55555/flutter-sdk:latest .
cd ..

docker push danilo55555/flutter-sdk:3.19.2
docker push danilo55555/flutter-sdk:latest
