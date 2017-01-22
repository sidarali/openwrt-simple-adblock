#
# Copyright (c) 2017 Stan Grishin (openwrt@melmac.net)
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=simple-adblock
PKG_VERSION:=4.1.3
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0+
PKG_MAINTAINER:=Stan Grishin <openwrt@melmac.net>

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Simple Adblock Service
	PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
This service provides dnsmasq-based ad blocking.
Please see the README for further information.

endef

define Package/$(PKG_NAME)/conffiles
/etc/config/adblock
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/adblock.init $(1)/etc/init.d/adblock

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/adblock.conf $(1)/etc/config/adblock

endef

$(eval $(call BuildPackage,$(PKG_NAME)))