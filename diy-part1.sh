#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

echo "src-git helloworld https://github.com/fw876/helloworld.git;master" >> "feeds.conf.default"
#echo "src-git customsd https://github.com/Ljzkirito/smartdns-openwrt.git;Release46-conf" >> "feeds.conf.default"

# Remove 6in4
sed -i 's/ +6in4//g' package/emortal/ipv6-helper/Makefile
sed -i '/hotplug.d/d' package/emortal/ipv6-helper/Makefile
rm -fv package/emortal/ipv6-helper/files/60-6in4
# Remove zram-swap
sed -i 's/ zram-swap//g' target/linux/ramips/Makefile
# Remove luci-app-eqos-mtk
#sed -i 's/ luci-app-eqos-mtk//g' target/linux/ramips/Makefile
# Remove mtkhqos_util
#sed -i 's/ mtkhqos_util//g' target/linux/ramips/mt7621/target.mk

# Remove mwan3helper-chinaroute
sed -i 's/ luci-app-mwan3helper-chinaroute//g' target/linux/ramips/mt7621/target.mk
# Remove luci-app-oaf
sed -i 's/  luci-app-oaf//g' target/linux/ramips/mt7621/target.mk
