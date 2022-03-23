#!/usr/bin/perl
@b2g = `tail -n +2 omicsbox_export.clean.parsed.txt`;
chomp @b2g;
%HASH;
@gff3 = `cat merged.fixed.gff3`;
chomp @gff3;
# Sequence Name   Sequence Description    Mapping XRef Database:Mapping XRef      Mapping GO ID   Mapping GO Term InterPro Accession      InterPro Name
# MSTRG.8.2       cAMP-dependent protein kinase catalytic subunit UniProt:POM52890,UniProt:PIO77039,UniProt:CAD45619,UniProt:PAV57374,UniProt:PIO77039,UniProt:POM52890,UniProt:OZF92677,UniProt:CAD45619,UniProt:EJD74028,UniProt:EJD74028,UniProt:PIC54767,UniProt:PIC54767,UniProt:OZF92677,UniProt:POM52890,UniProt:EJD74028,UniProt:PAV57374,UniProt:PAV57363,UniProt:XP_013292449,UniProt:AAC46513,UniProt:OZF92677,UniProt:PAV57363,UniProt:PAV57368,UniProt:PAV57368,UniProt:VIO94850,UniProt:CAD45619,UniProt:VIO94850,UniProt:PIC54767,UniProt:PIC54767,UniProt:PIC54767,UniProt:PAV57368,UniProt:VIO94850,UniProt:PAV57368,UniProt:XP_013292449,UniProt:PAV57363,UniProt:CAD45619,UniProt:PAV57369,UniProt:PAV57369,UniProt:AAC46513,UniProt:VIO94850,UniProt:PIC54767,UniProt:VIO94850,UniProt:CAD45619,UniProt:PIO77039,UniProt:XP_013292449,UniProt:PAV57369,UniProt:PAV57368,UniProt:VIO94850,UniProt:PIO77039,UniProt:PAV57374,UniProt:XP_013292449,UniProt:PAV57369,UniProt:CAD45619,UniProt:PAV57369,UniProt:OZF92677,UniProt:POM52890,UniProt:XP_013292449,UniProt:XP_013292449,UniProt:CAD45619,UniProt:CAD45619,UniProt:CAD45619,UniProt:OZF92677,UniProt:XP_013292449,UniProt:AAC46513,UniProt:VIO94850,UniProt:PIO77039,UniProt:PIO77039,UniProt:POM52890,UniProt:PIO77039,UniProt:PAV57374,UniProt:EJD74028,UniProt:POM52890,UniProt:PAV57369,UniProt:PAV57368,UniProt:XP_013292449,UniProt:POM52890,UniProt:PAV57363,UniProt:PAV57369,UniProt:OZF92677,UniProt:XP_013292449,UniProt:PAV57368,UniProt:VIO94850,UniProt:PAV57374,UniProt:CAD45619,UniProt:OZF92677,UniProt:PAV57368,UniProt:EJD74028,UniProt:EJD74028,UniProt:EJD74028,UniProt:OZF92677,UniProt:PIC54767,UniProt:OZF92677,UniProt:PAV57363,UniProt:XP_013292449,UniProt:PAV57363,UniProt:PAV57369,UniProt:PAV57368,UniProt:CAD45619,UniProt:PAV57374,UniProt:CAD45619,UniProt:XP_013292449,UniProt:PAV57374,UniProt:EJD74028,UniProt:AAC46513,UniProt:PIO77039,UniProt:PAV57374,UniProt:POM52890,UniProt:CAD45619,UniProt:AAC46513,UniProt:AAC46513,UniProt:AAC46513,UniProt:PAV57374,UniProt:PAV57363,UniProt:PAV57369,UniProt:CAD45619,UniProt:OZF92677,UniProt:POM52890,UniProt:PIO77039,UniProt:PAV57363,UniProt:POM52890,UniProt:AAC46513,UniProt:AAC46513,UniProt:PAV57369,UniProt:AAC46513,UniProt:EJD74028,UniProt:PAV57374,UniProt:VIO94850,UniProt:PIC54767,UniProt:PAV57368,UniProt:CAD45619,UniProt:VIO94850,UniProt:OZF92677,UniProt:PIC54767,UniProt:CAD45619,UniProt:PAV57374,UniProt:AAC46513,UniProt:PAV57368,UniProt:PIO77039,UniProt:PAV57363,UniProt:CAD45619,UniProt:CAD45619,UniProt:PIC54767,UniProt:PAV57363,UniProt:POM52890,UniProt:PIC54767,UniProt:PAV57369,UniProt:VIO94850,UniProt:EJD74028,UniProt:EJD74028,UniProt:PAV57363    GO:0004679-IEA,GO:0000166-IEA,GO:0010737-IBA,GO:0034237-IEA,GO:0016310-IEA,GO:0016740-IEA,GO:0016301-IEA,GO:1900195-IMP,GO:0004691-IDA,GO:0004691-IEA,GO:0007186-IEA,GO:0004672-IEA,GO:0004674-IEA,GO:0005524-IEA,GO:0005634-IBA,GO:0006468-IDA,GO:0006468-IEA,GO:0005952-ISS    AMP,nucleotide binding,protein kinase A signaling,protein kinase A regulatory subunit binding,phosphorylation,transferase activity,kinase activity,positive regulation of oocyte maturation,cAMP,cAMP,G protein,protein kinase activity,protein serine/threonine kinase activity,ATP binding,nucleus,protein phosphorylation,protein phosphorylation,cAMP noIPR,noIPR,IPR000719,noIPR,noIPR,IPR039083,IPR000719,IPR000961,noIPR,IPR011009 E3 ubiquitin ligase RBR family,E3 ubiquitin ligase RBR family,Protein kinase domain,Protein kinase domain,Protein kinase domain,cAMP-dependent protein kinase catalytic subunit beta,Protein kinase domain,AGC-kinase, C-terminal,AGC-kinase, C-terminal,Protein kinase-like domain superfamily
foreach(@b2g){
    @split=split(/\t/,$_);
    $HASH{$split[0]}="$split[1]\t$split[2]\t$split[3]\t$split[4]\t$split[5]\t$split[6]";
}

