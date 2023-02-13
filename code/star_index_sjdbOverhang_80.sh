#/bin/bash

module load star/2.7.9a

cpu_num=40
hg38_StarIndexDir="/rsrch3/home/leuk-rsrch/huryu/Database/hg38/indexes/star_279a_sjdb80"
hg38_fasta="/rsrch3/home/leuk-rsrch/huryu/Database/hg38/fastas/Homo_sapiens_assembly38.fasta"
hg38_gencode_v40_gtf="/rsrch3/scratch/reflib/iacs/reference/human/hg38/annotaions/gencode/gencode.v40.annotation.gtf"

STAR --runMode genomeGenerate --runThreadN ${cpu_num} --genomeDir ${hg38_StarIndexDir} --genomeFastaFiles ${hg38_fasta} --sjdbGTFfile ${hg38_gencode_v40_gtf} --sjdbOverhang 80
