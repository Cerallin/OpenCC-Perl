package test;

use OpenCC;
use Data::Dumper;

my $cc = OpenCC->new("s2tw.json");
print Dumper($cc);

my $converted = $cc->convert("汉字");
print $converted, "\n";
