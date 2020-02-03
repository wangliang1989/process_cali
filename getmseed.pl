#!/usr/bin/env perl
use strict;
use warnings;

foreach my $date (@ARGV) {
    my ($year, $mon, $day) = split "-", $date;
    open (IN, "< stations.txt") or die;
    foreach (<IN>) {
        #NET STA   CHA LOC STANAME                          LAT      LON         ELEV ONDATE     OFFDATE     EDEPTH REALTIME
        #CE  00022 HNE  -- Winterhaven - Sheriff Substati   32.73900 -114.63570    40 1999/12/01 3000/01/01       0
        #https://service.scedc.caltech.edu/fdsnws/dataselect/1/query?net=AZ&sta=BZN&cha=*&loc=BH?&start=2018-08-15T00:00:00&end=2018-08-15T23:59:59&quality=B&nodata=404
        my ($net, $sta) = split m/\s+/;
        my $mseed = "${year}${mon}${day}.${net}.${sta}.mseed";
        my $dataless = "${net}_${sta}.dataless";
        print "scedc -N $net -S $sta -s $date,00:00:00 -e $date,23:59:59 -C BH? -O $mseed\n";# unless (-e $mseed);
        #system "wget http://service.scedc.caltech.edu/ftp/stations/seed/${net}_${sta}.dataless -O $dataless" unless (-e $dataless);
    }
    close(IN);
}

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };