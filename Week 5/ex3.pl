#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
chomp $file;
open (IN, '<', "$file") or die "$!\n";
while (defined (my $line = <IN>)) {
	if (substr($line, 0, 2) eq 'ID') {
		my $id;		
		my $i = 2; 		
		while (substr($line, $i, 1) eq ' ') {
			$i++;
		}
		while (substr($line, $i, 1) ne ' ') {
			$id .= substr($line, $i, 1);
			$i++;
		}
		print "SwissProt ID: $id \n";
	}
	if (substr($line, 0, 2) eq 'AC') {
		my $ac;		
		my $i = 2; 		
		while (substr($line, $i, 1) eq ' ') {
			$i++;
		}
		while (substr($line, $i, 1) ne ';') {
			$ac .= substr($line, $i, 1);
			$i++;
		}
		print "Accession number: $ac \n";
	}
}

close IN;
