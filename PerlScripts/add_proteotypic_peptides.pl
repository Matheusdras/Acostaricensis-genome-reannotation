#!/usr/bin/perl
# NSPAILFIDEIDAIAPK       103     2        | transcript:ACOC_0000421101-mRNA-1 | MSTRG.4254.1
# SHVVVIAATNRPNSIDAALR    62      2        | transcript:ACOC_0000421101-mRNA-1 | MSTRG.4254.1
@PEP = `cat WB_BK_PEP.txt`;
chomp @PEP;
%HASH;

@gff3 = `cat merged.fixed.b2g.gff3`;
chomp @gff3;
    
foreach(@PEP){
    @split = split(/\t/, $_);
    $split[3] =~ s/ //g;
    $split[3] =~ s/^\|//;
    if($split[2] == 1){
	$HASH{$split[3]}{$split[0]}=$split[1];
    }
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
            $pep = "";
            if($HASH{$ATT[0]}){
		foreach $i (sort {$a cmp $b} keys %{$HASH{$ATT[0]}}){
		    $pep .= "$i(Spectrum count = $HASH{$ATT[0]}{$i})|";
		}
            }else{
                  $pep = 0;
            }
	    $pep =~ s/\|$//;
	    if($pep){
		print "$_,ProteotypicPeptide:$pep\n";
	    }else{
		print "$_\n";
	    }
        }else{
            print "$_\n";
        }
    }
}
