bwa mem -R "@RG\tID:616_FDSW202516817\tSM:616_FDSW202516817\tPL:illumina" /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/616_FDSW202516817-1r_1.clean.fq.gz /vol3/agis/huangsanwen_group/huyong/find_parents/20201010_slhiploid616/616_FDSW202516817-1r_2.clean.fq.gz > /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_aligned.sam

samtools sort /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_aligned.sam -o /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_sort.bam

samtools rmdup /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_sort.bam /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_sort_rmduped.bam

samtools index /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_sort_rmduped.bam

gatk HaplotypeCaller -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa -I /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_sort_rmduped.bam -O /vol3/agis/huangsanwen_group/huyong/find_parents/result/616.g.vcf.gz -ERC GVCF
