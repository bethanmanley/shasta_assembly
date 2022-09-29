# shasta_assembly
De novo Shasta (shasta-Linux-0.8.0) assembly of R. irregularis using ONT reads. followed by polishing with ONT reads using PEPPER and with publically-available Illumina reads using BWA. 

- Shasta assembly carried out using 9Gb of Rhizophagus irregularis Nanopore reads
- First round polishing carried out using PEPPER following alignnent of these same Nanopore reads to the raw genome using Minimap2
- Variants called and applied to the raw assembly using hap.py

- Illumina reads from Maeda et al. (2018) aligned to the PEPPER-DeepVariant polished genome using BWA-MEM 
- Variants called using DeepVariant
- Meryl used to construbt k-mer db
- Merfin used to polish variants
