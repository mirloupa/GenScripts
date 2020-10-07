# A collection of ```awk``` scripts.
Extract FASTA sequence from a list of IDs.
```bash
awk -F'>' 'NR==FNR{ids[$0]; next} NF>1{f=($2 in ids)} f' /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190501_preffector-res_ncbi-Xf55/Effectors/LSMJ01000001.1.res-ID /data2/scratch2/mirabl/Xf_proj/Sequences/WGS/Prot_fasta/GCF_000576405.1_Wufong-1_protein.faa > LSMJ01000001.1.res-ID.faa
```
---
Extract FASTA sequence from a list of IDs for multiple files.
```bash
for file in /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190501_preffector-res_ncbi-Xf55/Effectors/*.res-ID; do
  awk -F'>' 'NR==FNR{ids[$0]; next} NF>1{f=($2 in ids)} f' $file /data2/scratch2/mirabl/Xf_proj/Sequences/WGS/Prot_fasta/* > "$file".faa
done
```
---
