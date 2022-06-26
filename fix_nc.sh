#! /bin/bash

FILE=$1
OUT=`echo $FILE |  sed 's/\(.*\)\(\..*\)/\1 - fixed\2/'`
sed '/M[678]/d' $FILE \
	| sed 's/M05/M05 I/g' \
	| tac \
	| sed '0,/M05 I/{s/M05 I/M05/}' \
	| tac \
	> "$OUT"
echo "$OUT"
