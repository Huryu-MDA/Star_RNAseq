#!/bin/bash

# $1: Sample_21-MOLM13WT3_R2.fastq.gz
target_fq=$1

if (file ${target_fq} | grep -q "gzip compressed data" )
then
  #echo GZIPPED
  zcat ${target_fq} | paste - - - -  | sort -k1,1 -S 3G | tr '\t' '\n' | gzip > sorted_${target_fq}
elif (file ${target_fq} | grep -q "ASCII text" )
then
  #echo ASCII TEXT 
  cat ${target_fq} | paste - - - -  | sort -k1,1 -S 3G | tr '\t' '\n' | gzip > sorted_${target_fq}
else
  echo "Please decompress the fastq file."
fi
exit 0
