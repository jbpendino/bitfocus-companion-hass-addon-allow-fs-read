ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:4.0.3-8089-stable-b2774d6045@sha256:a48989907ba07ed4acc3a6ee291745ff0162bc75c24aaa069addf03f89b037cc AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:4.0.3-8089-stable-b2774d6045@sha256:2f538bda6b11629537458e266ce97e93c8c6ffd01dcd3b921cfcd3d0d2685794 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]
