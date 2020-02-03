#!/usr/bin/env perl
use strict;
use warnings;
$ENV{SAC_DISPLAY_COPYRIGHT} = 0;

foreach my $dir (@ARGV) {
    chdir $dir or die "cannot open $dir";
    open(SAC, "| sac") or die "Error in opening sac\n";
    print SAC "wild echo off\n";
    print SAC "r *.[enz]\n";
    print SAC "bp c 1 9 n 4 p 1\n";
    print SAC "w over\n";
    print SAC "q\n";
    close(SAC);
    chdir ".." or die;
}

