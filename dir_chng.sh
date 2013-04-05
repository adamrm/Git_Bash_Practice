#!/bin/bash

var="/z/q/"

for a in `find ./ -type l`
do
 for b in ` readlink $a | grep '/x/y/'`
do
 new_dir="${var}${b##*/}"
 echo mv $b $new_dir
 echo ln -sf $new_dir "${b##*/}"
done

done

echo done!
