# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=tinyxml
PKG_VERSION:=2.6.2
PKG_RELEASE:=1

PKG_SOURCE_URL:=@SF/tinyxml
PKG_SOURCE:=$(PKG_NAME)_$(subst .,_,$(PKG_VERSION)).tar.gz
PKG_HASH:=15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tinyxml
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=tinyxml
  URL:=http://www.grinninglizard.com/tinyxml/
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
  DEPENDS:=+libstdcpp
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) ./files/Makefile-3 $(PKG_BUILD_DIR)/Makefile
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_BUILD_DIR)/*.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/*.{a,so*} $(1)/usr/lib
	$(CP) ./files/tinyxml.pc $(1)/usr/lib/pkgconfig/tinyxml.pc
endef

define Package/tinyxml/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,tinyxml))
