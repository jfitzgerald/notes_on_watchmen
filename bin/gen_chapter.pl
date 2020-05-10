#!/usr/bin/perl
use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';

use NOWUtil;

#my $json_file = '../data/chapter1.json';
my $json_file = $ARGV[0] or die "Missing input JSON file\n";
my $book = JSON::Parse::json_file_to_perl($json_file);

foreach my $ch (@{$book->{chapters}}) {
    my $data = {};
    $data->{pages} = [];
    while (my ($key, $val) = each (%$ch)) {
        if(!ref $val) {
            $data->{$key} = $val;
        }
    }
    $data->{total_pages} = scalar @{$ch->{pages}};

    my $characters = NOWUtil::gen_characters($ch->{pages});
    $data->{characters} = $characters;

# {
#   "page": 1,
#   "panels": [
#     [ { "color":"yellow", "cols":3 } ],
#     [ { "color":"gray" },{ "color":"yellow" },{ "color":"gray" } ],
#     [ { "color":"yellow" },{ "color":"gray" },{ "color":"yellow" } ]
#   ]
# },
    # chapter cover page is a 2-column grid
    my $cover = { page=>"0", col_layout=>2, panels=> [ [ {color=>"black"}, {color=>"gray"} ] ]};
    push @{ $data->{pages} }, $cover;
    foreach my $pg (@{$ch->{pages}}) {
        my $new_pg = { page => $pg->{page} };
        my $pn_max = $pg->{layout} || 9;
        $new_pg->{col_layout} = $pn_max/3;
        my $cols = int $pn_max / 3;
        my $prev_row;
        foreach my $pn (@{$pg->{panels}}) {
            my $pn_num = $pn->{panel};
            #print STDERR "Panel # $pn_num\n";

            my $new_pn = {"color" => "gray"};
            if($pn->{width}) {$new_pn->{cols} = $pn->{width};}
            if($pn->{height}) {$new_pn->{rows} = $pn->{height};}
            if($pn->{color}) {$new_pn->{color} = $pn->{color};}

            if($new_pn->{cols} == $cols && $new_pn->{rows} > 1) {
                $new_pg->{has_splash} = "1";
            }

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
