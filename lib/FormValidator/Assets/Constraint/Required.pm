package FormValidator::Assets::Constraint::Required;

use Moose;

with 'FormValidator::Assets::Constraint';

sub process {
    my ($self, $value) = @_;

    return defined $value;
}

__PACKAGE__->meta->make_immutable;
1;

