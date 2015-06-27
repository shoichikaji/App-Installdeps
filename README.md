# NAME

App::Installdeps - a wrapper of carton for git/dist URL syntax

# SYNOPSIS

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

# DESCRIPTION

App::Installdeps is a wrapper of [Carton](https://metacpan.org/pod/Carton) for `git`/`dist` URL syntax.
Unfortunately Carton does not support `git`/`dist` URL syntax yet.
I'm sure it supports them soon!

Meanwhile, why don't you use `installdeps.pl`
which just installs modules with `git`/`dist` URL syntax before executing `carton install`.

# AUTHOR

Shoichi Kaji <skaji@cpan.org>

# COPYRIGHT

Copyright 2015- Shoichi Kaji

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[Carton](https://metacpan.org/pod/Carton)
