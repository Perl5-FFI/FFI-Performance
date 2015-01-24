package
  Archive::Libarchive::FFI::SweetLite2;

use strict;
use warnings;
use FFI::Platypus;
use Exporter::Tidy
  default => [qw(
    ffi_lib attach_function
    _void _int _uint _long _ulong _int64 _uint64
    _short _ushort _char _uchar _float _double _str _ptr
  )];

my $ffi = FFI::Platypus->new;

sub platypus { $ffi }

my @libs;

sub ffi_lib ($)
{
  my $lib = shift;
  $ffi->lib($$lib);
}

my $count = 0;
sub attach_function ($$$;$)
{
  my($name, $arg_types, $rv_type, $wrapper ) = @_;
  my $pkg = caller;
  $arg_types //= [];
  my $install_name = $name;
  ( $name, $install_name ) = @{ $name } if ref $name;

  if($wrapper)
  {
    my $tmpname = "Archive::Libarchive::FFI::SweetLite2::Tmp::${install_name}${count}";
    $count++;
    $ffi->attach( [$name => $tmpname] => [map { chr $_ } @$arg_types] => chr $rv_type );
    my $sub = eval qq{
      sub { \$wrapper->(\\\&$tmpname, \@_) }
    };
    warn $@ if $@;
    no strict 'refs';
    *{join '::', $pkg, $install_name} = $sub;
  }
  else
  {
    $ffi->attach( [$name => join('::', $pkg, $install_name)] => [map { chr $_ } @$arg_types] => chr $rv_type );
  }
}

$ffi->type( void             => 'v' );
$ffi->type( string           => 's' );
$ffi->type( int              => 'i' );
$ffi->type( 'unsigned int'   => 'I' );
$ffi->type( short            => 'z' );
$ffi->type( 'unsigned short' => 'Z' );
$ffi->type( long             => 'l' );
$ffi->type( 'unsigned long'  => 'L' );
$ffi->type( 'uint64'         => 'X' );
$ffi->type( 'sint64'         => 'x' );
$ffi->type( 'signed char'    => 'c' );
$ffi->type( 'unsigned char'  => 'C' );
$ffi->type( 'float'          => 'f' );
$ffi->type( 'double'         => 'd' );

$ffi->custom_type(p => {
  perl_to_native => sub { ref($_[0]) ? ${$_[0]} : $_[0] },
  native_to_perl => sub { $_[0] },
});

sub _void ()     { ord 'v' }
sub _int ()      { ord 'i' }
sub _uint ()     { ord 'I' }
sub _short ()    { ord 'z' }
sub _ushort ()   { ord 'Z' }
sub _long ()     { ord 'l' }
sub _ulong ()    { ord 'L' }
sub _int64 ()    { ord 'x' }
sub _uint64 ()   { ord 'X' }
sub _char ()     { ord 'c' }
sub _uchar ()    { ord 'C' }
sub _float ()    { ord 'f' }
sub _double ()   { ord 'd' }
sub _str ()      { ord 's' }
sub _ptr ()      { ord 'p' }

1;
