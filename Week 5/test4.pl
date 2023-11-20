#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
chomp $file;
my $flag = 0;
my $seq;
my $seq1;
open (IN, '<', "$file") or die "$!";
while (defined (my $line = <IN>)) {
	chomp $line;
	$flag = 0 if substr($line, 0, 2) eq '//';	
	$seq .= $line if $flag == 1;
	$flag = 1 if substr($line, 0, 2) eq 'SQ';
}
my $length = length($seq);
my $i = 0;
while ($i < $length){	
	if (substr($seq, $i, 1) eq ' '){
		$i++;
	}
	elsif (substr($seq, $i, 1) ne ' '){
		$seq1 .= substr($seq, $i, 1);
		$i++;
	}
}

$length = length($seq1); 

print "$length\n";
print "Amino sequence:\n$seq1\n";



