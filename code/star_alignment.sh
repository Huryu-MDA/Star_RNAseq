#/bin/bash

module load star/2.7.9a

cpu_num=12
hg38_refdir="$HOME/Database/hg38/indexes/star_279a"
R1="$HOME/targetfolder/samplename/Sample_R1_val_1_sorted.fq.gz"
R2="$HOME/targetfolder/samplename/Sample_R2_val_2_sorted.fq.gz"
sample="samplename"

STAR --runMode alignReads --runThreadN ${cpu_num} --genomeDir ${hg38_refdir} --readFilesCommand zcat --readFilesIn ${R1} ${R2} --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${sample} --sjdbOverhang 100
echo "STAR --runMode alignReads --runThreadN ${cpu_num} --genomeDir ${hg38_refdir} --readFilesCommand zcat --readFilesIn ${R1} ${R2} --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${sample} --sjdbOverhang 100"
