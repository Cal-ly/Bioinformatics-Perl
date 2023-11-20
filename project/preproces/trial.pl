#!/usr/bin/perl -w
use strict;

my @array = '';
open (IN, '<', 'gene_info') or die "Couldn't open file $!";
while (defined (my $line = <IN>)) {
	if ($line =~ m/^9606\s+\d+/g) {
		push (@array, $line);
	}	
}
close IN;

#print $array[1];

open (OUT, '>', 'gene2') or die "$!";
print OUT @array;
close OUT;

=pod
	if ($line =~ m/^\d+\s+\d+/g) {
		
	}
=cut
=pod
#!/usr/bin/perl -w
use strict;

open (IN, '<', "gene_info2") or die "Couldn't open file $!";
open (OUT, '>', "gene") or die "$!";
while (defined (my $line = <IN>)) {
	if ($line =~ m/^[9606]\s+\d+/g) {
		print OUT $line;
	}
}
=cut
