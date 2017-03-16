#
# Copyright (C) 2006 OpenWrt.org
# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fribidi
PKG_VERSION:=0.19.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://fribidi.org/download
PKG_HASH:=08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fribidi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU FriBidi is an implementation of the Unicode Bidirectional Algorithm (bidi)
  URL:=http://fribidi.org
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

CONFIGURE_ARGS += --without-glib
TARGET_CFLAGS += -D_GNU_SOURCE

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/fribidi $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/{pkgconfig,*.so*} $(1)/usr/lib/
endef

define Package/fribidi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,fribidi))
