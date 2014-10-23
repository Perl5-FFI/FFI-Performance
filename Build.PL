use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
  module_name   => 'FFI::Performance',
  dist_abstract => 'Measure FFI performance',
  dist_author   => 'Graham Ollis <plicease@wdlabs.com>',
  license       => 'perl',
  requires      => {
    'FFI::Raw' => 0,
    'FFI::Util' => 0,
  },
  configure_requires => {
    'Module::Build' => 0.42,
  },
  build_requires => {
  },
);

$builder->create_build_script;
