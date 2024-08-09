package OpenCC;

use strict;
use warnings;

require Exporter;
require DynaLoader;

our @ISA = qw(Exporter DynaLoader);

bootstrap OpenCC;

sub new {
    my ( $class, $config ) = @_;
    my $self->{_client} = opencc_open($config);

    # TODO how to handle error?

    return bless $self, $class;
}

sub convert {
    my ( $self, $input ) = @_;
    my $result = opencc_convert_utf8( $self->{_client}, $input );

    return $result;
}

sub is_valid {
    my ($self) = @_;
    return opencc_is_valid( $self->{_client} );
}

sub DESTROY {
    my ($self) = @_;
    opencc_close( $self->{_client} ) if $self->is_valid();
}

1;
