# SPDX-FileCopyrightText: 2018-2023 Stijn Tintel <stijn@linux-ipv6.be>
# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=suricata
PKG_VERSION:=7.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.openinfosecfoundation.org/download/
PKG_HASH:=b4eb604838ef99a8396bc8b7bb54cad11f2442cbd7cbb300e7f5aab19097bc4d

PKG_LICENSE:=GPL-2

PKG_BUILD_DEPENDS:=rust/host
PKG_FIXUP:=autoreconf libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/rust/rust-values.mk

define Package/suricata/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Open Source IDS / IPS / NSM
  URL:=https://suricata.io/
endef

define Package/suricata
$(call Package/suricata/Default)
  TITLE += Engine
  DEPENDS:= \
	+SURICATA_AF_XDP:libelf \
	+SURICATA_AF_XDP:libxdp \
	+SURICATA_BFP:libbpf \
	+SURICATA_NFLOG:libnetfilter-log \
	+SURICATA_NFQUEUE:libnetfilter-queue \
	+SURICATA_PF_RING:libpfring \
	+SURICATA_REDIS:libhiredis \
	+jansson \
	+libatomic \
	+libcap-ng \
	+libmagic \
	+libnetfilter-queue \
	+libnfnetlink \
	+libpcap \
	+libpcre2 \
	+libyaml \
	+zlib
endef

define Package/suricata-update
$(call Package/suricata/Default)
  TITLE += Rule Updater
endef

define Package/suricata/config
	source "$(SOURCE)/Config.in"
endef

define Package/suricata/description
  Suricata is a high performance, open source network analysis and threat detection software.
endef

define Package/suricata/conffiles
  /etc/suricata
endef

CONFIGURE_ARGS += \
	$(if $(CONFIG_PKG_ASLR_PIE),--enable-pie,--disable-pie) \
	$(if $(CONFIG_SURICATA_AF_PACKET),--enable-af-packet,--disable-af-packet) \
	$(if $(CONFIG_SURICATA_AF_XDP),--enable-af-xdp,--disable-af-xdp) \
	$(if $(CONFIG_SURICATA_BFP),--enable-ebpf,--disable-ebpf) \
	$(if $(CONFIG_SURICATA_NFLOG),--enable-nflog,--disable-nflog) \
	$(if $(CONFIG_SURICATA_NFQUEUE),--enable-nfqueue,--disable-nfqueue) \
	$(if $(CONFIG_SURICATA_PF_RING),--enable-pfring,--disable-pfring) \
	$(if $(CONFIG_SURICATA_REDIS),--enable-hiredis,--disable-hiredis) \
	--enable-detection \
	--disable-gccmarch-native \
	--enable-gccprotect \
	--enable-jansson \
	--enable-python \
	--enable-suricata-update

CONFIGURE_VARS += \
	CARGO_BUILD_TARGET=$(RUSTC_TARGET_ARCH) \
	CARGO_HOME=$(CARGO_HOME) \
	ac_cv_path_CARGO=$(CARGO_HOME)/bin/cargo \
	ac_cv_path_RUSTC=$(CARGO_HOME)/bin/rustc

MAKE_FLAGS += \
	CARGO_CFG_TARGET_ENV="musl" \
	RUST_LDADD="../rust/target/$(RUSTC_TARGET_ARCH)/release/libsuricata.a -ldl -lrt -lm" \
	RUST_SURICATA_LIB=../rust/target/$(RUSTC_TARGET_ARCH)/release/libsuricata.a \
	host_triplet=$(RUSTC_TARGET_ARCH)

MAKE_VARS += \
	PATH="$(CARGO_HOME)/bin:$(PATH)"

define Package/suricata/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/suricata.init $(1)/etc/init.d/suricata
	$(INSTALL_DIR) $(1)/etc/suricata
	$(INSTALL_CONF) \
		$(PKG_BUILD_DIR)/etc/{classification,reference}.config \
		$(PKG_BUILD_DIR)/suricata.yaml \
		$(PKG_BUILD_DIR)/threshold.config \
		$(1)/etc/suricata
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/suricata.yaml $(1)/etc/suricata
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/suricata $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

define Package/suricata-update/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/suricata-update $(1)/usr/bin
endef

$(eval $(call BuildPackage,suricata))
$(eval $(call BuildPackage,suricata-update))
