#!/usr/bin/perl
use File::Basename;

if(scalar(@ARGV) < 2 ){
    print "Usage: perl get_53_bias_score.plinput_file output_file \n";
    exit(0);
}

my ($input,$output) = @ARGV;
my $q1=0;
my $q4=0;

printf ("\nRunning get_53_bias_score.pl: input_file=%s; output_file=%s \n", $input,$output);

open FILE, $input or die "Can not open $input pileup file";
open WFILE, '>', $output or die "error can not open $output to write";
print "[",scalar(localtime),"] Begin parsing...\n";
while(<FILE>){
    chomp;
    my($tp,$cnt) = split /\s+/;
    if($tp<=24 && $tp>=0 ){
        $q1+=$cnt;
    }elsif($tp>=76 && $tp<=100){
        $q4+=$cnt;
    }#
}
close FILE;
print WFILE $q4/$q1;
print $q4/$q1.”\n”;
close WFILE;
print "[",scalar(localtime),"] Finished\n";
