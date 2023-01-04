# SPDX-License-Identifier: GPL-2.0-only
#
## Copyright (C) 2022 Stijn Tintel <stijn@linux-ipv6.be>

include $(TOPDIR)/rules.mk

PKG_NAME:=fmc
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://source.codeaurora.org/external/qoriq/qoriq-components/fmc
PKG_SOURCE_VERSION:=LSDK-21.08
PKG_MIRROR_HASH:=a5d94accbbe379b9b2c85d43decd1fd49914a4502f9e936821af1de0b3623c40

PKG_BUILD_DEPENDS:=tclap

PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/fmc
  CATEGORY:=Utilities
  DEPENDS:=+fmlib +libstdcpp +libxml2
  SECTION:=libs
  TITLE:=NXP Frame Manager Configuration tool
endef

MAKE_PATH:=source
MAKE_VARS += \
	FMD_USPACE_HEADER_PATH=$(STAGING_DIR)/usr/include/fmd \
	FMD_USPACE_LIB_PATH=$(STAGING_DIR_ROOT)/usr/lib \
	LIBXML2_HEADER_PATH=$(STAGING_DIR)/usr/include/libxml2 \
	MACHINE=t1040qds \
	TCLAP_HEADER_PATH=$(STAGING_DIR)/usr/include

#TARGET_CFLAGS += \
#	-I$(STAGING_DIR)/usr/include/fmd \
#	-I$(STAGING_DIR)/usr/include/fmd/Peripherals \
#	-I$(STAGING_DIR)/usr/include/fmd/integrations \

TARGET_CFLAGS += -mvsx

define Package/fmc/install
	$(INSTALL_DIR) $(1)/etc/fmc/config $(1)/usr/bin
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/etc/fmc/config/* $(1)/etc/fmc/config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/fmc $(1)/usr/bin
endef

$(eval $(call BuildPackage,fmc))
