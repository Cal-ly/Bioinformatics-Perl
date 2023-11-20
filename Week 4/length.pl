#!/usr/bin/perl

$line = 0;
$file = <STDIN>;
while (defined $file){
	chomp $file;
	$line++;
	$file = <STDIN>;
}


=pod
$file = <STDIN>;
chomp $file;
$length = length ($file);	
print "$length\n";
=cut

$file = <STDIN>;
$line = 0;
chomp $file;
chomp $line;
=pod
while (defined ($file)){
	$file = <STDIN>;
	chomp $file;
	$line += length ($file);
}
=cut
for (defined $file; defined != $file; $line++){
	$file = <STDIN>;
	chomp $file;
}
print "$line\n";
