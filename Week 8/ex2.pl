#!/usr/bin/perl -w
use strict;

#this program uses the hashes from exercise 8.1, to translates all the nucleotide fasta 
#entries in dna7.fsa to amino acid sequence. Resultses are saved in a file aa7.fsa in fasta format
#and properly labeled.



my %AA = (
ATT => 'I', ATC => 'I', ATA => 'I', #Isoleucine  
CTT => 'L', CTC => 'L', CTA => 'L', CTG => 'L', TTA => 'L', TTG => 'L', #Leucine
GTT => 'V', GTC => 'V', GTA => 'V', GTG => 'V', #Valine
TTT => 'F', TTC => 'F',	#Phenylalanine
ATG => 'M', #Methionine
TGT => 'C', TGC => 'C', #Cysteine
GCT => 'A', GCC => 'A', GCA => 'A', GCG => 'A', #Alanine
GGT => 'G', GGC => 'G', GGA => 'G', GGG => 'G', #Glycine
CCT => 'P', CCC => 'P', CCA => 'P', CCG => 'P', #Proline
ACT => 'T', ACC => 'T', ACA => 'T', ACG => 'T', #Threonine
TCT => 'S', TCC => 'S', TCA => 'S', TCG => 'S', AGT => 'S', AGC => 'S', #Serine
TAT => 'Y', TAC => 'Y', #Tyrosine
TGG => 'W', #Tryptophan
CAA => 'Q', CAG => 'Q', #Glutamine
AAT => 'N', AAC => 'N', #Asparagine
CAT => 'H', CAC => 'H', #Histidine
GAA => 'E', GAG => 'E', #Glutamic acid
GAT => 'D', GAC => 'D', #Aspartic acid
AAA => 'K', AAG => 'K', #Lysine
CGT => 'R', CGC => 'R', CGA => 'R', CGG => 'R', AGA => 'R', AGG => 'R', #Arginine
TAA => 'stop', TAG => 'stop', TGA => 'stop'); #Stop codon

my $seq;
my $header = '';
my @seq_array = ();
my @FASTA = ();
my $new_seq = '';
my $amino = '';
my $tmp_amino = '';
open(IN, '<', 'dna7.fsa') or die "$!";
while(defined (my $line = <IN>)) {
	chomp $line;
	if ($line =~ m/^\>/) { 
		if (defined $seq) {
			my $amino = '';
			for (my $i = 0; $i < length($seq); $i += 3) {
				my $trans = substr($seq, $i, 3);
				$tmp_amino .= $AA{$trans}; #translates nuckleotides to amino acids via our hash table.
				if ($tmp_amino =~ m/stop/) { #stops when it translates a stop codon
					last;
				}
				else {
					$amino .= $tmp_amino;
					$tmp_amino = '';
				} 
			}
			#$amino .= $tmp_amino =~ m/(M\w+)stop/; I would have made a RE pattern matching an start Methionine (M) and end when it hit 'stop', but couldn't make it work.
			for (my $i = 0; $i < length($amino); $i += 60) {
				$new_seq .= substr($amino, $i, 60). "\n"; 
			}
			push (@FASTA, $header, $new_seq); #Sendes the array containing header and seq into the array
			@seq_array = (); 
			if ($seq =~ m/[^ATGC]+/){ #if there are anything but A, T, C or G in the sequence, it will stop, so the faulty sequence can be stricken. 
				print "Error in sequence $header" and die;
			}
			$seq = '';
			$new_seq = '';
			$amino = '';
			$tmp_amino = '';
		}
		$header = "$line Amino Acid Sequence\n";
	}
	else {
		$seq .= $line;  
	}
}


if ($seq =~ m/[^ATGC]+/){
	print "Error in sequence $header" and die;
}
for (my $i = 0; $i < length($seq); $i += 3) {
	my $trans = substr($seq, $i, 3);
	$tmp_amino = $AA{$trans};
	if ($tmp_amino =~ m/stop/) {
		last;
	}
	else {
		$amino .= $tmp_amino;
		$tmp_amino = '';
	}  
}
for (my $i = 0; $i < length($amino); $i += 60) {
	$new_seq .= substr($amino, $i, 60). "\n"; 
}
push (@FASTA, $header, $new_seq); #Sendes the array containing header and seq into the array

open(OUT, '>', 'aa7.fsa') or die "Could not create file\n";
print OUT @FASTA;
close OUT;

print @FASTA;
