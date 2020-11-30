#bwa mem -R "@RG\tID:TS-523_I102\tSM:TS-523_I102\tPL:illumina" /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-523/merge_TS-523_R1.clean.fastq.gz /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/TS-523/merge_TS-523_R2.clean.fastq.gz > /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523_aligned.sam

samtools sort /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523_aligned.sam -o /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523_sort.bam

samtools rmdup /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523_sort.bam /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523_rmduped.bam

samtools index /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523_rmduped.bam

gatk HaplotypeCaller -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa -I /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523_rmduped.bam -O /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523.g.vcf -ERC GVCF
