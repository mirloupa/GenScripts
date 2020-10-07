# BLAST all vs all.
for fasta in /data2/scratch2/mirabl/Xf_proj/Xf_effector_prediction/20190125_preffector-res_ncbi-Xf46/Effectors/SEQ/*ID.faa; do
  blastall -i $fasta -d $1 -o "$fasta"_allvall.crunch -m 8
done
