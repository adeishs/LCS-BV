requires 'perl', '5.008000';

# requires 'Some::Module', 'VERSION';

on test => sub {
    requires 'Test::More', '0.88';
    requires 'Test::Deep', '0';
    requires 'LCS', '0';
};

on 'develop' => sub {
  requires 'Test::Spelling';
};