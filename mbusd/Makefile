# Copyright (C) 2019 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=mbusd
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/3cky/mbusd/archive/v$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=8458afc455a28c8f798cadd3982f9e03496a494a2269e31e8255a6ca273a6898

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/mbusd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=mbusd
  URL:=https://github.com/3cky/mbusd
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

define Package/mbusd/conffiles
/etc/config/mbusd
endef

define Package/mbusd/install
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d $(1)/usr/bin
	$(INSTALL_CONF) ./files/mbusd.config $(1)/etc/config/mbusd
	$(INSTALL_BIN) ./files/mbusd.init $(1)/etc/init.d/mbusd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mbusd $(1)/usr/bin
endef

$(eval $(call BuildPackage,mbusd))
