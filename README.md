# iTFLEX Mattermost Docker image

Mattermost is an open source, self-hosted Slack-alternative

## Versions

* `3`, `3.10`, `3.10.0`, `latest`
* `3.9`, `3.9.0`
* `3.8`, `3.8.0`
* `3.7`, `3.7.1`
* `3.6`, `3.6.2`
* `3.5`, `3.5.0`
* `3.4`, `3.4.0`
* `3.3`, `3.3.0`
* `3.2`, `3.2.0`
* `3.1`, `3.1.0`
* `3.0`, `3.0.3`
* `2`, `2.2`
* `2.1`

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
