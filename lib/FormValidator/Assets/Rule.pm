package FormValidator::Assets::Rule;

use Moose;
use Moose::Util::TypeConstraints;

use FormValidator::Assets::Types qw(Filter Constraint);

has 'name' => ( is => 'rw', isa => 'Str' );
has 'fields' => (
    is => 'rw',
    isa => 'ArrayRef',
);

has 'filters' => (
    is     => 'rw',
    isa    => 'ArrayRef[Filter]',
    #isa    => 'Filter',
    coerce => 1,
    default => sub {[]},
);

has 'constraints' => (
    is     => 'rw',
    isa    => 'ArrayRef[Constraint]',
    #isa    => 'Constraint',
    coerce => 1,
    default => sub {[]},
);

has 'context' => (
    is => 'ro',
    isa => 'FormValidator::Assets',
    weakref => 1,
);

sub process {
    my $self = shift;

    for my $filter ( @{ $self->filters } ) {
        for my $value (@{$sekf->fields}) {;
        $filter->process ($value);
        }
    }

    #for my $constraint ( @{ $self->constraints } ) {
    #    $constraint->process;
    #}
}

__PACKAGE__->meta->make_immutable;
1;

