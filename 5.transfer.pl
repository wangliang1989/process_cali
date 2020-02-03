#!/usr/bin/env perl
use strict;
use warnings;
$ENV{SAC_DISPLAY_COPYRIGHT} = 0;

@ARGV == 1 or die "Usage: perl $0 dirname\n";
my ($dir) = @ARGV;

chdir $dir;

open(SAC, "| sac") or die "Error in opening sac\n";
print SAC "wild echo off\n";
print SAC "r *SAC\n";
print SAC "rglitches; rmean; rtrend; taper \n";
print SAC "trans from evalresp to vel freq 0.01 0.02 15 19\n";
print SAC "w over\n";
print SAC "q\n";
close(SAC);
unlink glob "RESP.*";
