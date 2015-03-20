package PYX::Sort;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use PYX::Parser;

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Output handler.
	$self->{'output_handler'} = \*STDOUT;

	# Process params.
	set_params($self, @params);

	# PYX::Parser object.
	$self->{'pyx_parser'} = PYX::Parser->new(
		'callbacks' => {
			'attribute' => \&_attribute,
			'start_element' => \&_tag,
			'end_element' => \&_tag,
			'comment' => \&_tag,
			'instruction' => \&_tag,
			'data' => \&_tag,
		},
		'non_parser_options' => {
			'tag' => {},
		},
		'output_handler' => $self->{'output_handler'},
	);

	# Object.
	return $self;
}

# Parse pyx text or array of pyx text.
sub parse {
	my ($self, $pyx, $out) = @_;
	$self->{'pyx_parser'}->parse($pyx, $out);
	return;
}

# Parse file with pyx text.
sub parse_file {
	my ($self, $file) = @_;
	$self->{'pyx_parser'}->parse_file($file);
	return;
}

# Parse from handler.
sub parse_handler {
	my ($self, $input_file_handler, $out) = @_;
	$self->{'pyx_parser'}->parse_handler($input_file_handler, $out);
	return;
}

# Process attribute.
sub _attribute {
	my ($pyx_parser_obj, $att, $attval) = @_;
	$pyx_parser_obj->{'non_parser_options'}->{'tag'}->{$att} = $attval;
	return;
}

# Process tag.
sub _tag {
	my $pyx_parser_obj = shift;
	my $out = $pyx_parser_obj->{'output_handler'};
	_flush($pyx_parser_obj);
	print {$out} $pyx_parser_obj->line, "\n";
	return;
}

# Flush attributes.
sub _flush {
	my $pyx_parser_obj = shift;
	my $out = $pyx_parser_obj->{'output_handler'};
	foreach my $key (sort keys %{$pyx_parser_obj->{'non_parser_options'}
		->{'tag'}}) {

		print {$out} 'A'.$key.'="'.$pyx_parser_obj
			->{'non_parser_options'}->{'tag'}->{$key}.'"'."\n";
	}
	$pyx_parser_obj->{'non_parser_options'}->{'tag'} = {};
	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

PYX::Sort - TODO

=head1 SYNOPSIS

TODO

=head1 METHODS

=over 8

=item C<new(%parameters)>

 Constructor.

=over 8

=item * C<output_handler>

TODO

=back

=item C<parse()>

TODO

=item C<parse_file()>

TODO

=item C<parse_handler()>

TODO

=back

=head1 ERRORS

 Mine:
   TODO

 From Class::Utils::set_params():
   Unknown parameter '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use PYX::Sort;

 # PYX::Sort object.
 my $pyx = PYX::Sort->new(
         TODO
 );

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>,
L<PYX::Parser>.

=head1 SEE ALSO

TODO

=head1 REPOSITORY

L<https://github.com/tupinek/PYX-Sort>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2011-2015 Michal Špaček
 BSD 2-Clause License

=head1 VERSION

0.01

=cut
