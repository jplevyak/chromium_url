#!/bin/sh
top=src
icu_version=m72
gtest_version=release-1.8.1
prefix=https://chromium.googlesource.com/chromium/src.git/+archive
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
wget https://github.com/google/googletest/archive/$gtest_version.tar.gz
mv $gtest_version.tar.gz gtest.tar.gz
mkdir testing
tar xf gtest.tar.gz
mv googletest-$gtest_version/googletest testing/gtest
rm -r googletest-$gtest_version
patch -p0 < base.patch
patch -p0 < url.patch

for f in *.tar.gz
do
  tar xfO $f | sha256sum > $f.sha256.new
  if ! diff -q $f.sha256 $f.sha256.new &>/dev/null; then
    >&2 echo "different SHA256 for $f"
  fi
done

echo CLEANUP: rm base.tar.gz build.tar.gz net.tar.gz url.tar.gz icu.tar.gz gtest.tar.gz
