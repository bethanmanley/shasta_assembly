
BASE=/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta5
HAP_INPUT=$BASE/Polishing/PEPPER
ASSEMBLY=$BASE/Shasta_Assembly/Assembly_trimmed.fasta
OUTPUT=$BASE/Polishing/hap_py_output_dir

# 2 VCFs generated by PEPPER, one per haplotype
HAP1_VCF=PEPPER_MARGIN_DEEPVARIANT_ASM_POLISHED_HAP1.vcf.gz
HAP2_VCF=PEPPER_MARGIN_DEEPVARIANT_ASM_POLISHED_HAP2.vcf.gz

POLISHED_ASM_HAP1=HG002_Shasta_run2.PMDV.HAP1.fasta
POLISHED_ASM_HAP2=HG002_Shasta_run2.PMDV.HAP2.fasta

singularity exec hap.py_latest.sif /opt/hap.py/bin/hap.py $HAP_INPUT/$HAP1_VCF $HAP_INPUT/$HAP2_VCF \ 
-r $ASSEMBLY \
-o $OUTPUT/hap1_vs_hap2 \
--pass-only \
--no-roc \
--no-json \
--engine=vcfeval \
--threads=6


# This creates hap1_vs_hap2.vcf.gz - need to extract TP calls from this file

bcftools view --exclude 'FORMAT/BD!="TP"' $OUTPUT/hap1_vs_hap2.vcf.gz > $OUTPUT/hap2_TPs.vcf
bgzip $OUTPUT/hap2_TPs.vcf
tabix -p vcf $OUTPUT/hap2_TPs.vcf.gz



## Apply to the assembly

SAMPLE_NAME="TRUTH"
VCF=$OUTPUT/hap2_TPs.vcf.gz

POLISHED_ASM=hap2_PEPPER_polished.fasta

# Apply the VCF to the assembly

bcftools consensus \
-f $ASSEMBLY \
-H 2 \
-s $SAMPLE_NAME \
-o $OUTPUT/$POLISHED_ASM \
$OUTPUT/$VCF
