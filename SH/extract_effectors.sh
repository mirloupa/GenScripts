# Find effectors in PREFFECTOR output and save in new file with .res extension.

for file in /data2/scratch2/mirabl/Xf_proj/Sequences/WGS/DNA_fasta/*.fasta; do
  file_short=$(basename $file | sed s/".fasta"//g)
  echo $file_short
  grep -i ',effector,' /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190501_preffector-res_ncbi-Xf55/"$file_short".txt > /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190501_preffector-res_ncbi-Xf55/Effectors/"$file_short".res
done
