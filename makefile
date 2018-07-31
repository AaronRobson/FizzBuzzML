all: build check

build: library.cmx main.cmx
	ocamlopt -o fizzbuzz library.cmx main.cmx

library.cmx:
	ocamlopt -c library.ml

main.cmx:
	ocamlopt -c main.ml

test:
	ocamlfind ocamlc -o test -package oUnit -linkpkg -g library.ml test.ml

check: test
	./test

clean:
	rm -f *.cache
	rm -f *.cmi
	rm -f *.cmo
	rm -f *.cmx
	rm -f *.o
	rm -f fizzbuzz
	rm -f test
