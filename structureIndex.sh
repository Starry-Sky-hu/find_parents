ref=/vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa
bwa index ${ref}
samtools faidx ${ref}
gatk CreateSequenceDictionary REFERENCE=${ref} OUTPUT=${ref:0:48}/S_lycopersicum_chromosomes.4.00.dict
