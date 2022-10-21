#!/bin/bash

#  install_ss_local.sh
#  ShadowsocksX-NG
#
#  Created by 邱宇舟 on 16/6/6.
#  Copyright © 2016年 qiuyuzhou. All rights reserved.


cd "$(dirname "${BASH_SOURCE[0]}")"

NGDir="$HOME/Library/Application Support/ShadowsocksX-NG"
TargetDir="$NGDir/ss-local-3.3.5"
LatestTargetDir="$NGDir/ss-local-latest"

echo ngdir: ${NGDir}

# 3.3.5_4 https://ghcr.io/v2/homebrew/core/shadowsocks-libev/
mkdir -p "$TargetDir"
cp -f ss-local "$TargetDir"
rm -f "$LatestTargetDir"
ln -s "$TargetDir" "$LatestTargetDir"

# 4.33 https://ghcr.io/v2/homebrew/core/libev/
cp -f libev.4.dylib "$TargetDir"

# 2.28.1 https://ghcr.io/v2/homebrew/core/mbedtls/2/
cp -f libmbedcrypto.2.dylib "$TargetDir"
ln -sfh  "$TargetDir/libmbedcrypto.2.dylib" "$TargetDir/libmbedcrypto.3.dylib"
ln -sfh  "$TargetDir/libmbedcrypto.2.dylib" "$TargetDir/libmbedcrypto.7.dylib"

# 8.45 https://ghcr.io/v2/homebrew/core/pcre/
cp -f libpcre.1.dylib "$TargetDir"

# 1.0.18_1 https://ghcr.io/v2/homebrew/core/libsodium/
cp -f libsodium.23.dylib "$TargetDir"
ln -sfh "$TargetDir/libsodium.23.dylib" "$TargetDir/libsodium.dylib"

#cp -f libudns.0.dylib "$TargetDir"

# 1.18.1_1 https://ghcr.io/v2/homebrew/core/c-ares/
cp -f libcares.2.dylib "$TargetDir"
ln -sfh "$TargetDir/libcares.2.dylib" "$TargetDir/libcares.dylib"

echo done
