gtfToGenePred -genePredExt merged.CDS.gtf angiodb/AC_refGene.txt
retrieve_seq_from_fasta.pl --format refGene --seqfile angiostrongylus_costaricensis.PRJEB494.WBPS15.genomic.fa angiodb/AC_refGene.txt --out angiodb/AC_refGeneMrna.fa
convert2annovar.pl --withfreq  --allelicfrac --includeinfo --format vcf SNV.vcf > SNV.avinput
annotate_variation.pl -geneanno -buildver AC SNV.avinput angiodb/
perl parse_annovar_output.pl | sort > annovar_parsed.tab
