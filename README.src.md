[:var_set('', """
#/ Compile command
aoikdyndocdsl -s README.src.md -n aoikdyndocdsl.ext.all::nto -g README.md
""")]\
[:var_set('source_file_name', 'aoikwinwhich.ml')]\
[:var_set('source_file_url', '/src/aoikwinwhich/aoikwinwhich.ml')]\
[:var_set('program_file_url', './aoikwinwhich.exe')]\
[:HDLR('heading', 'heading')]\
# AoikWinWhich
[AoikWinWhich](https://github.com/AoiKuiyuyou/AoikWinWhich) written in OCaml.

Tested working with:
- OCPWin 20141117
- Windows 8.1
- Windows earlier versions should work but not tested

## Table of Contents
[:toc(beg='next', indent=-1)]

## Setup
Clone this git repository to local:
```
git clone https://github.com/AoiKuiyuyou/AoiWinWhich-OCaml
```

In the local repository directory, the source file is
[[:var('source_file_name')]]([:var('source_file_url')]).

Use program **ocaml** to run without compiling:
```
ocaml src/aoikwinwhich/aoikwinwhich.ml
```

Use program **ocamlc** to compile:
```
ocamlc str.cma src\aoikwinwhich\aoikwinwhich.ml -o aoikwinwhich.exe
```
- **ocamlc** does not recognize `#load "str.cma";;` in the source file. Comment
  out this line before compiling.
- The generated program file is **[:var('program_file_url')]**.

## Usage
See [usage](https://github.com/AoiKuiyuyou/AoikWinWhich#how-to-use) in the
general project [AoikWinWhich](https://github.com/AoiKuiyuyou/AoikWinWhich).
