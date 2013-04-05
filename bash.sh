################################################
#Author: Adam McCormack
#Date: April 5th, 2013
#Info: This script is designed to find symlinks 
#      in the directory, $SYM_SRC,that point to
#      $SRC and move those files to $DEST and 
#      update the corresponding symlinks
################################################

SYM_SRC=./ #File path to directory of symlinks
F_SRC='/z/q/' #file path of files to be moved
DEST=../x/y/ #destination of files

# This loop will scan and pull out
# each symbolic link that exist in the
# directory $SYM_SRC
for link in `find $SYM_SRC -type l`
  do
    # This loop will take all the symlinks
    # and search for links that point to
    # $F_SRC by using readlink to get the
    # file path and grep to find the path
    # matching $F_SRC
    for path in `readlink $link | grep $F_SRC`
      do

	echo $link points to $path 
	echo 
	file_name=${path##*/} #parses out file name from path
	
	echo moving $path to "${DEST}${file_name}"
	echo
        mv $path "${DEST}${file_name}" #moves file to new destination
	
	echo upating symlink $filename to point to "${DEST}${file_name}"
	echo
     	ln -sf "${DEST}${file_name}" $filename #updating symlink
      done
done

echo done!
