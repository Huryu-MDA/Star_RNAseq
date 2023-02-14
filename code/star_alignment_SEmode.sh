#/bin/bash

module load star/2.7.9a

cpu_num=12
hg38_refdir="$HOME/Database/hg38/indexes/star_279a"
R1="$HOME/TargetFolder/Sample_R1_val_1.fq.gz"
R2="$HOME/TargetFolder/Sample_R2_val_2.fq.gz"
sample="Sample_name"

STAR --runMode alignReads --runThreadN ${cpu_num} --genomeDir ${hg38_refdir} --readFilesCommand zcat --readFilesIn ${R1} --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${sample} --sjdbOverhang 100
