lexical taggers for Sahidic Coptic
===========================================================

Includes tagger for language of origin. (Lemmatizer now integrated into the part-of-speech tagger at https://github.com/CopticScriptorium/tagger-part-of-speech)

_enrich.pl script to be used with lexicon file in each subdirectory (e.g., lexicon.txt in the languagetagger subdirectory for the language-of-origin tagging) 

Usage:  _enrich.pl [optional args] <LEXICON> <IN_FILE>

Options and arguments:

-h              print this [h]elp message and quit
-l              [l]exicon file (required). Defaults to lexicon.txt in same directory.

<IN_FILE>    A text file one category per line, only text up to the first tab is used for lexicon lookup

example: _enrich.pl -l language-tagger/lexicon.txt my_file.txt

The language tagger now includes lexical entries provided by the [Database and Dictionary of Greek Loanwords in Coptic (DDGLC)](http://research.uni-leipzig.de/ddglc).  We thank the DDGLC and its director, Dr. Tonio Sebastian Richter, for this collaboration.

Perl script Copyright 2013-16 Amir Zeldes, Caroline T. Schroeder.  The perl program is free software. You may copy or redistribute the script under the same terms as Perl itself.

Additional material copyright 2013-16 Amir Zeldes, Caroline T. Schroeder, Elizabeth Davidson: this is free software distributed under the GNU General Public license v. 3. http://www.gnu.org/licenses/gpl.html. You are welcome to distribute it under the conditions outlined in the license.
