gatk CombineGVCFs -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa \
		--variant /vol3/agis/huangsanwen_group/huyong/find_parents/result/616.g.vcf.gz \
		--variant /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-177.g.vcf.gz \
		--variant /vol3/agis/huangsanwen_group/huyong/find_parents/result/TS-523.g.vcf \
		-O /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_TS-177_TS-523_cohort.g.vcf.gz

gatk GenotypeGVCFs -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa \
		-V /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_TS-177_TS-523_cohort.g.vcf.gz \
		-O /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_TS-177_TS-523_cohort.vcf.gz

gatk SelectVariants -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa \
		-V /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_TS-177_TS-523_cohort.vcf.gz \
		--select-type-to-include SNP \
                -O /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_TS-177_TS-523_SNP.vcf.gz

gatk VariantsToTable -R /vol3/agis/huangsanwen_group/huyong/Snygenta/ref/S_lycopersicum_chromosomes.4.00.fa \
		-V /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_TS-177_TS-523_SNP.vcf.gz \
		-F CHROM -F POS -F REF -F ALT -GF GT \
		-O /vol3/agis/huangsanwen_group/huyong/find_parents/result/616_TS-177_TS-523.table
