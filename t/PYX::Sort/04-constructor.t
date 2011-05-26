# Modules.
use English qw(-no_match_vars);
use PYX::Sort;
use Test::More 'tests' => 2;

my $obj;
eval {
	$obj = PYX::Sort->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

eval {
	$obj = PYX::Sort->new(
		'something' => 'value',
	);
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");
