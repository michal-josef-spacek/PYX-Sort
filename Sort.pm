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

# Global variables.
our $TAG;

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
		'output_handler' => $self->{'output_handler'},
		'attribute' => \&_attribute,
		'start_tag' => \&_tag,
		'end_tag' => \&_tag,
		'comment' => \&_tag,
		'instruction' => \&_tag,
		'data' => \&_tag,
	);

	# Tag values.
	$TAG = {};

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
	$TAG->{$att} = $attval;
	return;
}

# Process tag.
sub _tag {
	my $pyx_parser_obj = shift;
	my $out = $pyx_parser_obj->{'output_handler'};
	_flush($pyx_parser_obj);
	print {$out} $pyx_parser_obj->{'line'}, "\n";
	return;
}

# Flush attributes.
sub _flush {
	my $pyx_parser_obj = shift;
	my $out = $pyx_parser_obj->{'output_handler'};
	if (scalar %{$TAG}) {
		foreach my $key (sort keys %{$TAG}) {
			print {$out} 'A'.$key.'="'.$TAG->{$key}.'"'."\n";
		}
		$TAG = {};
	}
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

=item B<new(%parameters)>

 Constructor.

=over 8

=item * B<output_handler>

TODO

=back

=item B<parse()>

TODO

=item B<parse_file()>

TODO

=item B<parse_handler()>

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

L<Class::Utils(3pm)>,
L<Error::Pure(3pm)>,
L<PYX::Parser(3pm)>.

=head1 SEE ALSO

TODO

=head1 AUTHOR

Michal Špaček L<skim@cpan.org>.

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
