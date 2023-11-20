#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
chomp $file;
my $flag = 0;
my $seq;
my $seq1;
my $aa_num;
my $id;
my $ac;
open (IN, '<', "$file") or die "$!\n";
while (defined (my $line = <IN>)) {
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
	$flag = 0 if substr($line, 0, 2) eq '//';	
	$seq .= $line if $flag == 1;	
	$flag = 1 if substr($line, 0, 2) eq 'SQ';
}

close IN;
print "SwissProt ID: $id \n";
print "Accession number: $ac \n";
print "Amino sequence:\n$seq";




