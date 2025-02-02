#!perl
use 5.008;

use strict;
use warnings;
use utf8;

use lib qw(../lib/);

use Test::More;
use Test::Deep;
#cmp_deeply([],any());

use LCS;

use Data::Dumper;

my $class = 'LCS::BV';

use_ok($class);

my $object = new_ok($class);

if (1) {
ok($object->new());
ok($object->new(1,2));
ok($object->new({}));
ok($object->new({a => 1}));

ok($class->new());
}

my $examples = [
  ['ttatc__cg',
   '__agcaact'],
  ['abcabba_',
   'cb_ab_ac'],
   ['yqabc_',
    'zq__cb'],
  [ 'rrp',
    'rep'],
  [ 'a',
    'b' ],
  [ 'aa',
    'a_' ],
  [ 'abb',
    '_b_' ],
  [ 'a_',
    'aa' ],
  [ '_b_',
    'abb' ],
  [ 'ab',
    'cd' ],
  [ 'ab',
    '_b' ],
  [ 'ab_',
    '_bc' ],
  [ 'abcdef',
    '_bc___' ],
  [ 'abcdef',
    '_bcg__' ],
  [ 'xabcdef',
    'y_bc___' ],
  [ 'öabcdef',
    'ü§bc___' ],
  [ 'o__horens',
    'ontho__no'],
  [ 'Jo__horensis',
    'Jontho__nota'],
  [ 'horen',
    'ho__n'],
  [ 'Chrerrplzon',
    'Choereph_on'],
  [ 'Chrerr',
    'Choere'],
  [ 'rr',
    're'],
  [ 'abcdefg_',
    '_bcdefgh'],
  [ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVY_',
    '_bcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVYZ'],
  [ 'aabbcc',
    'abc'],
  [ 'aaaabbbbcccc',
    'abc'],
  [ 'aaaabbcc',
    'abc'],
];


my $examples2 = [
  [ 'abcdefghijklmnopqrstuvwxyz0123456789!"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVY_',
    '_bcdefghijklmnopqrstuvwxyz0123456789!"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVYZ'],
  [ 'abcdefghijklmnopqrstuvwxyz0123456789"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVY_',
    '!'],
  [ '!',
    'abcdefghijklmnopqrstuvwxyz0123456789"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVY_'],
  [ 'abcdefghijklmnopqrstuvwxyz012345678!9!"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVYZ',
    'abcdefghijklmnopqrstuvwxyz012345678_9!"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVYZ'],
  [ 'abcdefghijklmnopqrstuvwxyz012345678_9!"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVYZ',
    'abcdefghijklmnopqrstuvwxyz012345678!9!"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVYZ'],
  [ 'aaabcdefghijklmnopqrstuvwxyz012345678_9!"$%&/()=?ABCDEFGHIJKLMNOPQRSTUVYZZZ',
    'a!Z'],
  [ ('_' x 100) . '0123456789abcdef' . ('!@#$%^&*()' x 100),
    'abc' ],
  [ '__0',
    ('_' x 100) . '0123456789abcdef' . ('!@#$%^&*()' x 100) ],
  [ ('_' x 8) . ('0123456789abcdef' x 5) . ('!@#$%^&*()' x 2),
    ('_' x 7) . ('0123456789abcdef' x 5) ],
];


if (1) {
for my $example (@$examples) {
#for my $example ($examples->[3]) {
  my $a = $example->[0];
  my $b = $example->[1];
  my @a = $a =~ /([^_])/g;
  my @b = $b =~ /([^_])/g;

  cmp_deeply(
    LCS::BV->LCS(\@a,\@b),
    any(@{LCS->allLCS(\@a,\@b)} ),

    "$a, $b"
  );
  if (0) {
    $Data::Dumper::Deepcopy = 1;
    print STDERR 'allLCS: ',Data::Dumper->Dump(LCS->allLCS(\@a,\@b)),"\n";

    print STDERR 'LCS: ',Dumper(LCS::BV->LCS(\@a,\@b)),"\n";
  }
}
}

