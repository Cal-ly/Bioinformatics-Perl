#!/usr/bin/perl -w
use strict;
use FastaParse; #Package name

my $filename = &input_file(@ARGV); #User input subroutine 

# Reads the fasta file

my $fas = new FastaParse($filename); 
while ($fas->MoreEntries) {
	$fas->ReadNextEntry;
	print $fas->Name, "\n";
	print $fas->Comment, "\n";
	print $fas->Seq, "\n";
	print $fas->Length, "\n"; 
}
$fas->Close;
undef $fas;

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