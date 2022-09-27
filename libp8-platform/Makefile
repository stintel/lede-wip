# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libp8-platform
PKG_VERSION:=2.1.0.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/Pulse-Eight/platform/archive/
PKG_SOURCE:=p8-platform-$(PKG_VERSION).tar.gz
PKG_HASH:=064f8d2c358895c7e0bea9ae956f8d46f3f057772cb97f2743a11d478a0f68a0

PKG_BUILD_DIR:=$(BUILD_DIR)/platform-p8-platform-$(PKG_VERSION)
PKG_INSTALL:=1

PKG_USE_NINJA:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libp8-platform
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libp8-platform
  URL:=https://github.com/Pulse-Eight/platform
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

CMAKE_OPTIONS:=-DCMAKE_INSTALL_LIBDIR=/usr/lib

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/p8-platform $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,libp8-platform))
