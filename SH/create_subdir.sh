#Create a subdirectory for each FASTA file and move FASTA file to said directory.
```
for file in /data2/scratch2/mirabl/Xf_proj/Sequences/WGS/DNA_fasta/*.fasta; do
    file_short=$(basename $file | sed s/".fasta"//g)
    echo $file_short
    cp /data2/scratch2/mirabl/Xf_proj/NCBI_Xf55/Analysis_w_outgr/Annotation/"$file_short"/*.faa /data2/scratch2/mirabl/Xf_proj/NCBI_Xf55/Analysis_w_outgr/Annotation/"$file_short"/"$file_short".faa
done
```
