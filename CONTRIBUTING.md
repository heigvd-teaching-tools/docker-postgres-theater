# Dev

## Build the docker image

```bash
docker build -t docker-postgres-theater  .
```

## Test the docker image

```bash
docker run --rm -p 5432:5432 --name test-db -d docker-postgres-theater 
```

## Publish the docker image

```bash
docker login ghcr.io # see https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic
docker tag docker-postgres-theater:latest ghcr.io/heigvd-teaching-tools/docker-postgres-theater:latest
docker push ghcr.io/heigvd-teaching-tools/docker-postgres-theater:latest
```

## Use the docker image in nodejs

```bash
npm install
node main.js
```