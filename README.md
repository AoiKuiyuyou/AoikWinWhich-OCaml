# AoikWinWhich
[AoikWinWhich](https://github.com/AoiKuiyuyou/AoikWinWhich) written in OCaml.

Tested working with:
- OCPWin 20141117
- Windows 8.1
- Windows earlier versions should work but not tested

## Table of Contents
- [Setup](#setup)
- [Usage](#usage)

## Setup
Clone this git repository to local:
```
git clone https://github.com/AoiKuiyuyou/AoiWinWhich-OCaml
```

In the local repository directory, the source file is
[aoikwinwhich.ml](/src/aoikwinwhich/aoikwinwhich.ml).

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
- The generated program file is **./aoikwinwhich.exe**.

## Usage
See [usage](https://github.com/AoiKuiyuyou/AoikWinWhich#how-to-use) in the
general project [AoikWinWhich](https://github.com/AoiKuiyuyou/AoikWinWhich).
