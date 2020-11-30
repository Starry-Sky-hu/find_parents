#bwa mem -R "@RG\tID:TS177_L1_I101\tSM:TS177_L1_I101\tPL:illumina" /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-177/TS177_L1_I101.R1.clean.fastq.gz /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-177/TS177_L1_I101.R2.clean.fastq.gz > /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177_aligned.sam

samtools sort /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177_aligned.sam -o /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177_sort.bam

samtools rmdup /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177_sort.bam /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177_rumduped.bam

samtools index /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177_rumduped.bam

gatk HaplotypeCaller -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa -I /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177_rumduped.bam -O /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177.g.vcf.gz -ERC GVCF

