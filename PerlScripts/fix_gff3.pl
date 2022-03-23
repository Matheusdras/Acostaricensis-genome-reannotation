#!/usr/bin/perl
@scaffolds = `cat scaffolds.txt`;
chomp @scaffolds;
#%scaffolds = map { $_ => 1 } @scaffolds;
@gff3 = `cat merged.gff3`;
chomp @gff3;
# # gffread -E merged.gtf --merge -o-
# ##gff-version 3
# ACOC_contig0000001      gffcl   locus   1402    2594    .       +       .       ID=RLOC_00000001;locus=RLOC_00000001;transcripts=MSTRG.1.1,transcript:ACOC_0000000001-mRNA-1
# ACOC_contig0000001      StringTie       transcript      1402    1798    1000.00 +       .       ID=MSTRG.1.1;geneID=MSTRG.1;locus=RLOC_00000001
# ACOC_contig0000001      StringTie       exon    1402    1489    1000.00 +       .       Parent=MSTRG.1.1
# ACOC_contig0000001      StringTie       exon    1611    1726    1000.00 +       .       Parent=MSTRG.1.1
# ACOC_contig0000001      StringTie       exon    1791    1798    1000.00 +       .       Parent=MSTRG.1.1
$scaf = "ACOC_contig0000001";
$check = 1;
$tag = 0;
$tag_cds = 0;
$gene = "";
$count = 0;
$cds = "";

print "##gff-version 3\n";
foreach(@gff3){
    if($_ !~ /#/){
	$_ =~ s/StringTie/BRAKER/;
	if($check){
	    @A = grep(/$scaf/, @scaffolds);
	    print "$A[0]\n";
	    $check = 0;
	}
	@split = split(/\t/,$_);
	if($scaf ne $split[0]){
	    $scaf = $split[0];
	    @A = grep(/$scaf/, @scaffolds);
	    print "$A[0]\n";
	}
	if($split[2] eq 'locus'){
	    $split[2] =~ s/locus/gene/;
	    $split[1] =~ s/gffcl/StringTie/;
	    $tag = 1;
	    @info = split(/;/,$split[8]);
	    
	    $gene = "$split[0]\t$split[1]\t$split[2]\t$split[3]\t$split[4]\t$split[5]\t$split[6]\t$split[7]";
	    
	}elsif($split[2] eq 'transcript'){
	    if($tag_cds){
		print "$cds";
		$tag_cds = 0;
	    }
	    
	    $count = 0;
	    $cds = "";
	    $_ =~ s/geneID=/Parent=gene:/;
	    $_ =~ s/transcript/mRNA/;
	    $_ =~ s/;locus=.+//;
	    
	    if($tag){
		@info = split(/;/,$split[8]);
		$info[1] =~ s/geneID=//;
		print "# Gene gene:$info[1]\n";
		print "$gene\tID=gene:$info[1];Name=$info[1];biotype=protein_coding\n";
		$tag = 0;
	    }
	    print "$_\n"
	}elsif($split[2] eq 'exon'){
	    #@info = split(/;/,$split[8]);
	    $count++;
	    $tag_cds = 1;
	    $_ =~ s/Parent=/ID=exon:/;
	    $split[8] =~ s/Parent=//;
	    print "$_\.$count;Parent=$split[8]\n";
	    $_ =~ s/ID=exon:/ID=cds:/;
	    $_ =~ s/exon/CDS/;
	    $cds .= "$_;Parent=$split[8]\n";
	}
    }
    #print "$_\n";
}
