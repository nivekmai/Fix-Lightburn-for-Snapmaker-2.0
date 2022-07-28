#! /bin/bash

FILE=$1
OUT=`echo "$FILE" |  sed 's/\(.*\)\(\..*\)/\1 - fixed\2/'`
sed '/M[678]/d' "$FILE" \
	| sed 's/M05/M05 I/g' \
	| tail -r \
	| awk '/M05 I/ && !done { gsub(/M05 I/, "M05"); done=1;}; 1;' \
	| tail -r \
	| (echo "M3 S0" && cat) \
	> "$OUT"
echo "$OUT"
