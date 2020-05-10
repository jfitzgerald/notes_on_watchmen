package NOWUtil;

use strict;
use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';


#  IN: $pages ARRAY REF
# OUT: $character_data
sub gen_characters {
    my ($pages) = shift;
    my $data = {};

    foreach my $pg (@$pages) {
        foreach my $pn (@{$pg->{panels}}) {
            if($pn->{characters}) {
                my @tmp = @{$pn->{characters}};
                foreach my $nm (@{$pn->{characters}}) {
                    if(!$data->{$nm}) {
                        $data->{$nm} = {total=>0, appears_with=>{}};
                    }
                    # character/chapter counter
                    # {"rorschach"}->{"chapter1"}++
                    $data->{$nm}{total}++;
                    # tally the character-character associations
                    map { if($nm ne $_){ $data->{$nm}{appears_with}{$_}++; } } @tmp;
                }
            }
        }
    }


    my $people = JSON::Parse::json_file_to_perl('../data/characters.json');
    foreach my $ch (@{$people->{main_characters}}) {
        # set reverse key lookups by real and hero name
        $ch->{appears_with} = {};
        foreach my $k (qw(hero_name real_name)) {
            my $val = lc $ch->{$k};
            $val =~ s/\.//;
            $val =~ s/\s/_/;
            #$data->{$val} = $ch;
            #print STDERR "looking up $val\n";
            $ch->{panel_total} += $data->{$val}{total};

            while (my ($costar, $num) = each %{$data->{$val}{appears_with}}) {
                $ch->{appears_with}{$costar} += $num;
            }
        }
    }
    return $data;
}

1;
