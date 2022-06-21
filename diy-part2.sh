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

# Modify default IP
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

echo '修改机器名称'
sed -i 's/OpenWrt/FWLEDE/g' package/base-files/files/bin/config_generate

echo '签名'
sed -i "s/OpenWrt /$(date +%Y.%m.%d) by FANTASYW /g" package/lean/default-settings/files/zzz-default-settings

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo '修改banner'
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/
