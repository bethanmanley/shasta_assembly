
#!/bin/bash
#SBATCH -J deepvariant
#SBATCH -n 3
#SBATCH -p 1804
#SBATCH -o Guppy_5_Riirr/shasta5/Polishing/DeepVariant/deepvariant.o
#SBATCH -e Guppy_5_Riirr/shasta5/Polishing/DeepVariant/deepvariant.e
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bm502@cam.ac.uk


## Set new directories for DeepVarint run (obtained docker image through singularity)

BASE="/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta5"
INPUT_DIR="${BASE}/Polishing/PEPPER/hap_py_output_dir"
OUTPUT_DIR="${BASE}/Polishing/DeepVariant"


# Run DeepVariant

BIN_VERSION="1.1.0"

singularity run -B /usr/lib/locale/:/usr/lib/locale/ \
  docker://google/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type WGS \
  --ref="${INPUT_DIR}"/hap2_PEPPER_polished.fasta \
  --reads="${INPUT_DIR}"/IlluminaReads_2_G5Riirr_S5_pepper_polished.sorted.bam \
  --output_vcf="${OUTPUT_DIR}"/G5Riirr_S5_deepvariant_pepper_polished.vcf.gz \
  --output_gvcf="${OUTPUT_DIR}"/G5Riirr_S5_deepvariant_pepper_polished.g.vcf.gz \
  --intermediate_results_dir "${OUTPUT_DIR}/intermediate_results_dir"
