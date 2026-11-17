#
# Prebuilt LuCI Design theme, packaged for the OpenWrt build system.
# The payload lives in ./src and is installed through the normal package
# install stage, so it is registered in the opkg database like any other
# compiled package.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-theme-design
PKG_VERSION:=5.7.6
PKG_RELEASE:=20231212

PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/luci-theme-design
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=Themes
  TITLE:=Design theme for LuCI
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Package/luci-theme-design/description
  The Design theme for LuCI (prebuilt payload, installed via opkg).
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/luci-theme-design/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(CURDIR)/src/. $(1)/
	-chmod +x $(1)/etc/uci-defaults/*
endef

$(eval $(call BuildPackage,luci-theme-design))
