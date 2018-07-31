# FizzBuzzML
An implementation of FizzBuzz written in OCaml.

[![Build Status](https://travis-ci.com/AaronRobson/FizzBuzzML.svg?branch=master)](https://travis-ci.com/AaronRobson/FizzBuzzML)

[https://blog.codinghorror.com/why-cant-programmers-program/](https://blog.codinghorror.com/why-cant-programmers-program/)

# Requirements
```
sudo apt-get install opam
opam init --yes
opam config env
opam install depext conf-m4.1
opam install ounit --yes
opam update
opam upgrade

sudo apt-get install ocaml-batteries-included
sudo apt-get install libounit-ocaml-dev
```

# Compile and run executable
```
make
./fizzbuzz
```

# Compile and run executable - manual
```
ocamlopt -c library.ml
ocamlopt -c main.ml
ocamlopt -o fizzbuzz library.cmx main.cmx
./fizzbuzz
```

# Compile and run tests
```
make tests
```

# Compile and run tests - manual
```
ocamlfind ocamlc -o test -package oUnit -linkpkg -g library.ml test.ml
./test
```
