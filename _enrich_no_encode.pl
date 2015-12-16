use Getopt::Std;
use utf8;
binmode(STDOUT, ":utf8");
binmode(STDIN, ":utf8");

my $usage;
{
$usage = <<"_USAGE_";
_enrich.pl version 1.0

This script enriches lines based on the first tab-delimited column of that line with values from a lexicon file in a new column of the output file.
Optional arguments are currently only outputting the help message.

Usage:  _enrich.pl [optional args] -l <LEXICON> <IN_FILE>

Options and arguments:

-h              print this [h]elp message and quit
-l              [l]exicon file (required)

<IN_FILE>    A text file one category per line, only text up to the first tab is used for lexicon lookup

Copyright 2014, Amir Zeldes

This program is free software. You may copy or redistribute it under
the same terms as Perl itself.
_USAGE_
}


### OPTIONS BEGIN ###
%opts = ();
getopts('hl:',\%opts) or die $usage;

#help
if ($opts{h} || (@ARGV == 0)) {
    print $usage;
    exit;
}
if (!($lexicon = $opts{l})) 
    {$lexicon = "lexicon.txt";}

### OPTIONS END ###


	open(FLH,"<:encoding(UTF-8)","$lexicon");
	@array = <FLH>;
	close(FLH);



        foreach $ar (@array)
        {


                if ($ar =~ /^(.+)\t(.+)\n/)
                {
					$entry = $1;
					$trans = $2;
					$lex{$entry} .= $trans;
					$trans =~ s/^[ \t]+//g;
					$trans =~ s/[ \t]+$//g;
				}
					
		}

open FILE,"<:encoding(UTF-8)",shift or die "could not find input document";

while($ar = <FILE>)	
{
		$ar =  $ar ;
		$ar =~ s/\n//g;
		        if ($ar =~ /^([^\t]+)/)
                {

				if (exists $lex{$1}) {$mykey=$1;}
					elsif (exists $lex{"*" .  substr($1, -4)})  {$mykey="*" .  substr($1, -4);}
					elsif (exists $lex{"*" .  substr($1, -3)}) {$mykey="*" .  substr($1, -3);}
					elsif (exists $lex{substr($1, 0,5) . "*"}) {$mykey=substr($1, 0,5) . "*";}
					elsif (exists $lex{substr($1, 0,4) . "*"}) {$mykey=substr($1, 0,4) . "*";}
					elsif (exists $lex{substr($1, 0,3) . "*"}) {$mykey=substr($1, 0,3) . "*";}
					elsif (exists $lex{substr($1, 0,2) . "*"}) {$mykey=substr($1, 0,2) . "*";} 
					else {$mykey='';}
					if ($mykey ne ''){
					{print $ar . "\t" .  $lex{$mykey} . "\n";}
					}
					else
					{print $ar ."\n";}
				}
				else
				{
					print $ar."\n";
				}
	}
	
