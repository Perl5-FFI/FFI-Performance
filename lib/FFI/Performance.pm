package FFI::Performance;

use strict;
use warnings;

our $VERSION = '0.01';

1;

=encoding utf8

=head1 NAME

FFI::Performance - Benchmarks and tests for Perl + FFI + Performance

=head1 SYNOPSIS

 perl Build.PL
 ./Build
 perl -Mblib bin/ffi-performance-benchmark

=head1 DESCRIPTION

This is the companion code to a talk that I gave at the Pittsburgh Perl
Workshop 2014.  Here is a recording:

https://www.youtube.com/watch?v=uq2mgTOtbhM&t=7m47s&noredirect=1

(starts at about 7:45 if the link does not take you directly to the beginning 
of the talk).

The slides are a little hard to read on the recording and you can see 
them here:

https://docs.google.com/presentation/d/1zUT91W5qDq8eoDYWNpfn-DQABcLCyl_M-xbz5obAI_U/edit

This was apparently the scariest part of my talk:

https://twitter.com/mikegrb/status/531186796450033664/photo/1

=head1 SEE ALSO

=over

=item L<FFI::Raw>

=item L<FFI::Util>

pointer trickiness

=item L<FFI::CheckLib>

Detect and find DLLs / shared libraries à la L<ExtUtils::CheckLib>

=item L<FFI::TinyCC>

caveat laden JITish for FFI

=item FFI based extensions

=over

=item L<Archive::Libarchive::FFI>

=item L<Crypt::ZCert>

=item L<ZMQ::FFI>

=item L<POEx::ZMQ>

=item L<File::LibMagic::FFI>

=item L<UUID::FFI|http://github.com/plicease/UUID-FFI>

=back

=item L<libffi|https://sourceware.org/libffi/>

=item L<Ruby FFI|https://github.com/ffi/ffi/wiki>

=item L<Python's Ctypes|http://docs.python.org/2/library/ctypes.html>

=back

=head1 AUTHOR

Graham Ollis E<lt>plicease@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Graham Ollis

This is free software; you can redistribute it and/or modify it under 
the same terms as the Perl 5 programming language system itself.

=cut