if (1) {
for my $example (@$examples) {
#for my $example ($examples->[3]) {
  my $a = $example->[1];
  my $b = $example->[0];
  my @a = $a =~ /([^_])/g;
  my @b = $b =~ /([^_])/g;

  cmp_deeply(
    LCS::BV->LCS(\@a,\@b),
    any(@{LCS->allLCS(\@a,\@b)} ),

    "$a, $b"
  );
  if (0) {
    $Data::Dumper::Deepcopy = 1;
    print STDERR 'allLCS: ',Data::Dumper->Dump(LCS->allLCS(\@a,\@b)),"\n";

    print STDERR 'LCS: ',Dumper(LCS::BV->LCS(\@a,\@b)),"\n";
  }
}
}

if (1) {
for my $example (@$examples2) {
#for my $example ($examples->[3]) {
  my $a = $example->[0];
  my $b = $example->[1];
  my @a = $a =~ /([^_])/g;
  my @b = $b =~ /([^_])/g;

  cmp_deeply(
    LCS::BV->LCS(\@a,\@b),
    any(@{LCS->allLCS(\@a,\@b)} ),

    "$a, $b"
  );
  if (0) {
    $Data::Dumper::Deepcopy = 1;
    print STDERR 'allLCS: ',Data::Dumper->Dump(LCS->allLCS(\@a,\@b)),"\n";
    print STDERR 'LCS: ',Dumper(LCS::BV->LCS(\@a,\@b)),"\n";
  }
}
}

if (1) {
for my $example (@$examples2) {
#for my $example ($examples->[3]) {
  my $a = $example->[1];
  my $b = $example->[0];
  my @a = $a =~ /([^_])/g;
  my @b = $b =~ /([^_])/g;

  cmp_deeply(
    LCS::BV->LCS(\@a,\@b),
    any(@{LCS->allLCS(\@a,\@b)} ),

    "$a, $b"
  );
  if (0) {
    $Data::Dumper::Deepcopy = 1;
    print STDERR 'allLCS: ',Data::Dumper->Dump(LCS->allLCS(\@a,\@b)),"\n";
    print STDERR 'LCS: ',Dumper(LCS::BV->LCS(\@a,\@b)),"\n";
  }
}
}

my @data3 = ([qw/a b d/ x 50], [qw/b a d c/ x 50]);

# allLCS will need 100 years
if (0) {
  cmp_deeply(
    LCS::BV->LCS(@data3),
    any(@{LCS->allLCS(@data3)} ),
    '[qw/a b d/ x 50], [qw/b a d c/ x 50]'
  );
  if (0) {
    $Data::Dumper::Deepcopy = 1;
    print STDERR 'allLCS: ',Data::Dumper->Dump(LCS->allLCS(@data3)),"\n";
    print STDERR 'LCS: ',Dumper(LCS::BV->LCS(@data3)),"\n";
  }
}

if (0) {
  is(
    scalar @{LCS::BV->LCS(@data3)},
    LCS->LLCS(@data3),
    '[qw/a b d/ x 50], [qw/b a d c/ x 50] -> ' . LCS->LLCS(@data3)
  );
  if (1) {
    $Data::Dumper::Deepcopy = 1;
    print STDERR 'LCS->LCS: ',Dumper(LCS->LCS(@data3)),"\n";
    print STDERR 'LCS::BV->LCS: ',Dumper(LCS::BV->LCS(@data3)),"\n";
  }
}


if (0) {
  my $rep1 = 33;
  my $rep2 = 2;
  my $a = 'abcd';
  my $b = 'bc';
  my @a = $a =~ /([^_])/g;
  my @b = $b =~ /([^_])/g;
  #my @data4 = ([qw/a b d/ x $rep], [qw/b a d c/ x $rep]);
  my @data4 = ([(@a) x $rep1], [(@b) x $rep2]);

  is(
    scalar @{LCS::BV->LCS(@data4)},
    LCS->LLCS(@data4),
    "[$a x $rep1], [$b x $rep2] -> " . LCS->LLCS(@data4)
  );
  if (0) {
    $Data::Dumper::Deepcopy = 1;
    #print STDERR 'LCS->LCS: ',Dumper(LCS->LCS(@data4)),"\n";
    #print STDERR 'LCS::BV->LCS: ',Dumper(LCS::BV->LCS(@data4)),"\n";
  }
}

done_testing;
