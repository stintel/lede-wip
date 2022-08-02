include $(TOPDIR)/rules.mk

PKG_NAME:=uhttpd-ucode-examples
PKG_VERSION:=0.0.0
PKG_RELEASE:=0
PKG_LICENSE:=GPL-3.0

PKG_MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/uhttpd-ucode-examples
  SUBMENU:=Web Servers/Proxies
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ucode +ucode-mod-lua +uhttpd +uhttpd-mod-ucode
  TITLE:=uhttpd uCode examples
  PKGARCH:=all
endef

define Package/uhttpd-ucode-examples/description
  Examples of using uCode in uhttpd
endef

define Package/uhttpd-ucode-examples/conffiles
/etc/config/uhttpd-ucode-examples
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/uhttpd-ucode-examples/install
	$(INSTALL_DIR) $(1)
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,uhttpd-ucode-examples))
