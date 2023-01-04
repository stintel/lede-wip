# SPDX-License-Identifier: GPL-2.0-only
#
## Copyright (C) 2022 Stijn Tintel <stijn@linux-ipv6.be>

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=fmlib
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://source.codeaurora.org/external/qoriq/qoriq-components/fmlib
PKG_SOURCE_VERSION:=LSDK-21.08
PKG_MIRROR_HASH:=22687cdccee9f5450ad2cbea7e327e3a80066ca060afcd4c8a293687e34fbc2f

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fmlib
  CATEGORY:=Libraries
  SECTION:=libs
  TITLE:=NXP Frame Manager user space library
endef

define Build/Install
	$(call Build/Install/Default,install-libfm-ppc64e5500-fmv3l)
endef

TARGET_CFLAGS += \
	-I$(LINUX_DIR)/user_headers/include/linux/fmd \
	-I$(LINUX_DIR)/user_headers/include/linux/fmd/Peripherals \
	-I$(LINUX_DIR)/user_headers/include/linux/fmd/integrations

define Package/fmlib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/*.a $(1)/usr/lib
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/fmd
	$(CP) $(PKG_BUILD_DIR)/include/fmd/* $(1)/usr/include/fmd
endef

$(eval $(call BuildPackage,fmlib))
