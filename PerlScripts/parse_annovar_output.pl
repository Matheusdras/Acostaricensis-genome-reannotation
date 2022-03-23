#!/usr/bin/perl
#line498207      nonsynonymous SNV       MSTRG.12999:transcript:ACOC_0001328701-mRNA-1:exon4:c.C293A:p.A98E,MSTRG.12999:MSTRG.12999.1:exon7:c.C539A:p.A180E,     ACOC_scaffold0001951    7299    7299    C       A       hom     2813    80
#line498208      unknown UNKNOWN ACOC_scaffold0001952    1725    1725    C       T       hom     444     12
@an = `cat SNV.avinput.exonic_variant_function`;
chomp @an;
foreach(@an){
    @split = split(/\t/,$_);
    $split[1] =~ s/ SNV//;
    $freq = 'heterozygous';
    $freq = 'homozygous' if($_ =~ /AF=1/);
    unless($split[1] eq 'unknown'){
	$split[2] =~ s/,$//;
	if($split[2] =~ /,/){
	    @info = split(/,/,$split[2]);
	    foreach(@info){
		$_ =~ s/transcript:/transcript_/;
		$_ =~ s/gene:/gene_/;
		@in = split(/:/, $_);
		$in[1] =~ s/transcript_/transcript:/;
		print "$in[1]\t$split[1]\t$in[3]\t$in[4]\t$freq\n"; 
	    }
	}else{
	    $split[2] =~ s/transcript:/transcript_/;
	    $split[2] =~ s/gene:/gene_/;
	    @in = split(/:/, $split[2]);
	    $in[1] =~ s/transcript_/transcript:/;
	    print "$in[1]\t$split[1]\t$in[3]\t$in[4]\t$freq\n";
	}
    }
}
