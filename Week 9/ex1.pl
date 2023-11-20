#!/usr/bin/perl -w
use strict;

#Make a subroutine that take a DNA sequence (string) as parameter and return the complement strand (reverse complement). 
#Use it to improve 7.3 which works on dna7.fsa.

my $filename = &input_fasta(@ARGV); #The input subroutine

my $seq;
my $header = '';
my @seq_array = ();
my @FASTA = ();
my $new_seq = '';
open(IN, '<', $filename) or die "$!";
while(defined (my $line = <IN>)) {
	chomp $line;
	if ($line =~ m/^\>/) { #finds the header
		if (defined $seq) { 
			$new_seq = &comprev($seq); 
			push (@FASTA, $header, $new_seq); #Sendes the array containing header and seq into the array
			@seq_array = (); 
			$seq = '';
			$new_seq = '';
			#Empties the tempoary array and variables
		}
		$header = "$line ComplimentStrand\n";
		#Adds "ComplimentStrand" to the variable $header
	}
	else {
		$seq .= $line;	  
	} 
}
$new_seq = &comprev($seq);
push (@FASTA, $header, $new_seq); #Sendes the array containing header and seq into the array
#Pushes the last entry into the FASTA array 
print @FASTA;

###############
# Subroutines #
###############

sub input_fasta { #The input subroutine, takes either the @ARGV as input or from the STDIN
	my @ARGV = @_; #sends argument vector to our default array (@_)
	my $filename;
	if ($#ARGV < 0) {
		print "What FASTA file do you want to open: ";
		$filename = <STDIN>;
		chomp $filename;
	}
	elsif ($#ARGV == 0) {
		$filename = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $filename;
}

sub comprev {
	my ($seq1) = @_;
	my $new_seq1;
	$seq1 =~ tr/ATGC/TACG/; #Compliments $seq
	$seq1 = reverse $seq1; #Reverses $seq
	for (my $i = 0; $i < length($seq1); $i += 60) {
		 $new_seq1 .= substr($seq1, $i, 60). "\n"; 
	} #Printes out the sequence in a nice manner
	return $new_seq1;
}