# Pragmas.
use strict;
use warnings;

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček <skim@cpan.org>',
	'EXE_FILES' => [
		'bin/pyx_attr_sort',
	],
	'NAME' => 'PYX::Sort',
	'PREREQ_PM' => {
		'Class::Utils' => 0.01,
		'Error::Pure' => 0.01,
		'PYX::Parser' => 0.01,
	},
	'VERSION_FROM' => 'Sort.pm',
	'test' => {
		'TESTS' => 't/PYX::Sort/*.t',
	},
);
