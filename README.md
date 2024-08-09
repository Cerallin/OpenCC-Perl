# OpenCC-perl

A perl wrapper for OpenCC.

## 用法

```perl
use OpenCC;

my $cc = OpenCC->new("s2tw.json");
$converted = $cc->convert("汉字");
print "$converted\n";
```

详情请参考 [OpenCC.pm](OpenCC.pm) 和 [the original repository](https://github.com/BYVoid/OpenCC).

## 编译 & 安装

### 编译安装OpenCC

[详情请参考官方文档。](https://github.com/BYVoid/OpenCC)

### 编译安装OpenCC-perl

```shell
perl Makefile.PL $PATH_TO_OPENCC # for example /usr/local/opencc
make & make install
```

### 运行测试

```shell
perl ./test.pl
```

## TODOs

- [ ] Handle errors on creation.
- [ ] Add method to handle errors.
- [ ] 添加测试
