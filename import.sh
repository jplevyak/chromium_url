#!/bin/sh
# Download the latest and previous versions of the Chromium url library.
# This makes it easy to run "diff -r -u" and "patch -p2".
top=src
icu_version=m72
prefix=https://chromium.googlesource.com/chromium/src.git/+archive
# See METADATA for current update efforts.
mkdir $top
for version in 74.0.3729.15
do
  for d in base build net url
  do
    wget $prefix/$version/$d.tar.gz
    mkdir $top/$d
    cat $d.tar.gz | gunzip | (cd $top/$d; tar fx -)
  done
done
wget https://chromium.googlesource.com/chromium/deps/icu/+archive/refs/heads/chromium/$icu_version.tar.gz
mv $icu_version.tar.gz icu.tar.gz
mkdir $top/third_party
mkdir $top/third_party/icu
cat icu.tar.gz | gunzip | (cd $top/third_party/icu; tar fx - source/common)

echo CLEANUP: rm base.tar.gz build.tar.gz net.tar.gz url.tar.gz icu.tar.gz
