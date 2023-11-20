#!/usr/bin/perl -w
use strict;
use FastaParse; #Package name

my $filename = &input_file(@ARGV); #User input subroutine 

open (OUT, '>', 'revdna.fsa') or die "Could not create file $!\n";

# Reads the fasta file
my $fas = new FastaParse($filename); 
while ($fas->MoreEntries) {
	$fas->ReadNextEntry;
	print OUT $fas->Name, "\n";
	my $comment = $fas->Comment;
	$comment .= ' ReverseComplement';
	print OUT $comment, "\n";
	my $seq = $fas->Seq;
	$seq = &revcomp($seq);
	$seq = &organizer($seq);
	print OUT $seq; #Organizer adds the newline, so no need to do it again
	print OUT $fas->Length, "\n"; 
}
$fas->Close;
undef $fas;
close OUT;

###############
# Subroutines #
###############

sub input_file { #The input subroutine, takes either the @ARGV as input or from the STDIN
	my @ARGV = @_; #sends argument vector to our default array (@_)
	my $file;
	if ($#ARGV < 0) {
		print "Please enter a Fasta file name: ";
		$file = <STDIN>;
		chomp $file;
	}
	elsif ($#ARGV == 0) {
		$file = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $file;
}

sub revcomp {
	my ($seq) = @_;
	$seq = reverse $seq;
	$seq =~ tr/ATGC/TACG/;
	return $seq;
}

sub organizer {
	my ($seq) = @_;
	my $new_seq;
	for (my $i = 0; $i < length($seq); $i += 60) {
		$new_seq .= substr($seq, $i, 60). "\n";
	}
	return $new_seq;
}