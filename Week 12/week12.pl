#!/usr/bin/perl - w
use strict;

my $st = 'ABCDEFG';

my $pos = index ($st, 'CD');

print $pos, "\n";

_______

my $st = 'ABCDEFGCD';

my $pos = index ($st, 'CD', 3); #Starts at position 3

print $pos, "\n";

_______

my $st = 'ABC DE FG CD';

print "Present\n" if -1 != index ($st, ' ABC ');

my $pos = rindex ($st, 'CD'); #rindex seaches backwards

print $pos, "\n";

_______

if (-1 != rindex ($line, 'SOMETHING', 0)) {	}
	#The fastest way to do it
OR

if (substr($line, 0, 9) eq 'SOMETHING') {	}

OR

if ($line =~ m/SOMETHING/)

_______










