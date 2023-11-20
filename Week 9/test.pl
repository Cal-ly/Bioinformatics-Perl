#!/usr/bin/perl -w
use strict;

my $inputacc = &inputacc(@ARGV);
my @acc;
my @colclass;
open(IN, '<', 'dna-array.dat') or die "Could not read file $!\n";
while (defined (my $line = <IN>)) {
	chomp $line;
	my @split = split ("\t", $line);
	if ($split[1] eq $inputacc) {
		@acc = @split;

	}
	elsif ($split[0] eq 'COL_CLASSES') {
		@colclass = @split;
	}
	@split = ();
}
close IN;

die "Accession number $inputacc not found\n" if scalar(@acc) == 0;

shift @colclass;

my @cancer;
my @control;
while (scalar(@colclass) > 0) {
	my $def = shift @colclass;
	if ($def eq '0') {
		push(@cancer, splice (@acc, 3, 1));
	}
	elsif ($def eq '1') {
		push(@control, splice (@acc, 3, 1));
	}
}

my @new = &organizer;
print @new;
&filecreator(@new);

###############
# Subroutines #
###############

sub inputacc {
	my @ARGV = @_;
	my $acc;
	if ($#ARGV < 0) {
		print "Which accession number do you want extract data from: ";
		$acc = <STDIN>;
		chomp $acc;
	}
	elsif ($#ARGV == 0) {
		$acc = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $acc;
}

sub organizer {
	while (scalar(@control) > 0 and scalar (@cancer) > 0) {
		my $tmp_cancer = splice(@cancer, 0, 1);
		my $tmp_control = splice (@control, 0, 1);
		push(@new, $tmp_cancer, "\t", $tmp_control, "\n");
		$tmp_cancer = '';
		$tmp_control = '';
	}
	while (scalar (@cancer) > 0) {
		my $tmp_cancer = splice(@cancer, 0, 1);
		push(@new, $tmp_cancer, "\t\n");
		$tmp_cancer = '';
	}
	while (scalar(@control) > 0) {
		my $tmp_control = splice (@control, 0, 1);
		push(@new, "\t", $tmp_control, "\n");
		$tmp_control = '';
	}
	return @new;
}

sub filecreator {
	my @new = @_;
	print "Do you want to print data to file? (y/n): ";
	my $answer = <STDIN>;
	chomp $answer;
	if ($answer eq 'y') {
		print "printet to file 'dna-array-extract.dat'\n";
	}
	else {
		die "Goodbye\n";
	}
	open (OUT, '>', 'dna-array-extract.dat') or die "Could not create 'dna-array-extract.dat'\n";
	print OUT @new;
	close OUT;
}