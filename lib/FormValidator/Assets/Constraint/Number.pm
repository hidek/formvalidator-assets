package FormValidator::Assets::Constraint::Number;

use Moose;

with 'FormValidator::Assets::Constraint';

sub process {
    my ($self, $value) = @_;
}

__PACKAGE__->meta->make_immutable;
1;

