wd=`pwd`
s=""
for param in "$@"
do
	s="$s $param"	
done
echo $s
echo $wd
