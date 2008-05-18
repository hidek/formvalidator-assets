package FormValidator::Assets::Types;

use UNIVERSAL::require;
use Data::Dumper;
use Moose;
use Moose::Util::TypeConstraints;

subtype Filter => as 'Object' =>
    where { $_->does('FormValidator::Assets::Filter') };

subtype Constraint => as 'Object' =>
    where { $_->does('FormValidator::Assets::Constraint') };

subtype 'ArrayRef[Filter]' => as 'ArrayRef';
subtype 'ArrayRef[Constraint]' => as 'ArrayRef';

coerce 'ArrayRef[Filter]' 
    => from "ArrayRef",
    => via {
    my $t = Moose::Util::TypeConstraints::find_type_constraint("Filter");
    [ map { $t->coerce($_) } @$_ ];
    };
coerce 'ArrayRef[Constraint]' 
    => from "ArrayRef",
    => via {
    my $t = Moose::Util::TypeConstraints::find_type_constraint("Constraint");
    [ map { $t->coerce($_) } @$_ ];
    };

coerce Filter => from 'HashRef' => via {
    my $module = $_->{module};
    my $args   = $_->{args};
    $module = "FormValidator::Assets::Filter::$module";
    $module->require or confess "$module is not found";
    return $module->new(%$args);
};

coerce Constraint => from 'HashRef' => via {
    my $module = $_->{module};
    my $args   = $_->{args};
    $module = "FormValidator::Assets::Constraint::$module";
    $module->require or confess "$module is not found";
    return $module->new(%$args);
};

1;

