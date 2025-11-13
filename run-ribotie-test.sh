#!/bin/bash
set -euo pipefail
#
################ Load environment variables ################
# Folder for shared genome assemblies
export genomedir="/projects/crc1678/annotations/genome_assemblies"
#Executor is slurm
export NXF_EXECUTOR=slurm
# set Nextflow environment variables
# We can use shared Nextflow home on crc1678
# Here for example in "$NXF_HOME/assets" folder all the pulled nf-core pipelines are stored
export CRC1678_CACHE_DIR="/projects/crc1678/shared_envs/nextflow"
export NXF_HOME="$CRC1678_CACHE_DIR/nextflow_home"
# Apptainer and Singularity cache directories
# These are shared directories for caching container images
export NXF_SINGULARITY_CACHEDIR="$CRC1678_CACHE_DIR/nextflow_singularity"
export NXF_APPTAINER_CACHEDIR="$CRC1678_CACHE_DIR/nextflow_apptainer"
# More tmp and cache dirs
export NXF_WORK="/scratch/crc1678/nf_work" 
export NXF_TEMP="/scratch/crc1678/nf_tmp"
export SINGULARITY_TMPDIR="/scratch/crc1678/tmp"
# Create dirs on scratch becasue they are removes automatically
# mkdir -p /scratch/crc1678/{tmp,nf_work,nf_tmp}
# Create directories if they do not exist
mkdir -p "$NXF_HOME" "$NXF_SINGULARITY_CACHEDIR" "$NXF_APPTAINER_CACHEDIR" "$NXF_WORK" "$NXF_TEMP" "$SINGULARITY_TMPDIR"




# test tristan-orf ribotie with test data from them on a singluarity container on ramses
nextflow run main.nf -profile singularity,slurm,test -resume
