#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
chomp $file;
my $flag = 0;
my $seq;
my $aa_num;
my $id;
my $ac;
open (IN, '<', "$file") or die "$!\n";
while (defined (my $line = <IN>)) {
	chomp $line;	
	if (substr($line, 0, 2) eq 'ID') {		
		my $i = 2; 		
		while (substr($line, $i, 1) eq ' ') {
			$i++;
		}
		while (substr($line, $i, 1) ne ' ') {
			$id .= substr($line, $i, 1);
			$i++;
		}
	}
	if (substr($line, 0, 2) eq 'AC') {		
		my $i = 2; 		
		while (substr($line, $i, 1) eq ' ') {
			$i++;
		}
		while (substr($line, $i, 1) ne ';') {
			$ac .= substr($line, $i, 1);
			$i++;
		}	
	}
	if(substr($line, 0, 2) eq 'SQ'){
		my $i = 2;
		my $header;
		while (substr($line, $i, 3) ne 'AA;'){
			if (substr($line, $i, 1) eq ' '){
				$i++;
			}
			elsif (substr($line, $i, 1) ne ' '){
				$header .= substr($line, $i, 1);
				$i++;
			}
		}
		my $length_head = length($header);
		$length_head -= 8;
		$aa_num = substr($header, 8, $length_head);
	}
	$flag = 0 if substr($line, 0, 2) eq '//';	
	$seq .= $line if $flag == 1;	
	$flag = 1 if substr($line, 0, 2) eq 'SQ';
}
my $seq1;
my $length_seq = length($seq);
my $j = 0;
while ($j < $length_seq){	
	if (substr($seq, $j, 1) eq ' '){
		$j++;
	}
	elsif (substr($seq, $j, 1) ne ' '){
		$seq1 .= substr($seq, $j, 1);
		$j++;
	}
}
my $length_seq1 = length($seq1);
if ($length_seq1 ne $aa_num){
	print "Length of amino sequence: $length_seq1 ";
	print "doesn't match given headline: $aa_num \n"; 
}

close IN;
print "SwissProt ID: $id \n";
print "Accession number: $ac \n";
print "Amino sequence:\n$seq1\n";



