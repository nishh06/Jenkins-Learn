#!/bin/bash
counter=0
sql="insert into register (name,age) values "
while [ $counter -lt 50 ]; do
  let counter=counter+1
  name=$(nl people.txt | grep -w $counter | awk '{print $2}')
  age=$(shuf -i 20-25 -n 1)
  if [ $counter  -eq 50 ]; then
    value="('$name','$age');"
  else
    value="('$name','$age'),"
  fi

  sql="${sql}${value}"
done
mysql -u root -prakuten people -e "${sql}"
