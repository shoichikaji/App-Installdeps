#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use App::cpanminus::fatscript;
use Carton::CLI;
use Config;
use Getopt::Long ();
use Module::CPANfile;
use Module::Metadata;
use Pod::Usage ();

my $p = Getopt::Long::Parser->new(
    config => [ "no_ignore_case", "no_auto_abbrev" ],
);

$p->getoptionsfromarray(
    \@ARGV,
    "h|help"    => sub { Pod::Usage::pod2usage(0) },
    "reinstall" => \(my $reinstall),
) or exit 1;

my $cpanfile = Module::CPANfile->load("cpanfile");
my @module = $cpanfile->merged_requirements->required_modules;
my $inc = [grep -d, "local/lib/perl5", "local/lib/perl5/$Config{archname}"];

my @non_cpan;
for my $module (sort @module) {
    my $prereq = $cpanfile->prereq_for_module($module);
    my $options = $prereq->requirement->options;
    if (my $dist = $options->{dist}) {
        if (!$reinstall) {
            my $meta = Module::Metadata->new_from_module($module, inc => $inc);
            next if $meta;
        }
        push @non_cpan, $dist;
    } elsif (my $git = $options->{git}) {
        if ($git =~ /^http/i) {
            die "${module}'s git url must start with git://, but '$git'\n";
        }
        if (!$reinstall) {
            my $meta = Module::Metadata->new_from_module($module, inc => $inc);
            next if $meta;
        }
        if (my $ref = $options->{ref}) {
            $git .= "\@$ref";
        }
        push @non_cpan, $git;
    }
}

if (@non_cpan) {
    my $cpanm = Module::Metadata->find_module_by_name("App::cpanminus::fatscript");
    !system $^X, $cpanm, "-qn", "-Llocal", @non_cpan or exit 1;
}
exit Carton::CLI->new->run("install");

__END__

=head1 NAME

installdeps.pl - a wrapper of carton for git/dist URL syntax

=head1 SYNOPSIS

  > installdeps.pl [--reinstall]

  Options:
  -h, --help       Show this help
      --reinstall  Reinstall modules even if they are already installed

=cut
