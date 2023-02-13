#!/bin/bash

source activate /rsrch3/scratch/leuk-rsrch/huryu/ENV_BIOCONDA/

# In the setting of the following, this folder list can be created as following.


### fastq.gz list
# Sample_10-OCIAML3WT1/Sample_10-OCIAML3WT1_R1.fastq.gz
# Sample_10-OCIAML3WT1/Sample_10-OCIAML3WT1_R2.fastq.gz
# Sample_11-OCIAML3WT2/Sample_11-OCIAML3WT2_R1.fastq.gz
# Sample_11-OCIAML3WT2/Sample_11-OCIAML3WT2_R2.fastq.gz
# Sample_12-OCIAML3WT3/Sample_12-OCIAML3WT3_R1.fastq.gz
# Sample_12-OCIAML3WT3/Sample_12-OCIAML3WT3_R2.fastq.gz

# ls */*.fastq.gz | rev | cut -f 2 -d "/" | rev > folder_list

folder_list=$1

# Function to run trim_galore
function trim_galore_for_sample() {
    sample=$1
    cd ${sample}
    r1=${sample}_R1.fastq.gz
    r2=${sample}_R2.fastq.gz
    BsubS "trim_galore --paired ${r1} ${r2}" trimgalore
    cd ..
    echo
}

for i in $(cat ${folder_list})
do
  echo ${i}
  echo "Run function trim_galore_for_sample."
  trim_galore_for_sample ${i}
  echo "TrimGalore bjob for ${i} was submitted."
done

