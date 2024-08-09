use ExtUtils::MakeMaker;

my $path_to_opencc = @ARGV[0];

$path_to_opencc = "/usr/local/opencc" if $path_to_opencc eq "";

WriteMakefile(
    NAME         => 'OpenCC',
    VERSION      => '0.1.0',
    ABSTRACT     => 'OpenCC perl wrapper',
    LIBS         => ["-L${path_to_opencc}/lib -lopencc"],
    INC          => "-I${path_to_opencc}/include",
    OBJECT       => '$(O_FILES)',
    clean        => { FILES => 'OpenCC.c OpenCC.o' },
);