# ###gff-version 3
# ##sequence-region ACOC_contig0000001 1 323824
# # Gene gene:MSTRG.1
# ACOC_contig0000001      StringTie       gene    1402    2594    .       +       .       ID=gene:MSTRG.1;Name=MSTRG.1;biotype=protein_coding
# ACOC_contig0000001      BRAKER  mRNA    1402    1798    1000.00 +       .       ID=MSTRG.1.1;Parent=gene:MSTRG.1
foreach(@gff3){
    if($_ =~ /#/){
	print "$_\n";
    }else{
	@split = split(/\t/,$_);
	$split[8] =~ /ID=(.+);Parent/;
	if($1 =~ /ACOC/){
	    $_ =~ s/BRAKER/WormBase_imported/;
	}
	$split[8] =~ /ID=(.+);Parent/;
	if($split[2] eq 'mRNA'){
	    #	    $split[8] =~ /ID=transcript:(.+);Parent/;
	    if($HASH{$1}){
		$b2g = $HASH{$1};
		@B2G = split(/\t/,$b2g);
		if(($B2G[1] eq "")|($B2G[4] eq "")|($B2G[2] eq "")){
		    if(($B2G[0] eq 'unnamed protein product')|($B2G[0] eq '---NA---')){
			print "$_\n";
		    }else{
			$attr .= "$_;Product=$B2G[0];";
			if(!($B2G[1] eq "")){
			    $attr .= "Dbxref=@B2G[1];";
			}
			if(!($B2G[4] eq "")){
			    $attr .= "InterPro:$B2G[4];";
			}
			if(!($B2G[2] eq "")){
			    $attr .= "Ontology_term=@B2G[2]";
			}
			$attr =~ s/;$//;
			print "$attr\n";
			$attr = "";
		    }
		}elsif(($B2G[0] eq 'unnamed protein product') | ($B2G[0] eq '---NA---')){
		    print "$_/Dbxref=@B2G[1],InterPro:$B2G[4];Ontology_term=@B2G[2]\n";
		}else{
		    print "$_;Product=$B2G[0];Dbxref=@B2G[1],InterPro:$B2G[4];Ontology_term=@B2G[2]\n";
		}
	    }else{
		print "$_\n";
	    }
	}else{
	    print "$_\n";
	}
    } 
}
