#!/usr/bin/perl
# MSTRG.4726.1_PILON      MSTRG.4726.1_PILON      100.000 25      423     447     DNLVLPIDDYLFSMFNHSHPPISER
@blast = `cat blastp.parsed.txt`;
chomp @blast;
# MSTRG.4726.1    nonsynonymous   c.G1310T        p.C437F homozygous      nonconservative
@annov = `cat annovar_parsed_conservation.tab`;
chomp @annov;
%HASH;
foreach(@blast){
    @split=split(/\t/,$_);
    $split[1] =~ s/_PILON//;
    $HASH{$split[1]}{$split[6]}="$split[4]-$split[5]";
}
open(LOG,'>./LOG.tab') or die $!;
foreach(@annov){
    @split=split(/\t/,$_);
    $split[3] =~ /p\.([A-Z])(\d+)([A-Z])/;
    $aa_bef = $1;
    $aa_coord = $2;
    $aa_aft = $3;
    foreach $pep (sort {$a cmp $b} keys %{$HASH{$split[0]}}){
	$coord = $HASH{$split[0]}{$pep};
	($start,$end)=split(/-/,$coord);
	$check = 0;
	if(($start <= $aa_coord)&&($end >= $aa_coord)){
	    @AA=split(//,$pep);
	    $pos_aa_pep = 0;
	    $aa = "";
	    for($i=0;$i <= $#AA; $i++){
		$pos_aa_pep = $start + $i;
		if(($pos_aa_pep eq $aa_coord)&&($AA[$i] eq $aa_aft)){
		    $aa .= "\[$aa_bef-$aa_aft\]";
		    $check = 1;
		}else{
		    $aa .= $AA[$i] #"\[$aa_bef-$AA[$i]\]";
		}
	    }
	    if($check){
		print "$split[0]\t$split[1]\t$split[2]\t$split[3]\t$split[4]\t$split[5]\t$aa\n";
	    }else{
		print LOG "$split[0]\t$split[1]\t$split[2]\t$split[3]\t$split[4]\t$split[5]\t$aa\t$coord\n";
	    }
												 
	}
    }
    #$HASH{$split[0]}{$2}="$1-$3";
}
close(LOG);
