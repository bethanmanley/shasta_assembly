#!/bin/bash
#SBATCH -J PEPPER
#SBATCH -n 3
#SBATCH -p 1804
#SBATCH -o Guppy_5_Riirr/shasta5/Polishing/PEPPER/PEPPERDV.o
#SBATCH -e Guppy_5_Riirr/shasta5/Polishing/PEPPER/PEPPERDV.e
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bm502@cam.ac.uk

BASE=/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta5

ASM=Shasta_Assembly/Assembly_trimmed.fasta
BAM=Polishing/PEPPER/Riirr_ONT_reads_ONT_asm.bam
SAMPLE_NAME=Riirr_G5

# Set the number of CPUs to use
THREADS=10

# Set up output directory
OUTPUT_DIR=$BASE/Polishing/PEPPER

# Run PEPPER-Margin-DeepVariant
singularity exec --bind /usr/lib/locale/ \
pepper_deepvariant_r0.4.sif \
run_pepper_margin_deepvariant polish_assembly \
-b $BAM \
-f $BASE/$ASM \
-o $OUTPUT_DIR \
-t $THREADS \
-s $SAMPLE_NAME \
--ont

# This generates 2 vcfs, one per haplotype:
# HAP1_VCF=PEPPER_MARGIN_DEEPVARIANT_ASM_POLISHED_HAP1.vcf.gz
# HAP2_VCF=PEPPER_MARGIN_DEEPVARIANT_ASM_POLISHED_HAP2.vcf.gz

## Next run hap.py
