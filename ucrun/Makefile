# SPDX-FileCopyrightText: 2022 Stijn Tintel <stijn@linux-ipv6.be>
# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=ucrun
PKG_SOURCE_DATE:=2022-08-12
PKG_SOURCE_VERSION:=5be6abebc4ae6057b47a5b3f0799d5ff01bc60c3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/ucentral-io/ucrun.git
PKG_MIRROR_HASH:=f7c0ba5940bebc9cc46d749961016c99334ed7570898f7668a3fdbca4aa8919a

PKG_MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/ucrun
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=ucode daemon runner
  DEPENDS:=+libblobmsg-json +libubox +libubus +libucode
endef

define Package/ucrun/description
  ucode daemon runner
endef

define Package/ucrun/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ucrun $(1)/usr/bin/ucrun
endef


$(eval $(call BuildPackage,ucrun))
