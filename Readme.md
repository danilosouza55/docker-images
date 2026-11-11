Docker images for Flutter and PostgreSQL.

## Images

### Flutter

- Flutter 3.19.2
- Flutter 3.22.1
- Flutter 3.24.1
- Flutter 3.35.1
- Flutter 3.38.5
- Flutter 3.47.9

### PostgreSQL

- PostgreSQL 18.6
- PostgreSQL 16.0
- PostgreSQL 15.4
- PostgreSQL 14.2
- PostgreSQL 9.6 (legacy; use only when compatibility requires it)

## Using PostgreSQL

```sh
docker run --name postgres-teste \
  -e POSTGRES_PASSWORD=your-strong-password \
  -p 5432:5432 \
  -v postgres-data:/var/lib/postgresql \
  -d danilo55555/postgres:18.6
```

For PostgreSQL 17 and older, mount the data volume at `/var/lib/postgresql/data` instead. PostgreSQL 18 uses a different data directory layout and cannot directly use a database from an older major version. Back up and migrate existing databases using dump and restore or `pg_upgrade` before upgrading.

Images are published to [Docker Hub](https://hub.docker.com/u/danilo55555). Flutter images support `linux/amd64` and `linux/arm64/v8`; PostgreSQL images are currently built for `linux/amd64`.

The `latest` tag points to the highest versioned directory with a Dockerfile: currently Flutter 3.47.9 and PostgreSQL 18.6. Adding a newer version automatically changes `latest`, including across major versions. Updating `latest` from PostgreSQL 16 to 18 is a major upgrade and requires data migration; use versioned tags to avoid unexpected upgrades.

## Building and publishing locally

From the repository root, run:

```sh
./flutter/build.sh
./postgres/build.sh
```

The scripts resolve paths relative to their location, so they can also be invoked by path from another working directory. Docker must be installed and logged in to Docker Hub (`docker login`). The Flutter script requires Docker Buildx. It publishes multi-platform images; the PostgreSQL script builds for the local Docker platform.

To add a release, create a directory named with a numeric dotted version (for example `postgres/18.7`) containing its `Dockerfile`. The local scripts and CI discover it automatically and build every discovered version. Only add releases that are ready to become `latest` if they have the highest version. Add the directory to `.github/dependabot.yml` separately if you want Dependabot to monitor its base image.

## Automated builds

GitHub Actions builds all images on pull requests but does not publish them. Changes merged or pushed to `main` trigger builds and publish the versioned tags and the `latest` tags listed above. Configure the repository Actions secrets `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` with a Docker Hub account and access token to enable publishing. Dependabot checks Docker base images and GitHub Actions for updates weekly.