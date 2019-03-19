#!/bin/sh
top=src
gtest_version=release-1.8.1
prefix=https://chromium.googlesource.com/chromium/src.git/+archive
mkdir $top
for version in 74.0.3729.15
do
  for d in base build url
  do
    wget $prefix/$version/$d.tar.gz
    mkdir $top/$d
    cat $d.tar.gz | gunzip | (cd $top/$d; tar fx -)
  done
done
patch -p0 < base.patch

for f in *.tar.gz
do
  tar xfO $f | sha256sum > $f.sha256.new
  if ! diff -q $f.sha256 $f.sha256.new &>/dev/null; then
    >&2 echo "different SHA256 for $f"
  fi
done

echo CLEANUP: rm base.tar.gz build.tar.gz url.tar.gz
