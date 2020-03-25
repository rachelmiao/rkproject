#!/bin/bash
filename=$1
mkdir img
while read line; do

  IFS=','; arr=($line); unset IFS;
  url=${arr[0]}
  title=${arr[1]}

  wget -cO - "$url" > "img/${title}"

done < $filename
