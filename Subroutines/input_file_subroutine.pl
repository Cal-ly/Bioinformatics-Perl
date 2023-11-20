
###############
# Subroutines #
###############

sub inputfile {
	my @ARGV = @_;
	my $file;
	if ($#ARGV < 0) {
		print "Which FASTA file do you want translate: ";
		$file = <STDIN>;
		chomp $file;
	}
	elsif ($#ARGV == 0) {
		$file = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $file
}