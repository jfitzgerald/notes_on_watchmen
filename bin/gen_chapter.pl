#!/usr/bin/perl
use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';

#my $json_ads = '/Users/justin/Code/myrtspostcards/data/cards.json';
my $json = $ARGV[0] or die "Missing input JSON file\n";
my $book = JSON::Parse::json_file_to_perl($json);

foreach my $ch (@{$book->{chapters}}) {
    my $data = {};
    $data->{pages} = [];
    while (my ($key, $val) = each (%$ch)) {
        if(ref $val eq 'SCALAR') {
            $data->{$key} = $val;
        }
    }

# {
#   "page": 1,
#   "panels": [
#     [ { "color":"yellow", "cols":3 } ],
#     [ { "color":"gray" },{ "color":"yellow" },{ "color":"gray" } ],
#     [ { "color":"yellow" },{ "color":"gray" },{ "color":"yellow" } ]
#   ]
# },
    foreach my $pg (@{$ch->{pages}}) {
        my $new_pg = { page => $pg->{page} };
        my $pn_max = $pg->{layout} || 9;
        $new_pg->{layout} = $pn_max;
        my $cols = int $pn_max / 3;
        my $prev_row;
        foreach my $pn (@{$pg->{panels}}) {
            my $pn_num = $pn->{panel};
            #print STDERR "Panel # $pn_num\n";

            my $new_pn = {"color" => "gray"};
            if($pn->{width}) {$new_pn->{cols} = $pn->{width};}
            if($pn->{height}) {$new_pn->{rows} = $pn->{height};}
            if($pn->{color}) {$new_pn->{color} = $pn->{color};}

            my $p_index = $pn_num - 1;
            my $row = int $p_index / $cols;
            #if(!defined $new_pg->{panels}[$row]) {
            if($row != $prev_row) {
                # start a new row
                push @{ $new_pg->{panels} }, [];
                $prev_row = $row;
            }
            push @{ $new_pg->{panels}[$row] }, $new_pn;
        }
        push @{ $data->{pages} }, $new_pg;
    }
    print Dumper($data);
}

{
    # Create character data files
    #my $new_file = $base_path . $o->{slug} . ".md";
    #print STDERR "$new_file\n";
    #open my $fh, '>', $new_file or die $!;
    #print $fh Dumper($o);
}
