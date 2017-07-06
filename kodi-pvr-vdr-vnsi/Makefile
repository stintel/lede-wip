# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=kodi-pvr-vdr-vnsi
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/FernetMenta/pvr.vdr.vnsi.git
PKG_SOURCE_DATE:=2017-07-03
PKG_SOURCE_VERSION:=b4c5cf77e6bf8fde0b052f7abc8732112ec79300

PKG_BUILD_DEPENDS:=kodi

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/kodi-pvr-vdr-vnsi
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=kodi-pvr-vdr-vnsi
  URL:=http://www.kodi.tv
  DEPENDS:=+libkodiplatform +libstdcpp
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

CMAKE_OPTIONS += \
	-DCMAKE_MODULE_PATH=$(STAGING_DIR_ROOT)/usr/share/kodi/cmake \
	-DKodi_DIR=$(STAGING_DIR_ROOT)/usr/share/kodi/cmake

EXTRA_CXXFLAGS += -I$(STAGING_DIR)/usr/include/kodi
MAKE_FLAGS += VERBOSE=1

define Package/kodi-pvr-vdr-vnsi/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/kodi $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/share/kodi $(1)/usr/share
endef

$(eval $(call BuildPackage,kodi-pvr-vdr-vnsi))
