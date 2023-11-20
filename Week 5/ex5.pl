#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
chomp $file;
my $aa_num;
open (IN, '<', "$file") or die "$!\n";
while (defined (my $line = <IN>)){
	if(substr($line, 0, 2) eq 'SQ'){
		my $i = 2;
		my $header;
		while (substr($line, $i, 3) ne 'AA;'){
			if (substr($line, $i, 1) eq ' '){
				$i++;
			}
			elsif (substr($line, $i, 1) ne ' '){
				$header .= substr($line, $i, 1);
				$i++;
			}
		}
		my $length = length($header);
		$length -= 8;
		$aa_num = substr($header, 8, $length);
	}
	


}
close IN;
print "$aa_num\n";

