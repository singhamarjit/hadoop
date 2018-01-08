
echo $4 
if [ $# -lt 4 ]
then
 echo "Usage : createfiles.sh numberoffiles numberoflines numberofcolumns columndelimter"
 echo "For comma delimiter put \,"
 echo "For semicolan delimiter put \;"
 echo "For colan delimiter put \:"
 echo "For space delimiter put \" \""
 echo "For special character like tab type back slash two times and letter t"
  
 exit 1 
fi
filen=1
numberoffiles=`expr $1 + 1`
numberoflines=`expr $2 + 1`
numberofcolumns=`expr $3 + 1`
while [ $filen -lt $numberoffiles ]
do
 i=1
 line=" "
 j=1
  filename=`echo file${filen}`
  while [ $j -lt $numberoflines ]
  do
    while [ $i -lt $numberofcolumns ]
    do
     if [ $i -lt 2 ] 
      then
       line=`echo "column${i}"`
     else 
       line=`echo "${line}${4}column${i}"` 
     fi
      i=`expr $i + 1`
    done
    echo $line>> $filename

  j=`expr $j + 1`
  done
filen=`expr $filen + 1`
done
 
hadoop fs -mkdir /user/datfiles
hadoop fs -copyFromLocal /user/amar/file* /user/datafiles/
