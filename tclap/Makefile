# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 Stijn Tintel <stijn@linux-ipv6.be>

include $(TOPDIR)/rules.mk

PKG_NAME:=tclap
PKG_RELEASE:=1
PKG_VERSION:=1.4.0-rc1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_HASH:=33e18c7828f76a9e5f2a00afe575156520e383693059ca9bc34ff562927e20c6

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/tclap
  CATEGORY:=Libraries
  SECTION:=libs
  TITLE:=Templatized Command Line Argument Parser
  URL:=http://tclap.sourceforge.net/
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	sed -i '/add_subdirectory(examples)/d' $(PKG_BUILD_DIR)/CMakeLists.txt
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/tclap
	$(CP) $(PKG_INSTALL_DIR)/usr/include/tclap/*.h $(1)/usr/include/tclap
endef

define Package/tclap/install

endef

$(eval $(call BuildPackage,tclap))
