#!/usr/bin/perl -w
use strict;

#Extract and print all MEDLINE article numbers which are mentioned in the entries.

my $filename;
$filename = $ARGV[0];
if ($#ARGV < 0) {
	print "What GenBank entry do you want to open: ";
	$filename = <STDIN>;
	chomp $filename;
}

my $acc;
my $def;
my $org;
my $med;
my $medline;
open(IN, '<', $filename) or die "Could not open $filename $!";
while(defined (my $line = <IN>)) {
	chomp $line;
	$acc = $1 if $line =~ m/^ACCESSION\s+(\w+)/;
	$def = $1 if $line =~ m/^DEFINITION\s+(.+)/;
	$org = $1 if $line =~ m/ORGANISM\s+(.+)/;
	$med = $1 if $line =~ m/MEDLINE\s+(\d+)/;
	if (defined $med) {
		$medline .= $med;
		$medline .= ";";
	}
	undef $med;
}

print "Accession number: $acc\n";
print "Definition: $def\n";
print "Organism: $org\n";
print "Medline numbers: $medline\n";