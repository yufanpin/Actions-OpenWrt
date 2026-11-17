#
# LuCI page for the Design theme configuration (prebuilt payload).
#
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-design-config
PKG_VERSION:=1.3
PKG_RELEASE:=20230306

PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-design-config
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI page for Design Config
  DEPENDS:=+luci-compat
  PKGARCH:=all
endef

define Package/luci-app-design-config/description
  LuCI page to configure the Design theme (prebuilt payload).
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/luci-app-design-config/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(CURDIR)/src/. $(1)/
	-chmod +x $(1)/etc/uci-defaults/*
endef

$(eval $(call BuildPackage,luci-app-design-config))
