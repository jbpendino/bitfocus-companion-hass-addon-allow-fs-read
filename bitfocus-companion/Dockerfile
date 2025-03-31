# Gebruik de officiële Bitfocus Companion image als basis
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Installeer S6-overlay - vereist voor Home Assistant add-ons
ARG BUILD_ARCH
ARG S6_OVERLAY_VERSION=3.1.5.0

# Download S6-overlay
RUN apt-get update && apt-get install -y curl xz-utils
RUN if [ "${BUILD_ARCH}" = "aarch64" ]; then S6_ARCH="aarch64"; \
    elif [ "${BUILD_ARCH}" = "amd64" ]; then S6_ARCH="x86_64"; \
    else S6_ARCH="${BUILD_ARCH}"; fi \
    && curl -L -s "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz" | tar -C / -Jxpf - \
    && curl -L -s "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${S6_ARCH}.tar.xz" | tar -C / -Jxpf -

# Kopieer rootfs bestanden
COPY rootfs /

# Maak scripts uitvoerbaar
RUN chmod a+x /etc/cont-init.d/90-companion.sh \
    && chmod a+x /etc/services.d/companion/run \
    && chmod a+x /etc/services.d/companion/finish

# S6-overlay als entrypoint
ENTRYPOINT ["/init"]
