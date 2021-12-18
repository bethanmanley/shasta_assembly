#!/bin/bash
#SBATCH -J minimap2
#SBATCH -n 3
#SBATCH -o Guppy_5_Riirr/shasta5/minimap2/minimap2.o
#SBATCH -e Guppy_5_Riirr/shasta5/minimap2/minimap2.e
#SBATCH -p 1804
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bm502@cam.ac.uk

INPUT_DIR=/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta5
FASTQ1=$1
FASTQ2=$2
FASTQ3=$3

minimap2 -ax map-ont -t 39 \
$INPUT_DIR}/Shasta_Assembly/Assembly_trimmed.fasta  \
"${INPUT_DIR}/$1" "${INPUT_DIR}/$2" "${INPUT_DIR}/$3" | samtools view -hb -F 0x904 > $INPUT_DIR/Polishing/PEPPER/unsorted.bam; \
samtools sort -@38 -o $INPUT_DIR/Polishing/PEPPER/Riirr_ONT_reads_ONT_asm.bam $INPUT_DIR/Polishing/PEPPER/unsorted.bam; \
rm -rf $INPUT_DIR/Polishing/PEPPER/unsorted.bam; \
samtools index -@38 $INPUT_DIR/Polishing/PEPPER/Riirr_ONT_reads_ONT_asm.bam 
