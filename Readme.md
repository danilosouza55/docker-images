Docker images of some languages and tools.

## Images

#### Postgres
- Postgres SQL 16.0
- Postgres SQL 15.4
- Postgres SQL 14.2
- Postgres SQL 9.6

#### Subir container docker
    docker run --name postgres-teste -e POSTGRES_PASSWORD=testeteste -p 5432:5432 -v /home/danilo/postgres/data-5432:/var/lib/postgresql/data -d danilo55555/postgres:16.0

Images from this repository are shared on the [Docker Hub](https://hub.docker.com/u/danilo55555).