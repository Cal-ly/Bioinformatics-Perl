#!/usr/bin/perl

#this program finds the lowest number in a column

$low = undef; #makes $low undefined
$var = <STDIN>;	
chomp $var;
while (defined $var){ #loop runs as long as $var is defined
	chomp $var;
	if (!defined($low)){ #if $low is undefined, then $low will be defined as $var
		$low = $var;
	}
	elsif ($low > $var){ #if $var is less than $low, then $var becomes $low
		$low = $var;
	}
	$var = <STDIN>;
}

print "Lowest number: $low \n"