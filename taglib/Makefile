#
# Copyright (C) 2007-2008 OpenWrt.org
# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=taglib
PKG_VERSION:=1.11.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://taglib.org/releases
PKG_HASH:=b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/taglib/default
  SECTION:=libs
  CATEGORY:=Libraries
  URL:=http://developer.kde.org/~wheeler/taglib.html
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

define Package/taglib
  $(call Package/taglib/default)
  TITLE:=TagLib
  DEPENDS:=+boost +boost-atomic +libstdcpp +zlib
endef

define Package/taglibc
  $(call Package/taglib/default)
  TITLE:=TagLib (C)
  DEPENDS:=+taglib
endef

CMAKE_OPTIONS += -DBUILD_SHARED_LIBS=ON
TARGET_CFLAGS += $(FPIC)

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/taglib-config \
		$(2)/bin/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(2)/bin/taglib-config

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libtag{,_c}.so* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(1)/usr/include/taglib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/taglib/* \
		$(1)/usr/include/taglib/
endef

define Package/taglib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtag.so.* $(1)/usr/lib/
endef

define Package/taglibc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtag_c.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,taglib))
$(eval $(call BuildPackage,taglibc))
