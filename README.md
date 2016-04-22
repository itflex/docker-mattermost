# iTFLEX Mattermost Docker image

Mattermost is an open source, self-hosted Slack-alternative

## Versions

* `2`, `2.1`, `latest`

## Usage

First setup your database

```sh
docker run -d \
    -e "POSTGRES_USER=mattermost" \
    -e "POSTGRES_PASSWORD=pa55word" \
    --name postgres postgres
```

Then run the mattermost container

```sh
docker run -d --name mattermost -p 8000:80 --link "postgres:postgres" itflex/mattermost
```

Use <http://localhost:8000/> to access the web interface

## Persistent data

This image exposes two volumes:

* `/mattermost/config`: Configuration files
* `/mattermost/data`: Local data Mattermost stores

You can create a docker container with a data volume container using
the following commands:

```sh
docker run -d --name mattermost_data itflex/mattermost /bin/true
docker run -d --name mattermost --volumes-from mattermost_data
```