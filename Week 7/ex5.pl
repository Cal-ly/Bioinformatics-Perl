#!/usr/bin/perl -w
use strict;

#Extract the accession number, the definition and the organism (and print it).

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
open(IN, '<', $filename) or die "Could not open $filename $!";
while(defined (my $line = <IN>)) {
	chomp $line;
	$acc = $1 if $line =~ m/^ACCESSION\s+(\w+)/;
	$def = $1 if $line =~ m/^DEFINITION\s+(.+)/;
	$org = $1 if $line =~ m/ORGANISM\s+(.+)/
}

print "Accession number: $acc\n";
print "Definition: $def\n";
print "Organism: $org\n";