################################################
#Author: Adam McCormack
#Date: April 5th, 2013
#Info: This script is designed to find symlinks 
#      in the directory, $SYM_SRC,that point to
#      $SRC and move those files to $DEST and 
#      update the corresponding symlinks
################################################

SYM_SRC=$1 #File path to directory of symlinks
F_SRC=$2 #file path of files to be moved
DEST=$3 #destination of files

if [ -z "$3" ]; then #checks if all arguments are entered
  echo
  echo Usage: $0 [symlink_directory] [orig_file_loc] [new_file_loc]
  echo Example: $0 ./ /x/y/ ../z/q/
  echo
  exit
elif [ ! -e "${DEST}" ]; then #checks if destination file path exists
  echo
  echo Error: \'$DEST\' is not a valid file path
  echo
  exit
fi

echo 

# This loop will scan and pull out
# each symbolic link that exist in the
# directory $SYM_SRC
for link in `find $SYM_SRC -type l`
do
    
  # $path gets the path of the symlink
  # using 'readlink' and uses grep to
  # to match it with $DEST
  path=`readlink $link | grep $F_SRC`

  if [ -n "$path"  ]; then #checks that $path is not null
    
    echo \'$link\' points to \'$path\' 
    echo 

    echo Moving \'$path\' to \'"${DEST}"\'
    echo
    mv $path "${DEST}" #moves file to new destination

    file_name=${path##*/} #parses out file name from path

    echo Upating symlink \'$filename\' to point to \'"${DEST}${file_name}"\'
    echo
    ln -sf "${DEST}${file_name}" $filename #updating symlink

  fi

done

echo Job Completed.
echo



