FROM alpine:3.3

WORKDIR /mattermost
VOLUME ["/mattermost/data", "/mattermost/config"]
EXPOSE 80

ADD https://releases.mattermost.com/2.1.0/mattermost-team-2.1.0-linux-amd64.tar.gz /
RUN tar -C / -xzvf /mattermost-team-2.1.0-linux-amd64.tar.gz --no-same-owner && \
	rm -rf /mattermost-team-2.1.0-linux-amd64.tar.gz

COPY config.json /mattermost/config/

CMD ["/mattermost/bin/platform", "-config=/mattermost/config/config.json"]
