
use Getopt::Long;

my %cmdLineArgs = ();

GetOptions(\%cmdLineArgs,
           qw(dir|d=s
              file|f=s
              commit|c
              ));

print $cmdLineArgs{'dir'} . "\n";
print $cmdLineArgs{'file'} . "\n";
print $cmdLineArgs{'commit'} . "\n";
