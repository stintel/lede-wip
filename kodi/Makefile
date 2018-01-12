#
# Copyright (C) 2017  Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kodi
PKG_CODENAME:=Krypton
PKG_VERSION:=17.6
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/xbmc/xbmc/archive/$(PKG_VERSION)-$(PKG_CODENAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_CODENAME).tar.gz
PKG_HASH:=c8312fe92e5bab1cdac1da93d60baed88fa1574146c50c44e3c86d01671c2b1d

PKG_BUILD_DIR:=$(BUILD_DIR)/xbmc-$(PKG_VERSION)-$(PKG_CODENAME)
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/xbmc-$(PKG_VERSION)-$(PKG_CODENAME)

PKG_LICENSE:=GPL-2
PKG_LICENSE_FILES:=LICENSE.GPL

#PKG_AUTOMAKE_PATHS += \
#	lib/cpluff \
#	tools/depends/native/TexturePacker/src \
#	tools/depends/native/JsonSchemaBuilder/src

#PKG_FIXUP:=autoreconf libtool
PKG_BUILD_DEPENDS:=kodi/host libcrossguid python python-setuptools
PKG_BUILD_PARALLEL:=1
PKG_CHECK_FORMAT_SECURITY:=0

HOST_BUILD_DEPENDS:=giflib/host libjpeg/host liblzo/host libpng/host zlib/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
$(call include_mk, python-package.mk)

define Package/kodi/Default
  URL:=https://kodi.org/
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
endef

define Package/kodi
  $(call Package/kodi/Default)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=kodi
  USERID:=kodi=9777:kodi=9777
  DEPENDS:= \
	@(TARGET_brcm2708||TARGET_x86) \
	+TARGET_brcm2708:raspberrypi-userland \
	+TARGET_x86:libegl \
	+alsa-lib \
	+bluez-libs \
	+fontconfig \
	+fribidi \
	+giflib \
	+libass \
	+libavahi-client \
	+libcdiopp \
	+libcec \
	+libcurl \
	+libffmpeg-full \
	+libfreetype \
	+libjpeg \
	+liblzo \
	+libmicrohttpd-no-ssl \
	+libmysqlclient \
	+libopenssl \
	+libpcre \
	+libpcrecpp \
	+libplistcxx \
	+libpng \
	+libsqlite3 \
	+libstdcpp \
	+libupnp \
	+libuuid \
	+libxml2 \
	+libxslt \
	+python-codecs-src \
	+python-ctypes-src \
	+python-email-src \
	+python-logging-src \
	+python-sqlite3-src \
	+python-urllib3 \
	+samba36-libsmbclient \
	+shairplay \
	+taglib \
	+tinyxml \
	+yajl
endef

define Package/kodi/description
Kodi Home Theater Software
endef

CMAKE_OPTIONS += \
	-DCORE_SYSTEM_NAME=rbpi \
	-DWITH_ARCH=arm \
	-DENABLE_ALSA=ON \
	-DENABLE_AIRTUNES=ON \
	-DENABLE_AVAHI=ON \
	-DENABLE_BLUETOOTH=ON \
	-DENABLE_BLURAY=OFF \
	-DENABLE_CAP=OFF \
	-DENABLE_CCACHE=$(if $(CONFIG_CCACHE),YES,NO) \
	-DENABLE_CEC=ON \
	-DENABLE_DBUS=OFF \
	-DENABLE_DVDCSS=OFF \
	-DENABLE_INTERNAL_CROSSGUID=OFF \
	-DENABLE_INTERNAL_FFMPEG=OFF \
	-DENABLE_LIRC=OFF \
	-DENABLE_MICROHTTPD=ON \
	-DENABLE_MYSQLCLIENT=ON \
	-DENABLE_NFS=OFF \
	-DENABLE_NONFREE=OFF \
	-DENABLE_OPENGLES=ON \
	-DENABLE_OPENGL=OFF \
	-DENABLE_OPENSSL=ON \
	-DENABLE_OPTICAL=OFF \
	-DENABLE_PLIST=ON \
	-DENABLE_PULSEAUDIO=OFF \
	-DENABLE_SDL=OFF \
	-DENABLE_SMBCLIENT=ON \
	-DENABLE_SSH=OFF \
	-DENABLE_UDEV=OFF \
	-DENABLE_UPNP=ON \
	-DENABLE_VAAPI=OFF \
	-DENABLE_VDPAU=OFF \
	-DENABLE_X11=OFF \
	-DENABLE_XSLT=ON \
	-DNATIVEPREFIX="$(PKG_BUILD_DIR)/tools/depends/native/JsonSchemaBuilder" \
	-DVERBOSE=1

CMAKE_SOURCE_DIR:=$(PKG_BUILD_DIR)/project/cmake

CMAKE_HOST_OPTIONS:= \
	-DCMAKE_MODULE_PATH=$(HOST_BUILD_DIR)/project/cmake/modules \
	-DCORE_SOURCE_DIR=$(HOST_BUILD_DIR) \
	-DCMAKE_CXX_STANDARD=11

HOST_CMAKE_SOURCE_DIR:=$(HOST_BUILD_DIR)/tools/depends/native/TexturePacker
HOST_CFLAGS+=-DTARGET_POSIX -I$(HOST_BUILD_DIR)/xbmc/linux
HOST_LDFLAGS+=-Wl$(comma)-rpath=$(STAGING_DIR_HOSTPKG)/lib

EXTRA_CPPFLAGS += -D_GNU_SOURCE -D__NEED_FILE -DMESA_EGL_NO_X11_HEADERS

MAKE_FLAGS += VERBOSE=1

define Build/Configure
	(cd $(PKG_BUILD_DIR); BUILDDIR=$(PKG_BUILD_DIR) ./bootstrap )
	# Prevent autoreconf rerun
	sed -e 's/autoreconf -vif/echo "autoreconf already done in src_prepare()"/' -i \
		"$(PKG_BUILD_DIR)/project/cmake/modules/FindCpluff.cmake" \
		"$(PKG_BUILD_DIR)/tools/depends/native/TexturePacker/src/autogen.sh" \
		"$(PKG_BUILD_DIR)/tools/depends/native/JsonSchemaBuilder/src/autogen.sh"
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/kodi $(1)/usr/share/kodi
	$(CP) $(PKG_INSTALL_DIR)/usr/include/kodi/*.h $(1)/usr/include/kodi
	$(CP) $(PKG_INSTALL_DIR)/usr/share/kodi/cmake $(1)/usr/share/kodi
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/TexturePacker $(STAGING_DIR_HOSTPKG)/bin
endef

define Package/kodi/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/lib/kodi $(1)/usr/share/kodi
	$(INSTALL_BIN) ./files/kodi.init $(1)/etc/init.d/kodi
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/kodi/* $(1)/usr/lib/kodi
	$(CP) $(PKG_INSTALL_DIR)/usr/share/kodi/* $(1)/usr/share/kodi
	mkdir -p $(1)/.kodi/{addons,userdata}
endef

define Package/kodi/conffiles
/.kodi/addons
/.kodi/userdata
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,kodi))
