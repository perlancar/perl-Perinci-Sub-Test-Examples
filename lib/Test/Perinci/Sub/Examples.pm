package Test::Perinci::Sub::Examples;

use 5.010;
use strict;
use warnings;

# VERSION

use parent qw(Test::Builder::Module);
our @EXPORT = qw(examples_ok all_examples_ok);
use ExtUtils::Manifest qw(maniread);

use Perinci::Sub::Test::Examples;

sub all_examples_ok {
    my $manifest = maniread();
    my @files = grep m!^lib/.*\.pm$!, keys %$manifest;
    __PACKAGE__->builder->plan(tests => 1 * @files);
    examples_ok(@files);
}

sub examples_ok {
    my @modules = @_;

    # NOT YET ADJUSTED FROM Test::Synopsis

    #for my $module (@modules) {
    #    my($code, $line, @option) = extract_synopsis($module);
    #    unless ($code) {
    #        __PACKAGE__->builder->ok(1, "No SYNOPSIS code");
    #        next;
    #    }
    #
    #    my $option = join(";", @option);
    #    my $test   = qq(#line $line "$module"\n$option; sub { $code });
    #    my $ok     = _compile($test);
    #    __PACKAGE__->builder->ok($ok, $module);
    #    __PACKAGE__->builder->diag($@) unless $ok;
    #}
}

1;
# ABSTRACT: Test your function examples

=head1 SYNOPSIS

 # xt/peri-sub-examples.t (with Module::Install::AuthorTests)
 use Test::Perinci::Sub::Examples;
 all_examples_ok();

 # or, run safe without Test::Perinci::Sub::Examples
 use Test::More;
 eval "use Test::Perinci::Sub::Examples";
 plan skip_all => "Test::Perinci::Sub::Examples required for testing" if $@;
 all_examples_ok();


=head1 DESCRIPTION

Test::Perinci::Sub::Examples is an (author) test module to find .pm files under
your I<lib> directory and then make sure the examples in the C<examples>
property of function metadata work.


=head1 SEE ALSO

L<Rinci>, L<Perinci::Sub::Test::Examples>

