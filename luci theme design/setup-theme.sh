#!/bin/bash
#
# Install the bundled Design theme into the OpenWrt build tree as normal
# local packages, so the build system installs them through the standard
# package/install stage (registered in the opkg database, upgradeable and
# removable) instead of dumping loose files into the rootfs.
#
# The prebuilt payloads live in ./packages/<pkgname>/src and each package has
# a standard OpenWrt Makefile.
#
# Usage (inside a workflow, after 'load config & DIY_P2_SH'):
#   bash "$GITHUB_WORKSPACE/luci theme design/setup-theme.sh"
#
set -e

if [ -n "$GITHUB_WORKSPACE" ] && [ -d "$GITHUB_WORKSPACE/luci theme design" ]; then
  WORKSPACE="$GITHUB_WORKSPACE"
else
  WORKSPACE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

THEME_DIR="$WORKSPACE/luci theme design"
PKG_SRC="$THEME_DIR/packages"
OPENWRT_DIR="$WORKSPACE/openwrt"

PKGS="luci-theme-design luci-app-design-config luci-i18n-design-config-zh-cn"

[ -d "$PKG_SRC" ] || { echo "ERROR: packages not found at $PKG_SRC" >&2; exit 1; }
[ -d "$OPENWRT_DIR" ] || { echo "ERROR: openwrt tree not found at $OPENWRT_DIR" >&2; exit 1; }

echo "==> Adding Design theme packages to $OPENWRT_DIR/package/design-theme"
# Drop any same-named packages shipped by feeds, otherwise the build system
# aborts with a duplicate package name.
for p in $PKGS; do
  find "$OPENWRT_DIR/feeds" -mindepth 1 -maxdepth 4 -type d -name "$p" \
    -exec rm -rf {} + 2>/dev/null || true
done

rm -rf "$OPENWRT_DIR/package/design-theme"
mkdir -p "$OPENWRT_DIR/package/design-theme"
cp -a "$PKG_SRC/." "$OPENWRT_DIR/package/design-theme/"

CONFIG="$OPENWRT_DIR/.config"
if [ -f "$CONFIG" ]; then
  echo "==> Enabling Design theme packages in .config"
  for p in $PKGS; do
    sed -i "/^# CONFIG_PACKAGE_${p} is not set/d" "$CONFIG"
    grep -q "^CONFIG_PACKAGE_${p}=" "$CONFIG" || echo "CONFIG_PACKAGE_${p}=y" >> "$CONFIG"
  done

  echo "==> Disabling competing themes in .config"
  for t in luci-theme-argon luci-theme-bootstrap luci-theme-aurora luci-theme-material luci-theme-opentomcat; do
    sed -i "s/^CONFIG_PACKAGE_${t}=y/# CONFIG_PACKAGE_${t}=y (disabled by Design theme)/" "$CONFIG"
  done
fi

echo "==> Design theme packages installed; Design is the default theme."
