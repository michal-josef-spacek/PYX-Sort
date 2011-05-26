# Modules.
use File::Object;
use PYX::Sort;
use Test::More 'tests' => 2;

# Directories.
my $data_dir = File::Object->new->up->dir('data');

# Include helpers.
do File::Object->new->up->file('get_stdout.inc')->s;

print "Testing: parse() method.\n";
my $obj = PYX::Sort->new;
my $ret = get_stdout($obj, $data_dir->file('example6.pyx')->s);
my $right_ret = <<"END";
(tag
Aattr1="value"
Aattr2="value"
Aattr3="value"
-text
)tag
END
is($ret, $right_ret);

$ret = get_stdout($obj, $data_dir->file('example7.pyx')->s);
is($ret, $right_ret);
