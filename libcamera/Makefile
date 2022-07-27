# if python3 exists in STAGING_DIR_HOSTPKG, this is used, lacks jinja2, ply and yaml
# workaround: mv staging_dir/hostpkg/bin/python3 staging_dir/hostpkg/bin/python3_foo
#
# meson finds host boost if boost is not enabled - adding boost as dependency fixes this
# but meson should rather fail than using host lib

include $(TOPDIR)/rules.mk

PKG_NAME:=libcamera
PKG_RELEASE:=0

PKG_SOURCE_DATE:=2022-07-13
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://git.libcamera.org/libcamera/libcamera.git
PKG_SOURCE_VERSION:=3e15e8c6c39ced004b1a934c66ef250bf3df7a2f
PKG_MIRROR_HASH:=2d91e8e104ce739d8f31d765f5f0b769e0b1c53c0acdafedc549d452397b75b1

PKG_MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
PKG_LICENSE:=LGPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING.rst

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/cam
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS+=+libcamera +libevent2
  TITLE:=cam
endef

define Package/cam/description
  Libcamera's cam utility.
endef

define Package/libcamera/default
  URL:=https://libcamera.org/
endef

define Package/libcamera
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+boost +libevent2-pthreads +libgnutls +libopenssl +libudev-zero +libyaml
  #DEPENDS:=+libgnutls +libopenssl +python3-jinja2-src +python3-ply-src +python3-yaml-src
  TITLE:=libcamera
endef

define Package/libcamera/description
  An open source camera stack and framework for Linux
endef

#MESON_VARS+=LIBRARY_PATH=$(STAGING_DIR)/usr/lib
MESON_VARS += PATH="$(STAGING_DIR_HOST)/bin:$(PATH)"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libcamera/libcamera/{base,ipa}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/libcamera/libcamera/*.h \
		$(1)/usr/include/libcamera/libcamera
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/libcamera/libcamera/base/*.h \
		$(1)/usr/include/libcamera/libcamera/base
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/libcamera/libcamera/ipa/*.h \
		$(1)/usr/include/libcamera/libcamera/ipa
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig
endef

define Package/cam/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cam $(1)/usr/bin
endef

define Package/libcamera/install
	$(INSTALL_DIR) $(1)/usr/lib/libcamera
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcamera/*.so* $(1)/usr/lib/libcamera
endef


$(eval $(call BuildPackage,cam))
$(eval $(call BuildPackage,libcamera))
