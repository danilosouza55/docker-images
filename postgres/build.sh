#/bin/bash
cd 9.6
docker build -t danilo55555/postgres:9.6 .
cd ..

cd 14.2
docker build -t danilo55555/postgres:14.2 .
cd ..

cd 15.4
docker build -t danilo55555/postgres:15.4 .
cd ..

cd 16.0
docker build -t danilo55555/postgres:16.0 .
docker build -t danilo55555/postgres:latest .
cd ..

docker push danilo55555/postgres:9.6
docker push danilo55555/postgres:14.2
docker push danilo55555/postgres:15.4
docker push danilo55555/postgres:16.0
docker push danilo55555/postgres:latest
