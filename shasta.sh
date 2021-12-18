#!/bin/bash
#SBATCH -J shasta5
#SBATCH -n 3
#SBATCH -o Guppy_5_Riirr/shasta5.o
#SBATCH -e Guppy_5_Riirr/shasta5.e
#SBATCH -p 1804
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bm502@cam.ac.uk

DIR=Guppy_5_Riirr/shasta5

FASTQ1=$1
FASTQ2=$2
FASTQ3=$3
KMER=$4

Apps/shasta \
--input $FASTQ1 $FASTQ2 $FASTQ3 \
--assemblyDirectory $DIR \
--memoryBacking disk \
--memoryMode filesystem \
--conf Apps/Nanopore-Sep2020.conf \
--Assembly.consensusCaller Bayesian:guppy-5.0.7-a \
--Kmers.k $KMER \
--MinHash.minHashIterationCount 50 \
--Align.bandExtend 20 \
--Align.downsamplingFactor 0.1 \
--ReadGraph.creationMethod 0 \
--ReadGraph.maxAlignmentCount 12 \
--ReadGraph.crossStrandMaxDistance 0 \
--Align.minAlignedFraction 0.3 \
--Align.minAlignedMarkerCount 60 \
--Align.maxSkip 50 \
--Align.maxDrift 30 \
--Align.maxTrim 30 \
--MarkerGraph.minCoveragePerStrand 3 \
--Assembly.iterative \
--Assembly.pruneLength 1500 
