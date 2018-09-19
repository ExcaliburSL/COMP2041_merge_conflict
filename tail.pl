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
    $first = 0;
    $first = @lines - $max_lines unless @lines < $max_lines;
    print @lines[$first..$#lines];

# otherwise tail all given files,
# interposing with ==> filename <== if more than 1 file
} else {
    $show_file_names = @ARGV > 1;
    foreach $file (@ARGV) {
        open my $f, '<', $file or die "$0: can't open $file\n";
        print "==> $file <==\n" unless $show_file_names;
        @lines = <$f>;
        $first = 0;
        $first = @lines - $max_lines unless @lines < $max_lines;
        print @lines[$first..$#lines];
        close $f;
    }
}
print "editing file\n";
