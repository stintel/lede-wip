#
# Copyright (C) 2018 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=suricata
PKG_VERSION:=4.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.openinfosecfoundation.org/download/
PKG_HASH:=73575b041a50cc48a2a53f6503ab4d355166d7acbd4997cd04045f848f8bea96

PKG_LICENSE:=GPL-2

PKG_FIXUP:=autoreconf libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/suricata
  SECTION:=base
  CATEGORY:=Network
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
  TITLE:=Open Source IDS / IPS / NSM engine
  URL:=https://suricata-ids.org/
  DEPENDS:= \
	+file \
	+iptables-mod-nfqueue \
	+jansson \
	+libcap-ng \
	+libevent2 \
	+libevent2-pthreads \
	+libhiredis \
	+liblz4 \
	+liblzma \
	+libnetfilter-queue \
	+libpcap \
	+libpcre \
	+libmagic \
	+libyaml
endef

define Package/suricata/description
 Suricata is a free and open source, mature, fast and robust network threat
 detection engine.
endef

define Package/suricata/conffiles
  /etc/suricata
endef

CONFIGURE_ARGS += \
	--enable-af-packet \
	--enable-detection \
	--disable-gccmarch-native \
	--enable-gccprotect \
	--enable-hiredis \
	--enable-jansson \
	--enable-nfqueue \
	$(if $(CONFIG_PKG_ASLR_PIE),--enable-pie) \
	$(if $(CONFIG_SURICATA_PF_RING),--enable-pfring) \
	--disable-python \
	--disable-rust \
	--disable-suricata-update

#TARGET_CFLAGS += -O2 -msse3

define Package/suricata/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/suricata.init $(1)/etc/init.d/suricata
	$(INSTALL_DIR) $(1)/etc/suricata
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/*.config $(1)/etc/suricata
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/suricata.yaml $(1)/etc/suricata
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/suricata $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,suricata))
