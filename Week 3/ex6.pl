#!/usr/bin/perl

=pod
that counts the number of positive and negative numbers in a column. 
Also count the zeroes in the column, if there are any. Display the result.
=cut

$line eq 0;
$line_pos eq 0;
$line_neg eq 0;
$line_zero eq 0;
$var = <STDIN>;	#the input
chomp $var;
while (defined $var){	#as long as $var is defined, the loop runs
	chomp $var;
	if ($var > 0){	#if the input is positiv, then there wil be added 1 
		$line_pos++; #to the positiv count and one to the overall count
		$line++;
	}
	elsif ($var < 0){ #if the input is negativ, then there wil be added 1 
		$line_neg++; #to the negativ count and one to the overall count
		$line++;
	}
	elsif ($var == 0){ #if the input is zero, then there wil be added 1 
		unless ($var eq ''){ #to the zero count and one to the overall count
			$line_zero++; #Execpt if the input is an empty line
			$line++;
		} 
	}
	$var = <STDIN>;	#new input
}

print "Lines positiv: $line_pos\n";
print "Lines negativ: $line_neg\n";
print "Lines zero: $line_zero\n";
print "Lines total: $line\n";