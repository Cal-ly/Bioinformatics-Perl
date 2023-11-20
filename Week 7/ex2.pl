#!/usr/bin/perl -w
use strict;

#This program improves exercise 5.6 finding the ID, accession number and 
#amino acid sequence and printing of fasta file. Also verifies AA number.



my $filename;
$filename = $ARGV[0];
if ($#ARGV < 0) {
	print "What SwissProt file do you want to open: ";
	$filename = <STDIN>;
	chomp $filename;
}
#Our user-input

open(IN, '<', $filename) or die "$!";
my $id;
my $acc;
my $flag = 0;
my $sequence;
my $seq_head;
while (defined (my $line = <IN>)) {
	chomp $line;
	$id = $1 if $line =~ m/^ID\s+(\w+)/;
	$acc = $1 if $line =~ m/^AC\s+(\w+)/;
	$flag = 0 if $line =~ m|^//|;
	$sequence .= $line if $flag == 1;
	$flag = 1 if $line =~ m/^SQ\s+(\w+)/;
	$seq_head = $line if $line =~ m/^SQ\s+(\w+)/;
}
#using RE to find patterns in the file, and printing our search

print $id, "\n";
print $acc, "\n";
my $aa_num = $1 if $seq_head =~ m/^\w+\s+\w+\s+(\d+)/; #finds AA number
$sequence =~ s/\s//g; #cuts out wide-spaces
my $aa_length = length $sequence;
if ($aa_length != $aa_num) { 
	print "Amino number $aa_length doesn't match the number from header $aa_num\n";
} 
else { #if there is an error between the given length and actual length, I see no point in
print $sequence, "\n";	#printing the sequence on screen
}

my $new_file = $filename;
$new_file .= '.fsa';	#making the new filename from the old plus '.fsa'

open (OUT, '>', "$new_file") or die "Could not create file\n"; #creates a new file, called the same as the old file, but with .fsa appended after
print OUT ">$acc $id $aa_num AA\n";	#printes >, accession number, SwissProt ID, number of 
my $i = 0;							#amino acids to headline of the FASTA file.
while ($i < length($sequence)){ #this loop printes the amino sequence to 'sprot.fsa' with 60 chars per line
   print OUT substr($sequence, $i, 60), "\n";
   $i += 60;
}
close OUT;

