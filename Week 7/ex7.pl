#!/usr/bin/perl -w
use strict;

#Extract and print the translated gene (the amino acid sequence). 
#Look for the line starting with /translation=. Generalize; An amino acid sequence can be 
#short, i.e. only one line in the feature table, or long, i.e. more than one line in the 
#feature table.

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
my $amino1;
my $amino2;
my $flag = 0;
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
	$amino1 = $1 if $line =~ m/\/translation="(\w+)/;
	$amino2 .= $line if $flag == 1;
	$flag = 1 if $line =~ m/\/translation="\w+/;
	$flag = 0 if $line =~ m/\s+\w+"/;
}

$amino2 =~ s/\W//g;
$amino1 .= $amino2;

print "Accession number: $acc\n";
print "Definition: $def\n";
print "Organism: $org\n";
print "Medline numbers: $medline\n";
print "Amino Acid sequence: $amino1\n";