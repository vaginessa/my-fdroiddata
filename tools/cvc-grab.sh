# Grab Current Version data from another repo

#! /bin/bash
for i in `grep -s -l 'Mode:Tags$' ~/shroiddata/metadata/*.txt`
do N=`basename $i`
   CVC=$(sed -n 's/Current Version Code://p' ~/shroiddata/metadata/$N)
   sed -i "s/Current Version Code:[.0-9]*/Current Version Code:$CVC/" `grep -s -l 'Mode:Tags$' ~/fdroiddata/metadata/$N`
   CV=$(sed -n 's/Current Version://p' ~/shroiddata/metadata/$N)
   sed -i "s/Current Version:.*/Current Version:$CV/" `grep -s -l 'Mode:Tags$' ~/fdroiddata/metadata/$N`
done