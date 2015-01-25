# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'TODO';
author 'Michal Spacek <skim@cpan.org>';
install_script 'bin/pyx_attr_sort';
license 'bsd';
name 'PYX-Sort';
readme_from 'Sort.pm';
requires 'Class::Utils' => 0.05;
requires 'Error::Pure' => 0.15;
requires 'PYX::Parser' => 0.01;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=PYX-Sort';
resources 'homepage' => 'https://github.com/tupinek/PYX-Sort';
resources 'repository' => 'git://github.com/tupinek/PYX-Sort';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.07;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Output' => '1.02';
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
