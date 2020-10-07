

# extract FASTA sequence from a list of IDs
awk -F'>' 'NR==FNR{ids[$0]; next} NF>1{f=($2 in ids)} f' /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190501_preffector-res_ncbi-Xf55/Effectors/LSMJ01000001.1.res-ID /data2/scratch2/mirabl/Xf_proj/Sequences/WGS/Prot_fasta/GCF_000576405.1_Wufong-1_protein.faa > LSMJ01000001.1.res-ID.faa

####

# extract FASTA sequence from a list of IDs for multiple files
for file in /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190501_preffector-res_ncbi-Xf55/Effectors/*.res-ID; do
  awk -F'>' 'NR==FNR{ids[$0]; next} NF>1{f=($2 in ids)} f' $file /data2/scratch2/mirabl/Xf_proj/Sequences/WGS/Prot_fasta/* > "$file".faa
done

####

# blast all vs all
for fasta in /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190125_preffector-res_ncbi-Xf46/Effectors/SEQ/*ID.faa; do
  blastall -i $fasta -d $1 -o "$fasta"_allvall.crunch -m 8
done

####

for file in /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190125_preffector-res_ncbi-Xf46/Effectors/SEQ/*ID.faa; do
  file_short=$(basename $file | sed s/".res-ID.faa"//g)
  Jobs=$(qstat | grep 'blast-allvall' | wc -l)
    while [ $Jobs -gt 100 ]; do
      sleep 10
      printf "."
      Jobs=$(qstat | grep 'allvall' | wc -l)
    done
  qsub /home/mirabl/SUB_PBS/Xf_proj/blast-allvall.pbs $file "$file"_allvall.crunch
done

####

# rename files from *.fasta to *.cat.fasta
for file in /data2/scratch2/mirabl/Xf_proj/MLST_201902/MLST_seq/*.fasta; do
  file_short=$(basename $file | sed s/".fasta"//g)
  echo $file_short
  cp /data2/scratch2/mirabl/Xf_proj/MLST_201902/MLST_seq/"$file_short".fasta //data2/scratch2/mirabl/Xf_proj/MLST_201902/MLST_seq/"$file_short".cat.fasta
done

####



####

# BLAST all-v-all
for file in /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/Preffector_results_Xf55/Effectors/All_effector_seq/*faa; do
  file_short=$(basename $file | sed s/".faa"//g)
  Jobs=$(qstat | grep 'blast-allvall' | wc -l)
    while [ $Jobs -gt 100 ]; do
      sleep 10
      printf "."
      Jobs=$(qstat | grep 'allvall' | wc -l)
    done
  qsub /home/mirabl/SUB_PBS/Xf_proj/blast-allvall.pbs $file "$file"_allvall.crunch
done

####

# rename file in a directory to name according to list
for file in ./*; do
  file_short=$(basename $file | sed s/".txt"//g)
  grep "$file_short" xf_strains.csv | file_short=$(cut -d, -f3)
  cp $file $file_short
done


```
