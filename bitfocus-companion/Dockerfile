ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:4.2.0-8570-main-d385ee6810@sha256:c3bf01519604d72d5359dd2c622d5591953e07ccb4c92111838437655f7f6d86 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:4.2.0-8570-main-d385ee6810@sha256:1812f8e6dbfc1774191b430e709d09590849cc3e5fbfafdb7e8c833bc3084d43 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]
