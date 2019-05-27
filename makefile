.PHONY: all build buildall buildmain buildtests test check clean

all: build

build: buildall

buildall: buildmain buildtests

buildmain: fizzbuzz

buildtests: fizzbuzztests

fizzbuzz: library.cmx main.cmx
	ocamlopt -o fizzbuzz library.cmx main.cmx

library.cmx:
	ocamlopt -c library.ml

main.cmx:
	ocamlopt -c main.ml

fizzbuzztests: library.ml test.ml
	ocamlfind ocamlc -o fizzbuzztests -package oUnit -linkpkg -g library.ml test.ml

test: buildtests
	./fizzbuzztests

check: test

clean:
	rm -f *.cache *.cmi *.cmo *.cmx *.o fizzbuzz fizzbuzztests
