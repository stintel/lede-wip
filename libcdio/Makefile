# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libcdio
PKG_VERSION:=0.94
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://ftp.gnu.org/gnu/libcdio/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=96e2c903f866ae96f9f5b9048fa32db0921464a2286f5b586c0f02699710025a

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libcdio/default
  SECTION:=libs
  CATEGORY:=Libraries
  URL:=https://www.gnu.org/software/libcdio/
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

define Package/libcdio
  $(call Package/libcdio/default)
  TITLE:=libcdio
endef

define Package/libcdiopp
  $(call Package/libcdio/default)
  TITLE:=libcdio++
  DEPENDS:=+libcdio +libstdcpp
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/{pkgconfig,*.{a,so*}} $(1)/usr/lib/
endef

define Package/libcdio/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcdio.so* $(1)/usr/lib/
endef

define Package/libcdiopp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcdio++.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libcdio))
$(eval $(call BuildPackage,libcdiopp))
