#!/bin/bash
echo $title
filename=$1
regex1='\(.*\): \(.*\) (\(.*\))'
regex2='\(.*\): \(.*\)'
while read line; do
# reading each line
# if no additional info
if [ "$(grep -c "$regex1" <<< $line)" -ge 1 ]; then
  echo $line | sed -n "s/$regex1/\2	\1	\3/p"
else
  echo $line | sed -n "s/$regex2/\2	\1/p"
fi

done < $filename
