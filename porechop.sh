#!/bin/bash
#SBATCH -J PORECHOP
#SBATCH -n 3
#SBATCH -p 1804
#SBATCH -o Guppy_5_Riirr/shasta5/porechop/porechop.o
#SBATCH -e Guppy_5_Riirr/shasta5/porechop/porechop.e
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bm502@cam.ac.uk


FASTQ=$1
OUTPUT_DIR=$2

BASE=/mnt/home1/miska/bm502/Guppy_5_Riirr/shasta_5
PORECHOP=/mnt/home1/miska/bm502/Apps/Porechop/porechop-runner.py

$PORECHOP -i $BASE/$1 -o $2
