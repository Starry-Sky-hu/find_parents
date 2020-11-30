#bwa mem -R "@RG\tID:TS-2_I330\tSM:TS-2_I330\tPL:illumina" /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-2/100519_I330_FC61K6MAAXX_L2_LYChxvRABDIAAPE_1.fq.gz /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-2/100519_I330_FC61K6MAAXX_L2_LYChxvRABDIAAPE_2.fq.gz > /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2_aligned.sam

samtools sort /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2_aligned.sam -o /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2_sort.bam

samtools rmdup /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2_sort.bam /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2_rmduped.bam

samtools index /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2_rmduped.bam

gatk HaplotypeCaller -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa -I /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2_rmduped.bam -O /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-2.g.vcf.gz -ERC GVCF
