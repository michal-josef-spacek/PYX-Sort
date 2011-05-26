# Modules.
use English qw(-no_match_vars);
use PYX::Sort;
use Test::More 'tests' => 2;

print "Testing: new('') bad constructor.\n";
my $obj;
eval {
	$obj = PYX::Sort->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = PYX::Sort->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");
