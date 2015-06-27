use strict;
use warnings;
use utf8;
use Test::More;
use FindBin;
use File::Path 'rmtree';

chdir $FindBin::Bin;
rmtree "local" if -d "local";

my $out = `$^X ../script/installdeps.pl 2>&1`;
die "fail" if $? != 0;

like $out, qr/Successfully installed Acme-Shutup/;
like $out, qr/Successfully installed App-ChangeShebang-0.03/;

# not reinstall check
$out = `$^X ../script/installdeps.pl 2>&1`;
die "fail" if $? != 0;

unlike $out, qr/Successfully installed Acme-Shutup/;
unlike $out, qr/Successfully installed App-ChangeShebang-0.03/;

done_testing;
