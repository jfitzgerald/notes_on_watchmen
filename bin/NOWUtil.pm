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
    my $name_map = {};
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

            # set the names
            $name_map->{$val} = $ch->{$k};
            $data->{$val}{name} = $ch->{$k};

            while (my ($costar, $num) = each %{$data->{$val}{appears_with}}) {
                $ch->{appears_with}{$costar} += $num;
            }
        }
    }

    # Clean up the data
    while (my ($char_key, $obj) = each %$data) {
        my @costar_keys = keys %{$obj->{appears_with}};
        foreach my $costar_key (@costar_keys) {
            my $new_key = $name_map->{$costar_key};
            if(!$new_key) {
              delete $obj->{appears_with}{$costar_key};
              next;
            }
            next unless $new_key;
            $obj->{appears_with}{$new_key} = $obj->{appears_with}{$costar_key};
            delete $obj->{appears_with}{$costar_key};
        }
    }
    my @chars = ();
    map { push @chars, $_ if($_->{name} && $_->{total}) } values %$data;
    #my @chars = values %$data;
    return \@chars;
    #return $data;
}

#  IN: { "#FF0000" : 123567 }
# OUT: { labels => [], raw_values  => [], percent_values => [] }
sub gen_panel_colors {
  my ($cnt) = shift;
  my $data = {
      labels => [],
      raw_values => [],
      percent_values => []
  };
  my $total=0;
  map { $total += $_ } values %$cnt;

  foreach my $clr (sort {$cnt->{$b} <=> $cnt->{$a}} keys %$cnt) {
      #print STDERR $cnt{$clr}."/$total\n";
      my $percent = int($cnt->{$clr}/$total * 100);
      next unless $percent > 0;
      push @{$data->{raw_values}}, $cnt->{$clr};
      push @{$data->{percent_values}}, $percent;
      push @{$data->{labels}}, $clr;
  }

  return $data;
}

1;
