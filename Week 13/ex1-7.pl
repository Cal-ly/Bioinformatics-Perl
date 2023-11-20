#!/usr/bin/perl -w
use strict;

__EX1__

perl -pe 'tr/ATCG/TAGC/ if $_ !~ m/^>/' dna7.fsa

__EX2__

#file studied

__EX3__

perl -ane 'print $_ if $F[0] =~ m/^P00520/' proteins.netphos

__EX4__

perl -ne 'print if 1 .. 250' proteins.netphos

__EX5__

perl -ne 'BEGIN{ $/=">"; } if(/^\s*(\S+)/){ open(F,">$1.fsa")||warn"$1 write failed:$!\n";chomp;print F ">", $_ }' fastafile
	# Split a multi-sequence FASTA file into individual files

perl -ne 'BEGIN{ $count = 1; } if($_=~m/^>/){$_=">$count";$count++}' dna7.fsa

_____

#Peters solutions


1. perl -ne 'tr/ATCG/TAGC/ unless /^>/; print;' dna7.fsa
2. N/A
3. perl -ne 'print if /^P00520/' proteins.netphos
4. perl -ne 'print if 1 .. 250' proteins.netphos
5. perl -pe 'BEGIN { $count = 1; } if (s/^>\S+/>$count/) { $count++; }' dna7.fsa
6. perl -ane 'print "$F[0]\t$F[-2]\n"' proteins.netphos
7. perl -ane 'if (/^\S+/) { $ser++; if ($F[11] eq "*S*") { $phos++; }} END { print "$ser serines, $phos predicted phosphorylations.\n";}'
