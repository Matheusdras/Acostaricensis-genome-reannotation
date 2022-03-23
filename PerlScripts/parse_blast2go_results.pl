#!/usr/bin/perl
@b2g = `cat omicsbox_export.clean.txt`;
chomp @b2g;
# transcript_ACOC_0000017801-mRNA-1       unnamed protein product GO:0005515-IPI;GO:0004888-IEA;GO:0016020-IEA;GO:0005230-IEA;GO:0016021-IEA;GO:0034220-IEA;GO:0015293-IEA;GO:0006811-IEA;GO:0005216-IEA;GO:0005886-N/A   protein binding-IPI;transmembrane signaling receptor activity-IEA;membrane-IEA;extracellular ligand-gated ion channel activity-IEA;integral component of membrane-IEA;ion transmembrane transport-IEA;symporter activity-IEA;ion transport-IEA;ion channel activity-IEA;plasma membrane-N/A     GO:0004888;GO:0005230;GO:0005515;GO:0015293;GO:0016021;GO:0034220       transmembrane signaling receptor activity;extracellular ligand-gated ion channel activity;protein binding;symporter activity;integral component of membrane;ion transmembrane transport noIPR;IPR040279 Beta-lactamase/transpeptidase-like;Neuropeptide-like peptide 36 ;
# transcript_ACOC_0000000101-mRNA-1       ATP-dependent Clp protease adaptor protein ClpS PIC51320;RCN38052;CCD66417;CCD66417;PAV65135;PAV60226;CCD66417;VDO53370;PAV60226;CCD66417;XP_003104726;PAV65135;VDL66789;KHJ84734;RCN38052;EGT32553;VDO53370;ETN84892;OZF75134;CCD66417;POM29230;OZG17567;POM29230;ETN84892;OZF75134;EYB82686;ETN84892;POM29230;OZG17567;EYB82686;VDL66789;KHJ84734;KAF1770368;EGT32553;OZF75134;EYB82686;ETN84892;CAP31056;RCN38052;CCD66417;CCD66417;CCD66417;EGT32553;VDM51587;XP_003104726;PIC51320;CAP31056;EGT32553;ETN84892;POM29230;VDO53370;KAF1770368;CAP31056;VDL66789;CCD66417;PAV60226;EYB82686;VDL66789;EGT32553;CAP31056;PAV65135;OZG17567;VDL66789;ETN84892;KHJ84734;POM29230;PIC51320;VDM51587;PIC51320;VDM51587;PIC51320;OZG17567;OZF75134;EYB82686;POM29230;ETN84892;CAP31056;EYB82686;OZG17567;CAP31056;XP_003104726;OZF75134;PAV65135;VDM51587;VDL66789;OZG17567;CCD66417;EGT32553;ETN84892;KAF1770368;ETN84892;RCN38052;CAP31056;KHJ84734;PAV60226;CAP31056;CAP31056;VDM51587;XP_003104726;XP_003104726;KHJ84734;CCD66417;CAP31056;CCD66417;VDO53370;CCD66417;PAV65135;OZF75134;RCN38052;CCD66417;KHJ84734;KAF1770368;EYB82686;CCD66417;XP_003104726;PAV65135;CCD66417;CAP31056;VDO53370;PAV60226;XP_003104726;VDO53370;KAF1770368;VDO53370;POM29230;PIC51320;CAP31056;OZF75134;OZG17567;VDM51587;PIC51320;EGT32553;CAP31056;PAV60226;CAP31056;CAP31056;RCN38052;CCD66417 InterPro;UniProt;GO_Central;GO_Central;UniProt;UniProt;GO_Central;InterPro;UniProt;GO_Central;InterPro;UniProt;UniProt;UniProt;UniProt;InterPro;InterPro;UniProt;InterPro;GO_Central;InterPro;InterPro;InterPro;UniProt;InterPro;InterPro;UniProt;InterPro;InterPro;InterPro;UniProt;UniProt;InterPro;InterPro;InterPro;InterPro;UniProt;GO_Central;UniProt;GO_Central;GO_Central;GO_Central;InterPro;UniProt;InterPro;InterPro;GO_Central;InterPro;UniProt;InterPro;InterPro;InterPro;GO_Central;UniProt;GO_Central;UniProt;InterPro;UniProt;InterPro;GO_Central;UniProt;InterPro;UniProt;UniProt;UniProt;InterPro;InterPro;UniProt;InterPro;UniProt;InterPro;InterPro;InterPro;InterPro;InterPro;UniProt;GO_Central;InterPro;InterPro;GO_Central;InterPro;InterPro;UniProt;UniProt;UniProt;InterPro;GO_Central;InterPro;UniProt;InterPro;UniProt;UniProt;GO_Central;UniProt;UniProt;GO_Central;GO_Central;UniProt;InterPro;InterPro;UniProt;GO_Central;GO_Central;GO_Central;InterPro;GO_Central;UniProt;InterPro;UniProt;GO_Central;UniProt;InterPro;InterPro;GO_Central;InterPro;UniProt;GO_Central;GO_Central;InterPro;UniProt;InterPro;InterPro;InterPro;InterPro;InterPro;InterPro;GO_Central;InterPro;InterPro;UniProt;InterPro;InterPro;GO_Central;UniProt;GO_Central;GO_Central;UniProt;GO_Central    GO:0005737-IBA;GO:0046872-IEA;GO:0000151-IBA;GO:0016020-IEA;GO:0006508-IEA;GO:0071596-IBA;GO:0071596-IEA;GO:0016021-IEA;GO:2000212-IMP;GO:2000212-IEA;GO:0016740-IEA;GO:0031624-IPI;GO:0031624-IEA;GO:0016567-IBA;GO:0016567-IEA;GO:0061630-IBA;GO:0061630-IEA;GO:0008270-IEA;GO:0008233-IEA;GO:0030163-IEA;GO:0043058-IMP;GO:0043058-IEA       cytoplasm-IBA;metal ion binding-IEA;ubiquitin ligase complex-IBA;membrane-IEA;proteolysis-IEA;ubiquitin-dependent protein catabolic process via the N-end rule pathway-IBA;ubiquitin-dependent protein catabolic process via the N-end rule pathway-IEA;integral component of membrane-IEA;negative regulation of glutamate metabolic process-IMP;negative regulation of glutamate metabolic process-IEA;transferase activity-IEA;ubiquitin conjugating enzyme binding-IPI;ubiquitin conjugating enzyme binding-IEA;protein ubiquitination-IBA;protein ubiquitination-IEA;ubiquitin protein ligase activity-IBA;ubiquitin protein ligase activity-IEA;zinc ion binding-IEA;peptidase activity-IEA;protein catabolic process-IEA;regulation of backward locomotion-IMP;regulation of backward locomotion-IEA     GO:0000151;GO:0005737;GO:0008233;GO:0008270;GO:0016021;GO:0016567;GO:0031624;GO:0043058;GO:0061630;GO:0071596;GO:2000212        ubiquitin ligase complex;cytoplasm;peptidase activity;zinc ion binding;integral component of membrane;protein ubiquitination;ubiquitin conjugating enzyme binding;regulation of backward locomotion;ubiquitin protein ligase activity;ubiquitin-dependent protein catabolic process via the N-end rule pathway;negative regulation of glutamate metabolic process       noIPR;IPR039164;noIPR   Collagen triple helix repeat;E3 ubiquitin-protein ligase UBR1-like;E3 ubiquitin-protein ligase UBR1-like        ;ubiquitin protein ligase activity/ubiquitin-dependent protein catabolic process via the N-end rule pathway;
$go = "";
$db = "";
$go_term = "";
$intpro = "";
$intprot_term = "";
foreach(@b2g){
    @split = split(/\t/,$_);
    $split[0] =~ s/transcript_/transcript:/;
    @XREF = split(/;/,$split[2]);
    @DB = split(/;/,$split[3]);
    @GO_ID = split(/;/,$split[4]);
    @GO_TERM = split(/;/,$split[5]);
    @IP_ID = split(/;/,$split[8]);
    @IP_TERM = split(/;/,$split[9]);

    for($i = 0; $i <= $#XREF; $i++){
	$XREF[$i] =~ s/-.+$//;
	$DB[$i] =~ s/InterPro/EMBL/ if($DB[$i] eq 'InterPro');
	$db .= "$DB[$i]:$XREF[$i],";
    }

    
    for($i = 0; $i <= $#GO_ID; $i++){
	$GO_TERM[$i] =~ s/-.+$//;
	$go .= "$GO_ID[$i],";
	$go_term .="$GO_TERM[$i],"; 
    }

    for($i = 0; $i <= $#IP_ID; $i++){
	if($split[1] =~ /unnamed/){
	    $split[1] = $IP_TERM[$i] if($IP_ID[$i] ne 'noIPR');
	}
	$intpro_term .= "$IP_TERM[$i],";
	next if($IP_ID[$i] eq 'noIPR');
	$intpro .= "InterPro:$IP_ID[$i],";
    }
    $db =~ s/,$//;
    $go =~ s/,$//;
    $go_term =~ s/,$//;
    $intpro =~ s/,$//;
    $intpro_term =~ s/,$//;
    print "$split[0]\t$split[1]\t$db\t$go\t$go_term\t$intpro\t$intpro_term\n";
    $db = "";
    $go = "";
    $go_term = "";
    $intpro = "";
    $intpro_term = "";
}
