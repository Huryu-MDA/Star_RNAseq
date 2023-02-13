#/bin/bash

module load star/2.7.9a

cpu_num=12
#hg38_refdir="/rsrch3/home/leuk-rsrch/huryu/Database/hg38/fastas"
hg38_refdir="/rsrch3/home/leuk-rsrch/huryu/Database/hg38/indexes/star_279a"
R1="/rsrch3/home/leuk-rsrch/huryu/ToolSelfMade/RNAseq_Kallisto_Sleuth/code/fastq_concat_dir/fastqgz_for_DEseq/Sample_21-MOLM13WT3/Sample_21-MOLM13WT3_R1_val_1_sorted.fq.gz"
R2="/rsrch3/home/leuk-rsrch/huryu/ToolSelfMade/RNAseq_Kallisto_Sleuth/code/fastq_concat_dir/fastqgz_for_DEseq/Sample_21-MOLM13WT3/Sample_21-MOLM13WT3_R2_val_2_sorted.fq.gz"
sample="Sample_21"

#STAR --runMode genomeGenerate --runThreadN ${cpu_num} --genomeDir ${hg38_StarIndexDir} --genomeFastaFiles ${hg38_fasta} --sjdbGTFfile ${hg38_gencode_v40_gtf} --sjdbOverhang 100
STAR --runMode alignReads --runThreadN ${cpu_num} --genomeDir ${hg38_refdir} --readFilesCommand zcat --readFilesIn ${R1} ${R2} --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${sample} --sjdbOverhang 100 --outFilterScoreMinOverLread 0 --outFilterMatchNminOverLread 0 --outFilterMatchNmin 0 --outFilterMismatchNmax 1
echo "STAR --runMode alignReads --runThreadN ${cpu_num} --genomeDir ${hg38_refdir} --readFilesCommand zcat --readFilesIn ${R1} ${R2} --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${sample} --sjdbOverhang 100 --outFilterScoreMinOverLread 0 --outFilterMatchNminOverLread 0 --outFilterMatchNmin 0 --outFilterMismatchNmax 1"
#STAR --runMode alignReads --runThreadN ${cpu_num} --genomeDir ${hg38_refdir} --readFilesCommand zcat --readFilesIn ${R1} --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${sample} --sjdbOverhang 100
