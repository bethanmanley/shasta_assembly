# shasta_assembly
Assembly of R. irregularis ONT reads using Shasta, followed by polishing with ONT reads using PEPPER and with publically-available Illumina reads using BWA. 

ONT fastq files to be mapped to the Shasta files using Minimap2, followed by PEPPER Polishing.

SNP calls applied to assembly using hap.py

Illumina reads aligned using BWA-MEM, followed by polishing with Deepvariant.

