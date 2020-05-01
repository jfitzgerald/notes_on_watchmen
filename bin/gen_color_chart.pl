#!/usr/bin/perl
use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';


#my $hist_file = '/Users/justin/Pictures/watchmen/Chapter01/chapter1-hist.txt';
my $hist_file = $ARGV[0] or die "Missing input histogram file\n";
my $fh;
open $fh, "<$hist_file" or die "Could not open $hist_file\n";

#    1854154: ( 51, 51, 51) #333333 grey20
my %cnt=();
my $total=0;
while(my $line = <$fh>) {
    chomp $line;
    my ($num, $rem) = split ':', $line;
    my $hex;
    $hex = $1 if($rem =~ /(#[A-Z0-9]{6})/);
    $cnt{$hex} += $num;
    $total+=$num;
}
close $fh;

my $data = {
    labels => [],
    datasets => [{
        label => "Occurence of Color",
        data => [],
        backgroundColor => [],
        borderWidth => 0
    }]
};
foreach my $clr (sort {$cnt{$b} <=> $cnt{$a}} keys %cnt) {
    print STDERR $cnt{$clr}."/$total\n";
    my $percent = $cnt{$clr}/$total * 100;
    next unless int $percent > 0;
    push @{$data->{datasets}[0]{data}}, $cnt{$clr};
    push @{$data->{datasets}[0]{backgroundColor}}, $clr;
    push @{$data->{datasets}[0]{labels}}, $clr;
}

print Dumper($data);
# data: {
#         labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
#         datasets: [{
#             label: '# of Votes',
#             data: [12, 19, 3, 5, 2, 3],
#             backgroundColor: [
#                 'rgba(255, 99, 132, 0.2)',
#                 'rgba(54, 162, 235, 0.2)',
#                 'rgba(255, 206, 86, 0.2)',
#                 'rgba(75, 192, 192, 0.2)',
#                 'rgba(153, 102, 255, 0.2)',
#                 'rgba(255, 159, 64, 0.2)'
#             ],
#             borderColor: [
#                 'rgba(255, 99, 132, 1)',
#                 'rgba(54, 162, 235, 1)',
#                 'rgba(255, 206, 86, 1)',
#                 'rgba(75, 192, 192, 1)',
#                 'rgba(153, 102, 255, 1)',
#                 'rgba(255, 159, 64, 1)'
#             ],
#             borderWidth: 1
#         }]
#     }


{
    # Update color files
    #open my $fh, '>', $json_file or die $!;
    #print $fh Dumper($colors);
}
