# Database description

On considère une base de données permettant de gérer des pièces de théâtre. 

De cette base nous avons extrait trois relations : 
- spectacle (num_spec, titre_spec, salle, organisateur) 
- jouer (nom_acteur, num_spec) 
- representation (date_rep, heure_rep, num_spec, tarif) 

Hypothèses de travail : 
- Les spectacles ont lieu à 15h ou à 20h (ou les deux!) 
- Un spectacle donné comprend toujours les mêmes acteurs, quelle que soit la représentation 


# Dev

## Build the docker image

```bash
docker build -t docker-postgres-theater  .
```

## Test the docker image

```bash
docker run -p 5432:5432 --name test-db -d docker-postgres-theater 
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