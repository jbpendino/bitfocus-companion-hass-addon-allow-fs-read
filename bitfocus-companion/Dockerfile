ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:4.1.3-8475-stable-02928d8be8@sha256:1f1caa3ebc658438bfe18e406ee6a2dd04d71efff181b1da54a425cf97f02a70 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:4.1.3-8475-stable-02928d8be8@sha256:fa0b75e93db70d8518afd7cffca2a55393ab0aa9ae4f2462ef58388f18c20399 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]
