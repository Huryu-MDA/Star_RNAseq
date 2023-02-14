#/bin/bash

module load star/2.7.9a

cpu_num=8
hg38_StarIndexDir="$HOME/Database/hg38/indexes/star_279a"
hg38_fasta="$HOME/Database/hg38/fastas/Homo_sapiens_assembly38.fasta"
hg38_gtf="$HOME/Database/hg38/gtf/gencode.v40.annotation.gtf"

STAR --runMode genomeGenerate --runThreadN ${cpu_num} --genomeDir ${hg38_StarIndexDir} --genomeFastaFiles ${hg38_fasta} --sjdbGTFfile ${hg38_gtf} --sjdbOverhang 100
