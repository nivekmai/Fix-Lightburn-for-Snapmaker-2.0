#! /bin/bash

FILE=$1
OUT=`echo "$FILE" |  sed 's/\(.*\)\(\..*\)/\1 - fixed\2/'`
sed '/M[678]/d' "$FILE" \
	| sed 's/M05/G1 I S0/g' \
	| tac \
	| sed '0,/G1 I S0/{s/G1 I S0/M05/}' \
	| tac \
	| (echo "M3 S0" && cat) \
	> "$OUT"
echo "$OUT"
