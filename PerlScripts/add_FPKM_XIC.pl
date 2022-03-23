#!/usr/bin/perl
@FPKM = `tail -n +2 FPKM.csv`;
chomp @FPKM;
%fpkm;
@XIC = `tail -n +2 XIC_total.csv`;
chomp @XIC;
%xic;
@gff3 = `cat merged.fixed.b2g.gff3`;
chomp @gff3;

# "","ACAR-KAGF-1-cD1.transcript.parsed","ACAR-KAGF1-1-cD1.transcript.parsed","ACAR-KAGF2-2-cD1.transcript.parsed","ACAR-KAGM1-1-cD1.transcript.parsed","ACAR-KAGM2-2-cD1.transcript.parsed","ACAR-KAGM3-3-cD1.transcript.parsed"
# "MSTRG.1.1",0,0,0,0,0.152964995464207,0.154395581528849  
$count = 0;
foreach(@FPKM){
    $_ =~s/"//g;
    @split = split(/,/,$_);
    $count++ if (@split[1] == 0);
    $count++ if (@split[2] == 0);
    $count++ if (@split[3] == 0);
    $count++ if (@split[4] == 0);
    $count++ if (@split[5] == 0);
    $count++ if (@split[6] == 0);
    $sum = $split[1] + $split[2] + $split[3] + $split[4] + $split[5] + $split[6];
    if($count == 0){
	$average = 0;
    }else{
	$average = $sum/$count;
    }
    $count = 0;
    $fpkm{$split[0]}=$average;
}


# Locus;F1;F2;F3;F4;M1;M2;M3;M4
# MSTRG.6041.1;7.304019973051297E-06;5.808592996318592E-06;4.347849199362245E-06;5.980255325009917E-06;3.134865340292424E-06;4.399869072963327E-06;3.131811997276757E-06;3.235903282779698E-06
$count = 0;
foreach(@XIC){
    @split = split(/;/,$_);
    $count++ if @split[1] == 0;
    $count++ if @split[2] == 0;
    $count++ if @split[3] == 0;
    $count++ if @split[4] == 0;
    $count++ if @split[5] == 0;
    $count++ if @split[6] == 0;
    $count++ if @split[7] == 0;
    $count++ if @split[8] == 0;
    $sum = $split[1] + $split[2] + $split[3] + $split[4] + $split[5] + $split[6] + $split[7] + $split[8];
    if($count == 0){
	$average = 0;
    }else{
	$average = $sum/$count;
    }
#    print "$split[0]\t$average\n";
    $count = 0;
    $xic{$split[0]}=$average;
}

# ##gff-version 3
# ##sequence-region ACOC_contig0000001 1 323824
# # Gene gene:MSTRG.1
# ACOC_contig0000001      StringTie       gene    1402    2594    .       +       .       ID=gene:MSTRG.1;Name=MSTRG.1;biotype=protein_coding
# ACOC_contig0000001      BRAKER  mRNA    1402    1798    1000.00 +       .       ID=MSTRG.1.1;Parent=gene:MSTRG.1
# ACOC_contig0000001      BRAKER  exon    1402    1489    1000.00 +       .       ID=exon:MSTRG.1.1.1;Parent=MSTRG.1.1
# ACOC_contig0000001      BRAKER  exon    1611    1726    1000.00 +       .       ID=exon:MSTRG.1.1.2;Parent=MSTRG.1.1
# ACOC_contig0000001      BRAKER  exon    1791    1798    1000.00 +       .       ID=exon:MSTRG.1.1.3;Parent=MSTRG.1.1
# ACOC_contig0000001      BRAKER  CDS     1402    1489    1000.00 +       .       ID=cds:MSTRG.1.1;Parent=MSTRG.1.1
# ACOC_contig0000001      BRAKER  CDS     1611    1726    1000.00 +       .       ID=cds:MSTRG.1.1;Parent=MSTRG.1.1
# ACOC_contig0000001      BRAKER  CDS     1791    1798    1000.00 +       .       ID=cds:MSTRG.1.1;Parent=MSTRG.1.1
foreach(@gff3){
    if($_ =~ /#/){
	print "$_\n";
    }else{
	@split = split(/\t/,$_);
	if($split[2] eq 'mRNA'){
	    @ATT = split(/;/,$split[8]);
	    $ATT[0] =~ s/ID=//;
	    $fpkm_var = 0;
	    $xic_var = 0;
	    if($fpkm{$ATT[0]}){
		$fpkm_var = $fpkm{$ATT[0]};
	    }else{
		  $fpkm_var = 0;
	    }
	    if($xic{$ATT[0]}){
		$xic_var = $xic{$ATT[0]};
	    }else{
		  $xic_var = 0;
	    }
	    print "$_;Info=FPKM:$fpkm_var,XIC:$xic_var\n";
	}else{
	    print "$_\n";
	} 
    }
}

