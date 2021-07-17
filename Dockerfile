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

# docker build --tag alext/monitor .
