#!/usr/bin/env perl
use strict;
use warnings;

foreach my $dir (@ARGV) {
    mkdir $dir;
    system "cp seed/$dir*.seed $dir";
    system "cp mseed/$dir*.mseed $dir";
    system "perl 1.rdseed.pl $dir";
    system "perl 4.synchronize.pl $dir";
    system "perl 5.transfer.pl $dir";
    system "perl 7.resample.pl $dir 0.05";
    system "perl 8.rename.pl $dir";
    system "perl 9.bandpass.pl $dir";
    unlink glob "$dir/*.seed";
    unlink glob "$dir/*.mseed";
}

