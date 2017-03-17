# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libass
PKG_VERSION:=0.13.6
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/libass/libass/releases/download/$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_HASH:=f8a874d104e3e72e2cc057e5a1710c650b10367486845a26e5ff28ed7a912c2d

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libass
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+fontconfig +fribidi +libfreetype
  TITLE:=libass
  URL:=https://github.com/libass/libass
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

ifneq ($(CONFIG_TARGET_x86),)
ifeq ($(CONFIG_YASM),y)
  CONFIGURE_VARS+= AS=yasm
  MAKE_FLAGS+= AS=yasm
else
  CONFIGURE_VARS+= AS=
  MAKE_FLAGS+= AS=
  CONFIGURE_ARGS += --disable-asm
endif
endif

CONFIGURE_ARGS += \
	--enable-fontconfig \
	--disable-harfbuzz \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/ass $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ass/*.h $(1)/usr/include/ass/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/{pkgconfig,*.so*} $(1)/usr/lib/
endef

define Package/libass/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libass))
