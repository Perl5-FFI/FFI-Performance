use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
  module_name   => 'FFI::Performance',
  dist_abstract => 'Measure FFI performance',
  dist_author   => 'Graham Ollis <plicease@wdlabs.com>',
  license       => 'perl',
  requires      => {
    'FFI::Raw'    => 0,
    'FFI::Util'   => 0,
    'Inline::C'   => 0.56,
    'File::chdir' => 0,
  },
  configure_requires => {
    'Module::Build' => 0.42,
  },
  build_requires => {
  },
  extra_compiler_flags => '-Ifoo',
  extra_linker_flags => '-Lfoo -lfoostatic',
);

$builder->create_build_script;
