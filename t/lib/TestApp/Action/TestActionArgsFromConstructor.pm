package TestApp::Action::TestActionArgsFromConstructor;

use Moose;
use namespace::clean -except => [ 'meta' ];

extends 'Catalyst::Action';

has [qw/extra_arg another_extra_arg/] => ( is => 'ro' );

after execute => sub {
    my ($self, $controller, $ctx) = @_;
    $ctx->response->header('X-TestExtraArgsAction' => join q{,} => $self->extra_arg, $self->another_extra_arg);
};

__PACKAGE__->meta->make_immutable;

1;

