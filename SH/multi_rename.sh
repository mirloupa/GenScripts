Rename multiple files from ```*.fasta``` to ```*.cat.fasta```.
```
for file in /data2/scratch2/mirabl/Xf_proj/MLST_201902/MLST_seq/*.fasta; do
  file_short=$(basename $file | sed s/".fasta"//g)
  echo $file_short
  cp /data2/scratch2/mirabl/Xf_proj/MLST_201902/MLST_seq/"$file_short".fasta /data2/scratch2/mirabl/Xf_proj/MLST_201902/MLST_seq/"$file_short".cat.fasta
done
````
