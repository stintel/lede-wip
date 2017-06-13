# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=kodi-pvr-hts
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/kodi-pvr/pvr.hts.git
PKG_SOURCE_DATE:=2017-02-23
PKG_SOURCE_VERSION:=5bf84c3acde83bc5172be7aeaf36543726fb8ada

PKG_BUILD_DEPENDS:=kodi

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/kodi-pvr-hts
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=kodi-pvr-hts
  URL:=http://www.kodi.tv
  DEPENDS:=+libkodiplatform +libstdcpp
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

CMAKE_OPTIONS += \
	-DCMAKE_MODULE_PATH=$(STAGING_DIR_ROOT)/usr/share/kodi/cmake \
	-DKodi_DIR=$(STAGING_DIR_ROOT)/usr/share/kodi/cmake

EXTRA_CXXFLAGS += -I$(STAGING_DIR)/usr/include/kodi
MAKE_FLAGS += VERBOSE=1

define Package/kodi-pvr-hts/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/kodi $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/share/kodi $(1)/usr/share
endef

$(eval $(call BuildPackage,kodi-pvr-hts))
