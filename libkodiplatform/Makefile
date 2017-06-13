# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libkodiplatform
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/xbmc/kodi-platform.git
PKG_SOURCE_DATE:=2017-03-06
PKG_SOURCE_VERSION:=36fb49371dbce49bf470a5bb1fc51b74b4a3612d

PKG_BUILD_DEPENDS:=kodi

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libkodiplatform
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libkodiplatform
  URL:=http://www.kodi.tv
  DEPENDS:=+kodi +libstdcpp +tinyxml
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

CMAKE_OPTIONS += \
	-DCMAKE_MODULE_PATH=$(STAGING_DIR_ROOT)/usr/share/kodi/cmake \
	-DKodi_DIR=$(STAGING_DIR_ROOT)/usr/share/kodi/cmake

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/kodi/util $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/kodi/util/*.h $(1)/usr/include/kodi/util
endef

define Package/libkodiplatform/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libkodiplatform.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,libkodiplatform))
