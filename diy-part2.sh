#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# golang 1.24.x
#rm -rfv feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# Replace luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

# Replace shadowsocks-rust
rm -rfv feeds/helloworld/shadowsocks-rust
git clone https://github.com/sbwml/openwrt_helloworld openwrt_helloworld
cp -rv openwrt_helloworld/shadowsocks-rust feeds/helloworld/shadowsocks-rust
rm -rf openwrt_helloworld

sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
