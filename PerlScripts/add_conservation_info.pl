#!/usr/bin/perl
@annov = `cat annovar_parsed.tab`;
chomp @annov;
# MSTRG.10.1      nonsynonymous   c.G361C p.D121H homozygous
foreach(@annov){
    @split=split(/\t/,$_);
    if($split[1] eq 'nonsynonymous'){
	$split[3] =~ s/p\.//;
	@AA = split(/\d+/,$split[3]);
	#Voet
	if(($AA[0] =~ /[GAVLIMPFW]/) && ($AA[1] =~ /[GAVLIMPFW]/)){# Cadeias laterais apolares
	    print "$_\tconservative\n";
	}elsif(($AA[0] =~ /[STNQYC]/) && ($AA[1] =~ /[STNQYC]/)){# Cadeias laterais polares sem carga
	    print "$_\tconservative\n";
	}elsif(($AA[0] =~ /[KRH]/) && ($AA[1] =~ /[KRH]/)){# Cadeias laterais polares com carga positiva
	    print "$_\tconservative\n";
	}elsif(($AA[0] =~ /[DE]/) && ($AA[1] =~ /[DE]/)){# Cadeias laterais polares com carga negativa
	    print "$_\tconservative\n";
	}
	else{
	    print "$_\tnonconservative\n";
	}
    }else{
	print "$_\tNA\n";
    }
}

