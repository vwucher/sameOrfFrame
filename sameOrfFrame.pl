#!/usr/bin/env perl

use Bio::Tools::dpAlign;
use Bio::SeqIO;
use Bio::SimpleAlign;
use Bio::AlignIO;
use Bio::Matrix::IO;
use strict;
use warnings;


my $seqIO1 = Bio::SeqIO->new(-file => $ARGV[0], -format => 'fasta');
my $seqIO2 = Bio::SeqIO->new(-file => $ARGV[1], -format => 'fasta');

my $seq1 = $seqIO1->next_seq();
my $seq2 = $seqIO2->next_seq();


my $factory = new Bio::Tools::dpAlign(-match => 3,
				      -mismatch => -10,
				      -gap => 10,
				      -ext => 10,
				      -alg => Bio::Tools::dpAlign::DPALIGN_LOCAL_MILLER_MYERS);


my $out = $factory->pairwise_alignment($seq1, $seq2);
my $alnout = Bio::AlignIO->new(-format => 'pfam', -fh => \*STDOUT);
# my $alnout = Bio::AlignIO->new(-format => 'pfam', -fh => \*STDOUT);





foreach my $seq ($out->each_seq())
{
    print $seq->id(), "\n", $seq->seq(), "\n";
}




# print $seq1->seq(), "\n";
# print $seq2->seq(), "\n";

# print $out, "\n";

# $alnout->write_aln($out);
