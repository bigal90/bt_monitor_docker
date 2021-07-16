FROM alpine:latest

VOLUME /config

RUN apk add --no-cache \
        openrc \
        coreutils \
        procps \
        gawk \
        git \
        bash \
        curl \
        mosquitto \
        mosquitto-clients \
        bc \
        bluez \
        bluez-deprecated \
        bluez-btmon \
        dumb-init \
        tzdata \
    && git clone git://github.com/andrewjfreyer/monitor /monitor

WORKDIR /monitor

# Set up the entry point script and default command
COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

ENTRYPOINT ["dumb-init", "--"]

# Standard Operation
# CMD ["bash", "monitor.sh", "-D", "/config", "-b" "-tr"]

# Helper Operation
CMD ["bash", "monitor.sh", "-D", "/config", "-tadr"]

# docker build --tag mashupmill/presence-monitor . && docker run --rm -it --name monitor --net host --privileged --volume ~/monitor/config:/config mashupmill/presence-monitor -b -r
