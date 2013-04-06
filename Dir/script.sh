> log
#find ./ -type l

for a in `find ./ -type l`
do
 readlink $a | grep '/x/y/' >> log
done

echo done!
