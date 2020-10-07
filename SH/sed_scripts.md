# A collection of ```sed``` scripts with description/examples.
Remove all characters from beginning of line until '>'  
Output is echo-ed
```
sed -n 's/^.*>//p' AAAL02000032.1.res
``` 
---
Remove all characters from beginning of line until '>'  
Output is saved in new files with '-ID' extension
```
for file in /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190501_preffector-res_ncbi-Xf55/Effectors/*.res; do
  sed -n 's/^.*>//p' $file > "$file"-ID
done
```
---
Extract accession number from PREFFECTOR results and save to new file.  
```
for file in ./*.res-ID; do
  file_short=$(basename $file | sed s/".res-ID"//g)
  echo $file_short
  sed 's/ .*//' $file > $file_short.txt
done
```
---
