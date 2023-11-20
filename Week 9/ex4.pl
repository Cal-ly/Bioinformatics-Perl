#!/usr/bin/perl -w
use strict;

#Make a subroutine that (only) removes duplicates from a list and returns the clean list. Use it to improve 6.3.



my $file = &inputfile(@ARGV); #Runs the subroutine that gets input from user
open(IN, '<', $file) or die "Could not read file\n";
my @tab = <IN>; #Sends in to the @tab array
close IN;
my @cleantab = &cleaner(@tab); #This subroutines cleans the file @tab
open (OUT, '>', 'sorted.acc') or die "Could not create file $!\n"; #Creates and Sends 
print OUT @cleantab;											#the clean array to "sorted.acc"
close OUT; 


###############
# Subroutines #
###############

sub cleaner {
	my @tab = @_;
	my @cleantab;
	my $previous = '';
	@tab = sort @tab; #sorts tab
	while (scalar @tab > 0) { #runs as long as there is items in the list
		my $next = shift(@tab);
		chomp $next;
		if ($previous ne $next) {
			push(@cleantab, "$next\n");
			$previous = $next;
		}
	} #Takes a list-item, puts it into a variable, if it doesn't match, it will be sent to a new array 
	return @cleantab;
}

sub inputfile { #Standard subroutine for user input 
	my @ARGV = @_;
	my $file;
	if ($#ARGV < 0) {
		print "Which accession file do you want clean: ";
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