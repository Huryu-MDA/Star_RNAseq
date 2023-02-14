#!/bin/bash

module load trim_galore/0.6.5

# In the setting of the following, this folder list can be created as following.

### fastq.gz list
# Sample_1/Sample_1-R1.fastq.gz
# Sample_1/Sample_1-R2.fastq.gz
# Sample_2/Sample_2-R1.fastq.gz
# Sample_2/Sample_2-R2.fastq.gz
# Sample_3/Sample_3-R1.fastq.gz
# Sample_3/Sample_4-R2.fastq.gz

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

