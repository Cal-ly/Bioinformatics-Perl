#!/usr/bin/perl -w
use strict;

#this program improves exercise 4.7. The FASTA file will be reversed, complimented and have
#added "ComplementStrand" to its header.

my $filename;
$filename = $ARGV[0];
if ($#ARGV < 0) {
	print "What FASTA file do you want to open: ";
	$filename = <STDIN>;
	chomp $filename;
}
#our user input from  either ARGV or from STDIN
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
			$seq = reverse $seq; #reverses $seq, our whole sequence as one string 
			for (my $i = 0; $i < length($seq); $i += 60) {
				$new_seq .= substr($seq, $i, 60). "\n"; 
			}
			#Printes out the sequence in a nice manner
			push(@seq_array, $new_seq); #Pushes the nicely mannered seq into a temp array
			unshift (@seq_array, $header); #Sets the header in start of the temp array
			push (@FASTA, @seq_array); #Sendes the array containing header and seq into the array
			@seq_array = (); 
			$seq = '';
			$new_seq = '';
			#Empties the tempoary array and variables
		}
		$header = "$line ComplimentStrand\n";
		#Adds "ComplimentStrand" to the variable $header
	}
	else {
		$line =~ tr/ATGC/TACG/;
		$seq .= $line;	  
	} #Compliments $seq
}

$seq = reverse $seq;
for (my $i = 0; $i < length($seq); $i += 60) {
	$new_seq .= substr($seq, $i, 60). "\n";
}
push(@seq_array, $new_seq);
unshift (@seq_array, $header);
push (@FASTA, @seq_array);
#Pushes the last entry into the FASTA array 

print @FASTA;