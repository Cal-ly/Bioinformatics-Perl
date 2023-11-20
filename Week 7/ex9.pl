#!/usr/bin/perl -w
use strict;

#Extract and print ONLY the coding DNA. That is described in FEATURES - CDS 
#(Coding DNA Sequence). As an example, the line in data1.gb says 'join(2424..2610,3397..3542)' 
#and means that the coding sequence are bases 2424-2610 followed by bases 3397-3542. 
#The bases in between are an intron and not a part of the coding DNA. Remember to generalize; 
#there can be more (or less) than two exons, and the 'join' line can continue on the next line.

my $filename;
$filename = $ARGV[0];
if ($#ARGV < 0) {
	print "What GenBank entry do you want to open: ";
	$filename = <STDIN>;
	chomp $filename;
}

my $dannebrog = 0;
my $dna = '';
my $unionjack = 0;
my $cds = '';
open(IN, '<', $filename) or die "Could not open $filename $!";
while(defined (my $line = <IN>)) {
	chomp $line;
	$dannebrog = 0 if $line =~ m|^//|;
	$dna .= $line if $dannebrog == 1;
	$dannebrog = 1 if $line =~ m/\bORIGIN\b/;
	$unionjack = 1 if $line =~ m/\s+CDS\s+join\(/;
	$unionjack = 0 if $line =~ m|/\w+|;
	$cds .= $line if $unionjack == 1;
	$cds =~ s/\s//;
}



#  substr($var, $start - 1, ($end - $start) + 1)
#$dna =~ s/\d//g;
#$dna =~ s/\s//g;
#my $seq = substr($dna, 2424, 186);
#my $length = length $seq;
#my $seq = $dna =~ m/(\w{2424..2610})/;

#print "DNA sequence: $dna\n";
#print "Seq: $seq\n";
#print "$length \n";
print $cds;