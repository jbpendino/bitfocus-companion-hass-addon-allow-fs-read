## 0.2.6
Fix add-on startup on Node v26 bundled with Companion 5.1.2: pass `--permission` and `--allow-fs-read=*` (and required `--allow-*` grants) on the `node` command line via a custom entrypoint instead of `NODE_OPTIONS` (`--experimental-permission` is rejected in `NODE_OPTIONS`).

## 0.2.5
Updated Companion docker image to v5.1.2
- Preserve Node `--allow-fs-read` customization for local module installs (v5 config-tool entrypoint)

## 0.2.4
Updated Companion docker image to v4.1.3

## 0.2.3.1
Updated Companion docker image to v4.1.1
- bugfix

## 0.2.3
Updated Companion docker image to v4.1.1

## 0.2.2
Updated Companion docker image to v4.0.3

## 0.2.1
Updated Companion docker image to v4.0.2
