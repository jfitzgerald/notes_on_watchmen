#!/usr/bin/perl
use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';

#my $json_ads = '/Users/justin/Code/myrtspostcards/data/cards.json';
#my $json = $ARGV[0] or die "Missing input JSON file\n";
my $book = JSON::Parse::json_file_to_perl('/Users/justin/Code/watchmen/chapter1.json');

my $data = {};
foreach my $ch (@{$book->{chapters}}) {
    while (my ($key, $val) = each (%$ch)) {
        if(ref $val eq  'SCALAR') {
            $data->{$key} = $val;
        }
    }

    foreach my $pg (@{$ch->{pages}}) {
        foreach my $pn (@{$pg->{panels}}) {
            if($pn->{characters}) {
                foreach my $nm (@{$pn->{characters}}) {
                    # character/chapter counter
                    # {"rorschach"}->{"chapter1"}++
                    $data->{$nm}++;
                }
            }
        }
    }
}

my $people = JSON::Parse::json_file_to_perl('/Users/justin/Code/watchmen/characters.json');
foreach my $ch (@{$people->{main_characters}}) {
    # set reverse key lookups by real and hero name
    foreach my $k (qw(hero_name real_name)) {
        my $val = lc $ch->{$k};
        $val =~ s/\.//;
        $val =~ s/\s/_/;
        #$data->{$val} = $ch;
print STDERR "looking up $val\n";
        $ch->{panel_total} += $data->{$val};
    }
}

print STDERR Dumper($people);
print STDERR Dumper($data);

{
    # Create character data files
    #my $new_file = $base_path . $o->{slug} . ".md";
    #print STDERR "$new_file\n";
    #open my $fh, '>', $new_file or die $!;
    #print $fh Dumper($o);
}
