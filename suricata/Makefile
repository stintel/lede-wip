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
# We cannot include rust-package.mk as there is no Cargo.toml in the topdir.
# The suricata Makefile calls cargo to build Rust code in rust/.
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
	$(RUST_ARCH_DEPENDS) \
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
	$(if $(CONFIG_SURICATA_BPF),--enable-ebpf,--disable-ebpf) \
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

# Notes
# As OpenWrt doesn't have cbindgen we need to disable it to prevent host include/lib leakage
# Disable docs build as it fails and we will not include them in the package anyway
CONFIGURE_VARS += \
	ac_cv_path_CARGO=$(STAGING_DIR)/host/bin/cargo \
	ac_cv_path_CBINDGEN=no \
	ac_cv_path_RUSTC=$(STAGING_DIR)/host/bin/rustc \
	ac_cv_path_SPHINX_BUILD=no

# Notes
# RUST_TARGET:
# - defaults to --target $host_triplet
# - $host_triple has -openwrt- instead of -unknown-
# - the -openwrt- host triplet is not a valid rust target
# - overriding host_triplet might have unexpected behaviour
# RUST_SURICATA_LIB:
# - default path is based on $host_triplet which does not match RUST_TARGET above
# - for some reason the lib filename is not libsuricata_rust.a
#
# TODO
# * don't harcode CARGO_CFG_TARGET_ENV=musl
# * remove CARGO_TERM_VERBOSE=true
MAKE_FLAGS += \
	$(CARGO_PKG_CONFIG_VARS) \
	CARGO_CFG_TARGET_ENV="musl" \
	CARGO_TERM_VERBOSE=true \
	RUST_SURICATA_LIB=../rust/target/$(RUSTC_TARGET_ARCH)/release/libsuricata.a \
	RUST_TARGET="--target $(RUSTC_TARGET_ARCH)"

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
