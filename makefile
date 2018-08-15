.PHONY: all build buildall buildmain buildtests test check clean clean

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

fizzbuzztests:
	ocamlfind ocamlc -o fizzbuzztests -package oUnit -linkpkg -g library.ml test.ml

test: buildtests
	./fizzbuzztests

tests: test

check: test

clean:
	rm -f *.cache
	rm -f *.cmi
	rm -f *.cmo
	rm -f *.cmx
	rm -f *.o
	rm -f fizzbuzztests
	rm -f test

clear: clean
