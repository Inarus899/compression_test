#!/bin/bash


verbose_output=false

if [ -z "$1" ]
then
  directory_name=data
else
  directory_name=$1
fi

filename=$(basename $directory_name)

echo "-- ZIP"
if $verbose_output
  then
  time zip -r $filename.zip $directory_name
else
  time zip -qr $filename.zip $directory_name
fi

du -h $filename.zip
echo ""

echo "-- RAR"
if $verbose_output
  then
  time rar a -r $filename.rar $directory_name
else
  time rar a -r -inul $filename.rar $directory_name
fi

du -h $filename.rar
echo ""

echo "-- GZ"
if $verbose_output
  then
  time tar -zcvf $filename.tar.gz $directory_name
else
  time tar -zcf $filename.tar.gz $directory_name
fi

du -h $filename.tar.gz
echo ""

echo "-- XZ"
if $verbose_output
  then
  time tar -cvf $filename.tar.xz $directory_name
else
  time tar -cf $filename.tar.xz $directory_name
fi

du -h $filename.tar.xz
echo ""

echo "-- 7ZIP"
if $verbose_output
  then
  time 7za a -bsp0 $filename.7z $directory_name
else
  time 7za a -bso0 -bsp0 $filename.7z $directory_name
fi

du -h $filename.7z
echo ""

echo "-- 7ZIP mx=9"
if $verbose_output
  then
  time 7za a -bsp0 -mx=9 $filename.7z $directory_name
else
  time 7za a -bso0 -bsp0 -mx=9 $filename.7z $directory_name
fi

du -h $filename.7z
echo ""
