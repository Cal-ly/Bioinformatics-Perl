#!/usr/bin/perl -w
use strict;

#Opens the file dna-array.dat, extracts data from a choosen accession number, organizes it and displays the data in two tab separated columns, first from cancer patients and the
#other from the control group. The subroutine 'filecreator' printes the data to the file 'dna-array-extract.dat' if the user chooses so. It can be disabled by adding a hastag in
#front of the subroutine. 

my $inputacc = &inputacc(@ARGV); #runs &inputacc 
my @acc;
my @colclass;
open(IN, '<', 'dna-array.dat') or die "Could not read file $!\n";
while (defined (my $line = <IN>)) {
	chomp $line;
	my @split = split ("\t", $line); #splits $line on tab
	if ($split[1] eq $inputacc) { 	#if there is a match between our input and the split 
		@acc = @split;				#it will be put into @acc

	}
	elsif ($split[0] eq 'COL_CLASSES') { #takes out the column classes into a seperate array
		@colclass = @split;
	}
	@split = (); #empties @split for another run in the loop
}
close IN;

die "Accession number $inputacc not found\n" if scalar(@acc) == 0; #if accession number not found, proces ends

shift @colclass; #Shiftes the first position of colclasses which is "COL_CLASSES"

my @cancer;
my @control;
while (scalar(@colclass) > 0) { #As long as we have a definer for which group (either control or cancer) the loop will run
	my $def = shift @colclass; #takes off either a 0 or a 1 
	if ($def eq '0') {
		push(@cancer, splice (@acc, 3, 1)); #if zero, then it sends the listitem from @acc to @cancer
	}
	elsif ($def eq '1') {
		push(@control, splice (@acc, 3, 1)); #if one, then it sends the listitem from @acc to @control
	}
}

my @new = &organizer;
print @new;
&filecreator(@new);

###############
# Subroutines #
###############

sub inputacc { #The input subroutine, takes either the @ARGV as input or from the STDIN
	my @ARGV = @_; #sends argument vector to our default array (@_)
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

sub organizer { #this organizes the @cancer and @control into one tab seperated list. this works only because it takes off listitems of the array
	while (scalar(@control) > 0 and scalar (@cancer) > 0) { #while both are defined this loop will run
		my $tmp_cancer = splice(@cancer, 0, 1);
		my $tmp_control = splice (@control, 0, 1);
		push(@new, $tmp_cancer, "\t", $tmp_control, "\n");
		$tmp_cancer = '';
		$tmp_control = '';
	}
	while (scalar (@cancer) > 0) { #Ensures rest of @cancer is sent to the @new array
		my $tmp_cancer = splice(@cancer, 0, 1);
		push(@new, $tmp_cancer, "\t\n");
		$tmp_cancer = '';
	}
	while (scalar(@control) > 0) { #the cancer list will always be the longest due to the column class, but for the purpose of being sure 
		my $tmp_control = splice (@control, 0, 1); #I added this to the program
		push(@new, "\t", $tmp_control, "\n");
		$tmp_control = '';
	}
	return @new;
}

sub filecreator { #the file creator, can be diabeled, just put in here for the fun of it
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