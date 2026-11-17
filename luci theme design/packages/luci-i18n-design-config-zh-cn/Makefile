#
# Chinese (zh-cn) translation for luci-app-design-config (prebuilt payload).
#
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-i18n-design-config-zh-cn
PKG_VERSION:=1.3
PKG_RELEASE:=20230306

PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/luci-i18n-design-config-zh-cn
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=Chinese (zh-cn) translation for luci-app-design-config
  DEPENDS:=luci-app-design-config
  PKGARCH:=all
endef

define Package/luci-i18n-design-config-zh-cn/description
  Chinese translation for luci-app-design-config (prebuilt payload).
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/luci-i18n-design-config-zh-cn/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(CURDIR)/src/. $(1)/
	-chmod +x $(1)/etc/uci-defaults/*
endef

$(eval $(call BuildPackage,luci-i18n-design-config-zh-cn))
