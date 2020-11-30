bwa mem -R "@RG\tID:TS-1_I331\tSM:TS-1_I331\tPL:illumina" /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-1/100505_I331_FC61K8DAAXX_L2_LYChxvRAADIAAPE_1.fq.gz /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-1/100505_I331_FC61K8DAAXX_L2_LYChxvRAADIAAPE_2.fq.gz > /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1_aligned.sam

samtools sort /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1_aligned.sam -o /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1_sort.bam

samtools rmdup /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1_sort.bam /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1_rmduped.bam

samtools index /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1_rmduped.bam 

gatk HaplotypeCaller -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa -I /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1_rmduped.bam -O /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-1.g.vcf.gz -ERC GVCF
