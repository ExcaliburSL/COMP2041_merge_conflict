#!/usr/bin/perl -w

$max_lines = 10;

# See if the number of lines are specified
if (@ARGV >= 0 && $ARGV[0] =~ /-([0-9]+)/) {
    $max_lines = $1;
    pop @ARGV;
}

# If there are no files to print, just print standard input
if (@ARGV == 0) {
    @lines = <INPUT>;

# otherwise tail all given files,
# interposing with ==> filename <== if more than 1 file
} else {
    foreach $file (@ARGV) {
    }
}
