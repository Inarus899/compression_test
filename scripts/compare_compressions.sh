#!/bin/bash


verbose_output=false

if [ -z "$1" ]
then
  directory_name=data
else
  directory_name=$1
fi

echo "-- ZIP"
if $verbose_output
  then
  time zip -r $directory_name.zip $directory_name
else
  time zip -qr $directory_name.zip $directory_name
fi

du -bh $directory_name.zip
echo ""

echo "-- RAR"
if $verbose_output
  then
  time rar a -r $directory_name.rar $directory_name
else
  time rar a -r -inul $directory_name.rar $directory_name
fi

du -bh $directory_name.rar
echo ""

echo "-- GZ"
if $verbose_output
  then
  time tar -zcvf $directory_name.tar.gz $directory_name
else
  time tar -zcf $directory_name.tar.gz $directory_name
fi

du -bh $directory_name.tar.gz
echo ""

echo "-- XZ"
if $verbose_output
  then
  time tar -cvf $directory_name.tar.xz $directory_name
else
  time tar -cf $directory_name.tar.xz $directory_name
fi

du -bh $directory_name.tar.xz
echo ""

echo "-- 7ZIP"
if $verbose_output
  then
  time 7za a -bsp0 $directory_name.7z $directory_name
else
  time 7za a -bso0 -bsp0 $directory_name.7z $directory_name
fi

du -bh $directory_name.7z
echo ""

echo "-- 7ZIP mx=9"
if $verbose_output
  then
  time 7za a -bsp0 -mx=9 $directory_name.7z $directory_name
else
  time 7za a -bso0 -bsp0 -mx=9 $directory_name.7z $directory_name
fi

du -bh $directory_name.7z
echo ""
