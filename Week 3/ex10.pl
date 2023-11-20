#!/usr/bin/perl

#This program converts celcius and fahrenheit input like '20C' to '76F' and vice versa

print "Type in temperatur with unit, like 20C or 76F: ";
$tmp = <STDIN>;
chomp $tmp;
$unit = chop $tmp;	#chops off last part of input, in this case, the temprature unit
if ($unit eq 'F') {	#If the chopped off unit eq F, then it will convert to celcius
	$conv = (5/9 * ($tmp-32));	#the math behind the conversion
	$new_unit = C;	#defines new unit for later appending
}
elsif ($unit eq 'C') { #If the chopped off unit eq F, then it will convert to celcius
	$conv = ((9/5 * $tmp)+32); #the math behind the conversion
	$new_unit = F;	#defines new unit for later appending
}
else{	#If input doesn't comply, then it will display error
	print "Error, could not understand input: $tmp$unit\n";
}
unless ($conv == '') {
	print "The converted temprature is $conv$new_unit\n";
}
