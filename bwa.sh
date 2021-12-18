#!/bin/bash
#SBATCH -J BWA
#SBATCH -n 3
#SBATCH -p 1804
#SBATCH -o Guppy_5_Riirr/shasta5/Polishing/BWA/BWA.o
#SBATCH -e Guppy_5_Riirr/shasta5/Polishing/BWA/BWA.e
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bm502@cam.ac.uk

POLISHED_ASSEMBLY=/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta5/Polishing/hap_py_output_dir
FASTQ1=/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta5/Maeda_Illumina/DRR063509_1.fastq
FASTQ2=/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta5/Maeda_Illumina/DRR063509_2.fastq

# Index the PEPPER polished assembly

bwa index $POLISHED_ASSEMBLY 

# Align Illumina reads to the ONT-read polished assembly. These are from
# ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/fastq/DRA004/DRA004835/DRX057744/DRR063509_2.fastq.bz2

bwa mem -t 71 $POLISHED_ASSEMBLY $FASTQ1 $FASTQ2 | samtools view -bh > IlluminaReads_2_G5Riirr_S5_pepper_polished.bam 


# Sort
samtools sort -@71 -o IlluminaReads_2_G5Riirr_S5_pepper_polished.sorted.bam IlluminaReads_2_G5Riirr_S5_pepper_polished.bam 

# Index
samtools index -@71 IlluminaReads_2_G5Riirr_S5_pepper_polished.sorted2.bam 





