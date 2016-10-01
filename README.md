# Perl_check_RNAseq_5_3_Bias
This is to computer a summary score to represent 5'-3' bias for a RNAseq data based on its RseQC's geneBody_coverage output. 

Steps:

0: prepare input file and gene models (house-keeping genes, for e.g.)

1: In RseQC: run geneBody_coverage.py -r gene_model.bed -i input.bam -o test 

2: run perl get_53_bias_score.pl test.geneBodyCoverage.txt test.53_bias.score

