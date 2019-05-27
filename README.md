# FizzBuzzML
An implementation of FizzBuzz written in OCaml.

[![Build Status](https://travis-ci.com/AaronRobson/FizzBuzzML.svg?branch=master)](https://travis-ci.com/AaronRobson/FizzBuzzML)

[https://blog.codinghorror.com/why-cant-programmers-program/](https://blog.codinghorror.com/why-cant-programmers-program/)

# Requirements
```bash
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

# Make targets

## Build and run tests
```bash
make
```

## Run executable
```bash
make run
```

## Run tests
```bash
make tests
```

## Clear up
```bash
make clean
```
