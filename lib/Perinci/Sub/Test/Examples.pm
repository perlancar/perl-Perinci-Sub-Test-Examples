package Perinci::Sub::Test::Examples;

use 5.010;
use strict;
use warnings;

use Test::More;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(spec_to_usage);

# VERSION

our %SPEC;

# TODO: use Perinci::Sub::Gen::AccessTable to allow us to add --include-subs,
# --sub-match, --exclude-subs, etc.

$SPEC{test_sub_examples} = {
    v => 1.1,
    summary => "Test examples in module's function metadata",
    args => {
        module => {
            summary => 'Name of module to test, e.g. Foo::Bar',
            req => 1,
            schema => 'str*',
            pos => 1,
        },
        load => {
            summary => 'Whether to try to require the module',
            schema => [bool => {default=>1}],
        },
    },
};
sub test_sub_examples {
    my %args = @_;
    my $module = $args{module} or return [400, "Please specify module"];
    my $load   = $args{load} // 1;

    # XXX try to load module

    # XXX test examples using Test::More

    # return result, currently always 200
    [200, "OK"];
}

1;
# ABSTRACT: Test examples in function metadata
__END__

=head1 SYNOPSIS

 # in Foo/Bar.pm
 package Foo::Bar;
 our %SPEC;
 $SPEC{mult} = {
     summary  => 'Multiply two numbers',
     args     => { a => {pos=>0}, b => {pos=>1} },
     examples => [
         {summary=>'test 1', args=>{a=>2, b=>3}, result=>6},
         {summary=>'test 2', argv=>[2, 3], result=>6}, # same thing
         {summary=>'bad test 3', argv=>[2, 4], result=>7}, # will fail
     ],
 };
 sub mult {
     my %args = @_;
     [200, "OK", $args{a}*$args{b}];
 }
 1;

 # in your program

 use Perinci::Sub::Test::Examples qw(test_sub_examples);
 test_sub_examples(module => 'Foo::Bar');

 # sample prove output (XXX fix)

 test-script ..
    ok 1 - test 1
    ok 2 - test 2
    not ok 3 - bad test 3
    1..3


=head1 DESCRIPTION


=head1 FUNCTIONS

None are exported, but they are exportable.

=cut
