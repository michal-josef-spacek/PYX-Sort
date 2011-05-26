# Modules.
use English qw(-no_match_vars);
use PYX::Sort;
use Test::More 'tests' => 2;

# Test.
my $obj;
eval {
	$obj = PYX::Sort->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

# Test.
eval {
	$obj = PYX::Sort->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");
