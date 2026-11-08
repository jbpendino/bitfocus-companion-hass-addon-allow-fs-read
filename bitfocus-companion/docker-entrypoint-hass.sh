#!/usr/bin/env bash
set -e

# Upstream Companion v5 docker-entrypoint.sh, with Node permission flags on the
# node binary command line (not NODE_OPTIONS — Node 26 rejects legacy/experimental
# permission flags in NODE_OPTIONS).

export COREPACK_ENABLE_DOWNLOAD_PROMPT=0

export COMPANION_IN_CONTAINER=1

if [ -d /app/module-local-dev ]; then
  echo "Installing dependencies for all local dev modules..."
  for module in $(ls /app/module-local-dev/); do
    cd /app/module-local-dev/$module
    if [ -d node_modules ]; then
      echo "Skipping installation of module $module dependencies, to force, remove its node_modules directory"
    else
      echo "Installing dependencies for module $module"

      YARN_VERSION=$(yarn -v)
      if [[ $YARN_VERSION == "1.*" ]] ; then
        yarn install --prod
      else
        yarn workspaces focus --production
      fi

      if jq -e '.scripts.build' package.json > /dev/null; then
        yarn run build
      fi
    fi
  done
fi

cd /app

# Permission model (Node 26: --permission, not --experimental-permission). Grants
# needed for Companion when permissions are active; --allow-fs-read=* keeps local modules working.
NODE=(
  ./node-runtimes/main/bin/node
  --permission
  --allow-fs-read=*
  --allow-fs-write=*
  --allow-net
  --allow-child-process
  --allow-worker
  --allow-addons
)
CONFIG_TOOL=("${NODE[@]}" ./config-tool.js)

export COMPANION_CONFIG_FILE="${COMPANION_CONFIG_FILE:-$COMPANION_CONFIG_BASEDIR/config.yaml}"

"${CONFIG_TOOL[@]}" init \
  --set adminAddress=:: \
  --set adminPort="${COMPANION_ADMIN_PORT:-8000}"

"${CONFIG_TOOL[@]}" validate

snippet="$("${CONFIG_TOOL[@]}" generate)"

extra_args=("$@")
set --
eval "$snippet"

exec "${NODE[@]}" ./main.js \
  --config-dir "$COMPANION_CONFIG_BASEDIR" \
  --extra-module-path /app/module-local-dev \
  "$@" "${extra_args[@]}"
