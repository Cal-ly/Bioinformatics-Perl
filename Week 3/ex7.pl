#!/usr/bin/perl

#this program finds the largest number in a column

$gre = undef; #makes $gre undefined
$var = <STDIN>;	
chomp $var;
while (defined $var){ #loop runs as long as $var is defined
	chomp $var;
	if (!defined($gre)){ #if gre is undefined, then $gre will be defined as $var
		$gre = $var;
	}
	elsif ($gre < $var){ #if $var is greater than $gre, then $var becomes $gre
		$gre = $var;
	}
	$var = <STDIN>;
}

print "Largest number: $gre \n"