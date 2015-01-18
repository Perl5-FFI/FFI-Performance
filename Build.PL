use strict;
use warnings;
use lib 'inc';
use My::ModuleBuild;

my $builder = My::ModuleBuild->new(
  module_name   => 'FFI::Performance',
  dist_abstract => 'Measure FFI performance',
  dist_author   => 'Graham Ollis <plicease@wdlabs.com>',
  license       => 'perl',
  requires      => {
    'FFI::Raw'                 => 0,
    'FFI::Util'                => 0,
    'FFI::Platypus'            => 0.09,
    'FFI::Sweet'               => 0,
    'Inline::C'                => 0.56,
    'File::chdir'              => 0,
    'Archive::Libarchive::FFI' => 0,
  },
  configure_requires => {
    'Module::Build' => 0.42,
    'autodie'       => 0,
    'File::chdir'   => 0,
  },
  build_requires => {
  },
  extra_compiler_flags => '-Ifoo',
  extra_linker_flags => '-Lfoo -lfoostatic',
);

$builder->add_to_cleanup(
  '_Inline',
  'foo/*.o',
  'foo/*.obj',
  'foo/*.so',
  'foo/*.dll',
  'foo/*.bundle',
  'foo/*.a',
);

$builder->create_build_script;
