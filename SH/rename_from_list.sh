Rename file in a directory to name according to list.
```
for file in ./*; do
  file_short=$(basename $file | sed s/".txt"//g)
  grep "$file_short" xf_strains.csv | file_short=$(cut -d, -f3)
  cp $file $file_short
done
```
