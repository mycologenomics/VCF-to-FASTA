#!/bin/sh
 
#PBS -l walltime=72:00:00
#PBS -l select=1:ncpus=32:mem=124gb
## This tells the batch manager to re-run job with parameter varying from 1 to N in steps on step-size
#PBS -J 1-23
 
## OTHER OPTIONAL PBS DIRECTIVES
 
module load java
module load anaconda3/personal
 
/rds/general/project/fisher-aspergillus-analysis/live/VCF_to_FASTA.sh $(head -$PBS_ARRAY_INDEX /rds/general/project/fisher-aspergillus-analysis/live/arglist_VCFtoFASTA.txt | tail -1)
