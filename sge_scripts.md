# Scripts from 'SGE' HPC.  
Submit job only after certain conditions are met (BLAST all vs all example).
```bash
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
```
```bash
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
```
---
