package My::ModuleBuild;

use strict;
use warnings;
use My::LibFoo;
use base qw( Module::Build );

sub new
{
  my($class, %args) = @_;
  
  my $self = $class->SUPER::new(%args);
  
  $self->config_data(libfoo => 0);
  
  $self;
}

sub ACTION_build
{
  my($self) = @_;
  $self->depends_on('libfoo') unless $self->config_data('libfoo');
  $self->SUPER::ACTION_build(@_);
}

sub ACTION_libfoo
{
  my($self) = @_;
  My::LibFoo->build_libfoo($self);
  $self->config_data(libfoo => 1);
}

sub ACTION_clean
{
  my($self) = @_;
  $self->config_data(libfoo => 0);
  $self->SUPER::ACTION_clean;  
}

1;
