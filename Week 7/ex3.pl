#!/usr/bin/perl -w
use strict;

#Improve exercise 4.7 using all you have learned. The program shall now take a DNA FASTA file 
#(getting the file name from command line or asking interactively for it, both methods shall 
#work), and reverse and complement all entries in the file. There can be more than one entry, 
#study dna7.fsa. Hint: Use substitution or transliteration (translation) for complementing 
#the DNA.

my $filename;
$filename = $ARGV[0];
if ($#ARGV < 0) {
	print "What FASTA file do you want to open: ";
	$filename = <STDIN>;
	chomp $filename;
}

my $flag = 0;
my $seq;
my $header = '';
my @seq_array = ();
my @FASTA = ();
open(IN, '<', $filename) or die "$!";
while(defined (my $line = <IN>)) {
	chomp $line;
	$flag = 0 if $line =~ m/^\>/ and $line ne $header;
	$seq = $line if $flag == 1;
	$flag = 1 if $line =~ m/^\>/;
	if (defined $seq) {
		$seq =~ tr/ATGC/TACG/;
		push(@seq_array, $seq);
	}
	if (not defined $seq and scalar @seq_array > 0) {
		reverse @seq_array;
		push(@FASTA, @seq_array);
		undef @seq_array;
	}
	if ($line =~ m/^\>/) {
		$header = $line;
		push(@FASTA, $header);
	}
	undef $seq;
}

#print $header, "\n";
print @seq_array;
print @FASTA;


__END__

if (defined $seq) {
			$seq =~ tr/ATGC/TACG/;
			@seq_array = $seq;
			@seq_array = reverse @seq_array;
		}