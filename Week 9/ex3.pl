#!/usr/bin/perl -w
use strict;

#This program can translate a codon to the corresponding amnio acid

my %codon = (
ATT => 'I, Isoleucine', ATC => 'I, Isoleucine', ATA => 'I, Isoleucine', #Isoleucine  
CTT => 'L, Leucine', CTC => 'L, Leucine', CTA => 'L, Leucine', CTG => 'L, Leucine', TTA => 'L, Leucine', TTG => 'L, Leucine', #Leucine
GTT => 'V, Valine', GTC => 'V, Valine', GTA => 'V, Valine', GTG => 'V, Valine', #Valine
TTT => 'F, Phenylalanine', TTC => 'F, Phenylalanine', #Phenylalanine
ATG => 'M, Methionine', #Methionine
TGT => 'C, Cysteine', TGC => 'C, Cysteine', #Cysteine
GCT => 'A, Alanine', GCC => 'A, Alanine', GCA => 'A, Alanine', GCG => 'A, Alanine', #Alanine
GGT => 'G, Glycine', GGC => 'G, Glycine', GGA => 'G, Glycine', GGG => 'G, Glycine', #Glycine
CCT => 'P, Proline', CCC => 'P, Proline', CCA => 'P, Proline', CCG => 'P, Proline', #Proline
ACT => 'T, Threonine', ACC => 'T, Threonine', ACA => 'T, Threonine', ACG => 'T, Threonine', #Threonine
TCT => 'S, Serine', TCC => 'S, Serine', TCA => 'S, Serine', TCG => 'S, Serine', AGT => 'S, Serine', AGC => 'S, Serine', #Serine
TAT => 'Y, Tyrosine', TAC => 'Y, Tyrosine', #Tyrosine
TGG => 'W, Tryptophan', #Tryptophan
CAA => 'Q, Glutamine', CAG => 'Q, Glutamine', #Glutamines
AAT => 'N, Asparagine', AAC => 'N, Asparagine', #Asparagine
CAT => 'H, Histidine', CAC => 'H, Histidine', #Histidine
GAA => 'E, Glutamic Acid', GAG => 'E, Glutamic Acid', #Glutamic acid
GAT => 'D, Aspartic Acid', GAC => 'D, Aspartic Acid', #Aspartic acid
AAA => 'K, Lysine', AAG => 'K, Lysine', #Lysine
CGT => 'R, Arginine', CGC => 'R, Arginine', CGA => 'R, Arginine', CGG => 'R, Arginine', AGA => 'R, Arginine', AGG => 'R, Arginine', #Arginine
TAA => 'stop codon', TAG => 'stop codon', TGA => 'stop codon'); #Stop codon


my $triplet = &inputcmd(@ARGV); #The input subroutine
$triplet = uc($triplet); #Takes out the factor, that the input has to be uppercase
my $end_result = &trans($triplet); #the translate subroutine
print "$end_result\n";


###############
# Subroutines #
###############

sub inputcmd { #standard input subroutine
	my @ARGV = @_;
	my $in_codon;
	if ($#ARGV < 0) {
		print "Which codon do you want translate: ";
		$in_codon = <STDIN>;
		chomp $in_codon;
	}
	elsif ($#ARGV == 0) {
		$in_codon = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $in_codon;
}

sub trans { #Uses the look-up table to translate or sends a errormessage to the result to be printed
   my ($triplet) = @_;
   my $result = '';
   if (exists $codon{$triplet}) {
      $result = "The corresponding amino acid is: $codon{$triplet}";
   }
   elsif ($triplet !~ m/^[ATGC]+$/) {
      $result = "Input contains other letters than A,C,T, or G";
   }
   elsif (length($triplet) < 3) {
      $result = "Input contains less than 3 letters";
   }
   elsif (length($triplet) > 3) {
      $result = "Input contains more than 3 letters";
   }
   else {
      $result = "Input $triplet not understood";
   }
   return $result;
}















__END__



die "$triplet is not valid input" if $triplet !~ m/^[ATGC]{3}$/;
   
      exists $codon{$triplet} or die "Not nucleotide string: $triplet\n";
      $AA = $codon{$triplet};
      $aminoseq .= $AA if $AA ne 'STOP';




# Get the filename
my $filename;
if ($#ARGV < 0) {
   print "What file do you want to translate to AA: ";
   $filename = <STDIN>;
   chomp $filename;
} elsif ($#ARGV == 0) {
   $filename = $ARGV[0];
} else {
   die "Too many arguments\n";
}

open(OUT, '>', 'aa7.fsa') or die "Could not create file\n";
# Read file
open(IN, '<', $filename) or die "Could not read file ($filename)\n";
my $line = '';
# Finding the header line ">....."
$line = <IN> while (defined $line and $line !~ m/^>/);
while (defined $line) {
   chomp $line;
   print OUT "$line Amino Acid Sequence\n";
   my $dna = '';
   while (defined ($line = <IN>) and $line !~ m/^>/) {
      $line =~ s/\s//g; # remove eventual whitespaces
      $dna .= uc($line);
   }
   # After the data is read, now translate
   my $aminoseq = '';
   my $AA = '';
   for(my $i = 0; $i < length($dna)-2 and $AA ne 'STOP'; $i += 3) {
      my $triplet = substr($dna, $i, 3);
      exists $codon{$triplet} or die "Not nucleotide string: $triplet\n";
      $AA = $codon{$triplet};
      $aminoseq .= $AA if $AA ne 'STOP';
   }
   for (my $i = 0; $i < length($aminoseq); $i += 60) {
       print OUT substr($aminoseq, $i, 60), "\n";
   }
}
close IN;
close OUT;