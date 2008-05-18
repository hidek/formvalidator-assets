package FormValidator::Assets;

use Moose;

has 'rules' => (
    is      => 'rw',
    isa     => 'HashRef[FormValidator::Assets::Rule]',
    default => sub { {} },
    triger => sub {
        my $self = shift;
        $self->rules->context($self);
    },
);

has 'results' => (
    is      => 'ro',
    isa     => 'HashRef[FormValidator::Assets::Result]',
    default => sub { {} }
);

sub process {
    my ($self, $q, @rest) = @_;

    #for my $p (keys %$q) {
    #    my $rule = $self->rules->{$p};
    #    my $result = $rule->process($self);
    #    $self->reuslts->{$result->name} =  $result;
    #}
}

sub has_error {
}



=head1 NAME

FormValidator::Assets - Module abstract (<= 44 characters) goes here

=head1 SYNOPSIS

    use FormValidator::Assets;
    
    my $f = FormValidator::Assets->new( assets_dir => $your_dir );
    my $res = $f->process( CGI::Simple->new({ foo => 'bar' } );
    
    if ($res->has_error) {
        # die $res->message('foo'); # not implemented yet
    }
    else {
        print $res->valid('foo');
    }

=head1 DESCRIPTION

Stub documentation for this module was created by ExtUtils::ModuleMaker.
It looks like the author of the extension was negligent enough
to leave the stub unedited.

Blah blah blah.

=head1 AUTHOR

Daisuke Murase <typester@cpan.org>

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut

1;
