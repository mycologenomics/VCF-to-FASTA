# VCF-to-FASTA
Make an alternative fasta sequence of the whole genome, taking variant positions in to account.

These scripts are for batch submission of many files, so change as appropriate

VCF_to_FASTA.sh takes the reference genome (using Aspergillus fumigatus as an example here) and a VCF containing SNP calls (can also include INDEL calls) to make a new fasta sequence of the whole genome, but with positions where there's SNPs, changed.
