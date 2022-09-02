#!/bin/sh

PATH=$PATH:/apps/java/jdk-8u66/bin/java

## GENERATE AN ALTERNATIVE REFERENCE SEQUENCE. GIVEN A VARIANT CALLSET, REPLACE THE REFERENCE BASES AT SITES OF VARIATION (SNPS/INDELS) WITH WHATS SUPPLIED IN VCF
## INPUT FILES REQUIRED
## $1 --> VCF file
## $2 --> Output prefix
## Versions used:
## GATK: 4.2.6.1
#####################################################################

mkdir -p -v /rds/general/project/fisher-aspergillus-results/ephemeral/$2

reference_dir=/rds/general/project/fisher-aspergillus-reference/live
reference=$reference_dir/GCF_000002655.1_ASM265v1_genomic.fa
output=/rds/general/project/fisher-aspergillus-results/ephemeral/$2
results_dir=/rds/general/project/fisher-aspergillus-results/live/Pilot/$2
tmp=/rds/general/project/fisher-aspergillus-results/ephemeral/

## copy BAM  over to local scratch

cp -v $1 $output/$2.final_forNewRef.vcf

source activate gatk4_env

gatk IndexFeatureFile --tmp-dir $tmp -F $output/$2.final_forNewRef.vcf

gatk FastaAlternateReferenceMaker --tmp-dir $tmp -R $reference -O $output/$2.fasta -V $output/$2.final_forNewRef.vcf

cp -v $output/$2.fasta $results_dir

exit 0
