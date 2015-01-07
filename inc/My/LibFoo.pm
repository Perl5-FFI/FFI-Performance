package My::LibFoo;

use strict;
use warnings;
use autodie qw( system );
use File::Spec;
use ExtUtils::CBuilder;
use FindBin ();
use Alien::FFI;
use File::Copy qw( move );
use Config;
use Text::ParseWords qw( shellwords );
use File::chdir;

my $root = $FindBin::Bin;

sub build_libfoo
{
  my $mb = shift;
  
  my $b = ExtUtils::CBuilder->new;
  
  my @obj = map {
    $b->compile(
      source => $_,
      include_dirs => [
        File::Spec->catdir($root, 'include'),
      ],
      extra_compiler_flags => Alien::FFI->cflags,
    );
  } do {
    my $dh;
    opendir $dh, 'foo';
    my @list = map { File::Spec->catfile($root, 'foo', $_) } grep /\.c$/, readdir $dh;
    closedir $dh;
    @list;
  };
  
  if($^O ne 'MSWin32')
  {
    my $dll = $b->link(
      lib_file => $b->lib_file(File::Spec->catfile($root, 'foo', 'libfoo.o')),
      objects  => \@obj,
      extra_linker_flags => Alien::FFI->libs,
    );
    
    if($^O eq 'cygwin')
    {
      my $old = $dll;
      my $new = $dll;
      $new =~ s{libfoo.dll$}{cygfoo-1.dll};
      move($old => $new) || die "unable to copy $old => $new $!";
    }
  }
  else
  {
    # On windows we can't depend on MM::CBuilder to make the .dll file because it creates dlls
    # that export only one symbol (which is used for bootstrapping XS modules).
    my $dll = File::Spec->catfile($FindBin::Bin, 'foo', 'libfoo.dll');
    $dll =~ s{\\}{/}g;
    my @cmd;
    my $cc = $Config{cc};
    if($cc !~ /cl(\.exe)?$/)
    {
      my $lddlflags = $Config{lddlflags};
      $lddlflags =~ s{\\}{/}g;
      @cmd = ($cc, shellwords($lddlflags), -o => $dll, "-Wl,--export-all-symbols", @obj);
    }
    else
    {
      @cmd = ($cc, @obj, '/link', '/dll', '/out:' . $dll);
    }
    run(@cmd);
  }
  
  local $CWD = 'foo';

  if($^O ne 'MSWin32')
  {
    run(qw( ar -cvq libfoo.a foo.o       ));
    run(qw( ranlib libfoo.a              ));
    run(qw( rm -f libfoostatic.a         ));
    run(qw( cp libfoo.a libfoostatic.a   ));
  }
  else
  {
    die "TODO";
  }

}

sub run
{
  my(@cmd) = @_;
  print "@cmd\n";
  system @cmd;
}

1;
