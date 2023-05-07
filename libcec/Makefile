# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libcec
PKG_VERSION:=4.0.2
PKG_RELEASE:=2

PKG_SOURCE_URL:=https://github.com/Pulse-Eight/libcec/archive/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=b8b8dd31f3ebdd5472f03ab7d401600ea0d959b1288b9ca24bf457ef60e2ba27

PKG_BUILD_DEPENDS:=libp8-platform
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libcec
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libcec
  DEPENDS:= \
	+TARGET_brcm2708:raspberrypi-userland \
	+libstdcpp
  URL:=http://libcec.pulse-eight.com/
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libcec/ $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libcec/*.h $(1)/usr/include/libcec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/{pkgconfig,*.so*} $(1)/usr/lib
endef

define Package/libcec/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef


define Package/cec-client
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=cec-client
  DEPENDS:=+libcec
endef

define Package/cec-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) -L $(PKG_BUILD_DIR)/src/cec-client/cec-client $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libcec))
$(eval $(call BuildPackage,cec-client))
