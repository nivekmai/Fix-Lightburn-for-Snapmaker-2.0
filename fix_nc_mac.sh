#! /bin/bash

FILE=$1
OUT=`echo "$FILE" |  sed 's/\(.*\)\(\..*\)/\1 - fixed\2/'`
sed '/M[678]/d' "$FILE" \
	| sed 's/M05/G1 I S0/g' \
	| tail -r \
	| awk '/G1 I S0/ && !done { gsub(/G1 I S0/, "M05"); done=1;}; 1;' \
	| tail -r \
	| (echo "M3 S0" && cat) \
	> "$OUT"
echo "$OUT"
