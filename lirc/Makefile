#
# Copyright (C) 2018 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lirc
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=@SF/${PKG_NAME}
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_HASH:=e57c2de8b1b91325d23f1c14fc553ec7912b0add7891e653d048300d38c3f553

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lirc/Default
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libstdcpp
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

define Package/lirc/description
  LIRC is a package that allows you to decode and send infra-red signals
  of many (but not all) commonly used remote controls.
endef

define Package/libirrecord
$(call Package/lirc/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libirrecord
  DEPENDS:=+liblirc
endef

define Package/liblirc
$(call Package/lirc/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=liblirc
endef

define Package/liblirc-client
$(call Package/lirc/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=liblirc-client
endef

define Package/liblirc-driver
$(call Package/lirc/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+liblirc +libusb-1.0 +libusb-compat
  TITLE:=liblirc-driver
endef

define Package/lircd
$(call Package/lirc/Default)
  DEPENDS:=+liblirc
  TITLE:=LIRC daemon
endef

define Package/lircd-uinput
$(call Package/lirc/Default)
  DEPENDS:=+lircd
  TITLE:=LIRC uinput forwarder daemon
endef


define Package/lircmd
$(call Package/lirc/Default)
  DEPENDS:=+liblirc
  TITLE:=LIRC mouse daemon
endef

CONFIGURE_ARGS += \
	--disable-devinput \
	--disable-static \
	--enable-uinput \
	--with-gnu-ld \
	--without-systemdsystemunitdir \
	--without-x

CONFIGURE_VARS += \
	ac_cv_header_alsa_asoundlib_h=no

define BuildClient
  define Package/lirc-$(1)
    $$(call Package/lirc/Default)
    TITLE:= LIRC $(1) client
    DEPENDS:=+liblirc +liblirc-client $(2)
  endef

  define Package/lirc-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(1) $$(1)/usr/bin
	$(call Plugin/$(1)/install,$$(1))
  endef

  $$(eval $$(call BuildPackage,lirc-$(1)))
endef

define BuildPlugin
  define Package/lirc-plugin-$(1)
    $$(call Package/lirc/Default)
    TITLE:= LIRC $(1) plugin
    DEPENDS:= +lircd +liblirc-driver $(2)
  endef

  define Package/lirc-plugin-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/lirc/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lirc/plugins/$(1).so \
		$$(1)/usr/lib/lirc/plugins/
	$(call Plugin/$(1)/install,$$(1))
  endef

  $$(eval $$(call BuildPackage,lirc-plugin-$(1)))
endef

define Package/lirc/conffiles
/etc/lirc
endef

define Package/libirrecord/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libirrecord.so* $(1)/usr/lib
endef

define Package/liblirc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc.so* $(1)/usr/lib
endef

define Package/liblirc-client/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_client.so* $(1)/usr/lib
endef

define Package/liblirc-driver/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_driver.so* $(1)/usr/lib
endef

define Package/lircd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/lircd.init $(1)/etc/init.d/lircd
	$(INSTALL_DIR) $(1)/etc/lirc/lircd.conf.d
	$(CP) $(PKG_INSTALL_DIR)/etc/lirc/lirc_options.conf $(1)/etc/lirc
	$(CP) $(PKG_INSTALL_DIR)/etc/lirc/lircd.conf $(1)/etc/lirc
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/lircd $(1)/usr/sbin
endef

define Package/lircd-uinput/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/lircd-uinput.init $(1)/etc/init.d/lircd-uinput
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/lircd-uinput $(1)/usr/sbin
endef

define Package/lircmd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/lircmd.init $(1)/etc/init.d/lircmd
	$(INSTALL_DIR) $(1)/etc/lirc
	$(CP) $(PKG_INSTALL_DIR)/etc/lirc/lircmd.conf $(1)/etc/lirc
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/lircmd $(1)/usr/sbin
endef


$(eval $(call BuildPackage,libirrecord))
$(eval $(call BuildPackage,liblirc))
$(eval $(call BuildPackage,liblirc-client))
$(eval $(call BuildPackage,liblirc-driver))
$(eval $(call BuildPackage,lircd))
$(eval $(call BuildPackage,lircd-uinput))
$(eval $(call BuildPackage,lircmd))
$(eval $(call BuildClient,ircat,))
$(eval $(call BuildClient,irexec,))
$(eval $(call BuildClient,irpipe,))
$(eval $(call BuildClient,irpty,))
$(eval $(call BuildClient,irrecord,+libirrecord))
$(eval $(call BuildClient,irsend,))
$(eval $(call BuildClient,irtestcase,))
$(eval $(call BuildClient,irw,))
$(eval $(call BuildClient,lirc-lsremotes,))
$(eval $(call BuildClient,lircrcd,))
$(eval $(call BuildClient,mode2,))
$(eval $(call BuildPlugin,default,))
$(eval $(call BuildPlugin,i2cuser,))
