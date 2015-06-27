package App::Installdeps;

use strict;
use 5.008_005;
our $VERSION = '0.01';

1;
__END__

=encoding utf-8

=head1 NAME

App::Installdeps - a wrapper of carton for git/dist URL syntax

=head1 SYNOPSIS

  > cat cpanfile
  requires 'Plack';
  requires 'My::Module', git => 'git://github.com/you/My-Module.git', ref => 'develop';
  requires 'My::WebApp', dist => 'http://example.com/My-WebApp.tar.gz';

  > installdeps.pl
  Successfully installed My-Module-0.01
  Successfully installed My-WebApp-1.001
  2 distributions installed
  Installing modules using /home/you/cpanfile
  ...
  Successfully installed Plack-1.0037
  Complete! Modules were installed into /home/you/local

=head1 DESCRIPTION

App::Installdeps is a wrapper of L<Carton> for C<git>/C<dist> URL syntax.
Unfortunately Carton does not support C<git>/C<dist> URL syntax yet.
I'm sure it supports them soon!

Meanwhile, why don't you use C<installdeps.pl>
which just installs modules with C<git>/C<dist> URL syntax before executing C<carton install>.

=head1 AUTHOR

Shoichi Kaji E<lt>skaji@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2015- Shoichi Kaji

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Carton>

=cut
