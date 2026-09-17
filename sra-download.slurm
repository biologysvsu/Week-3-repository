#!/bin/bash
#SBATCH --job-name=download_sra       # Name of the job
#SBATCH --output=download_sra.log     # Output log file
#SBATCH --time=01:00:00               # Time limit (10 minutes for this lightweight job)
#SBATCH --ntasks=1                    # Use 1 task
#SBATCH --partition=RM-shared
#SBATCH --mail-user=jparedes@svsu.edu  # Add your email address here
#SBATCH --mail-type=ALL               # Send email notifications for all job states (BEGIN, END, FAIL)

# Load the SRA Toolkit module. This is the software we will use for this job. Already available in the HPC, but must be loaded.
module load sra-toolkit

# Set the storage directory. We dont want any large files outside the storage directory.
STORAGE_DIR="/ocean/projects/bio260081p/jparedesmontero"

# Navigate to the storage directory
cd $STORAGE_DIR

# Download the dataset
fastq-dump --split-files ERR251429 # Replace SRX123456 with an SRA accession number of your choice
