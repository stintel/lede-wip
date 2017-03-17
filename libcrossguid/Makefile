# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libcrossguid
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/graeme-hill/crossguid.git
PKG_SOURCE_DATE:=2016-09-08
PKG_SOURCE_VERSION:=fef89a4174a7bf8cd99fa9154864ce9e8e3bf989

include $(INCLUDE_DIR)/package.mk

define Package/libcrossguid
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libcrossguid
  URL:=https://github.com/graeme-hill/crossguid
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

define Build/Compile
	+$(MAKE_VARS) \
	cd $(PKG_BUILD_DIR); \
		$(TARGET_CXX) -c guid.cpp -o guid.o -std=c++11 -DGUID_LIBUUID
	cd $(PKG_BUILD_DIR); \
		$(TARGET_AR) rs libcrossguid.a guid.o
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcrossguid.a $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/*.h $(1)/usr/include/
endef

$(eval $(call BuildPackage,libcrossguid))
