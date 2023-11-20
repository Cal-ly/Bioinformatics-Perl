#!/usr/bin/perl -w
use strict;

#Extracts the accession number, the definition and the organism (and print it).
#Extracts and print all MEDLINE article numbers which are mentioned in the entries.
#Extracts and print the translated gene (the amino acid sequence). 
#Extracts and print the DNA (whole base sequence in the end of the file).

my $filename;
$filename = $ARGV[0];
if ($#ARGV < 0) {
	print "What GenBank entry do you want to open: ";
	$filename = <STDIN>;
	chomp $filename;
}
#Our user-input
my $acc;
my $def;
my $org;
my $med;
my $medline;
my $amino1;
my $amino2;
my $flag = 0;
my $dannebrog = 0;
my $dna;
open(IN, '<', $filename) or die "Could not open $filename $!";
while(defined (my $line = <IN>)) {
	chomp $line;
	$acc = $1 if $line =~ m/^ACCESSION\s+(\w+)/;
	$def = $1 if $line =~ m/^DEFINITION\s+(.+)/;
	$org = $1 if $line =~ m/ORGANISM\s+(.+)/;
	$med = $1 if $line =~ m/MEDLINE\s+(\d+)/;
	#takes out all that mathes the RE pattern
	if (defined $med) {
		$medline .= $med;
		$medline .= ";";
	}
	undef $med;
	#saves the MEDLINE in a new variable and undefines $med for new input
	$amino1 = $1 if $line =~ m/\/translation="(\w+)/;
	$amino2 .= $line if $flag == 1;
	$flag = 1 if $line =~ m/\/translation="\w+/;
	$flag = 0 if $line =~ m/\s+\w+"/;
	#Takes out the amino sequence with stateful parsing 
	$dannebrog = 0 if $line =~ m|^//|;
	$dna .= $line if $dannebrog == 1;
	$dannebrog = 1 if $line =~ m/\bORIGIN\b/;
	#Takes out the ORIGEN header
}

$amino2 =~ s/\W//g;
$amino1 .= $amino2;
#Removes all non-words from $amino

$dna =~ s/\d//g;
$dna =~ s/\s//g;
#Removes all widespaces and digits from $dna

print "Accession number: $acc\n";
print "Definition: $def\n";
print "Organism: $org\n";
print "Medline numbers: $medline\n";
print "Amino Acid sequence: $amino1\n";
print "DNA sequence: $dna\n";