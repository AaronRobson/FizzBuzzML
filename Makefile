.PHONY: all build buildtests test clean

.DEFAULT_GOAL := all

all: build test

ifeq '$(findstring ;,$(PATH))' ';'
  detected_OS := Windows
else
  detected_OS := $(shell uname 2>/dev/null || echo Unknown)
  detected_OS := $(patsubst CYGWIN%,Cygwin,$(detected_OS))
  detected_OS := $(patsubst MSYS%,MSYS,$(detected_OS))
  detected_OS := $(patsubst MINGW%,MSYS,$(detected_OS))
endif

fizzbuzz_executable := fizzbuzz
ifeq ($(detected_OS), Windows)
	fizzbuzz_executable := fizzbuzz.exe
endif
ifeq ($(detected_OS), Cygwin)
	fizzbuzz_executable := fizzbuzz.exe
endif

clean:
	rm -f *.cache *.cmi *.cmo *.cmx *.o ${fizzbuzz_executable} fizzbuzztests

build: $(fizzbuzz_executable)

$(fizzbuzz_executable): library.cmx main.cmx
	ocamlopt -o fizzbuzz library.cmx main.cmx

%.cmx: %.ml
	ocamlopt -c $<

test: buildtests
	./fizzbuzztests

buildtests: fizzbuzztests

fizzbuzztests: library.ml test.ml
	ocamlfind ocamlc -o fizzbuzztests -package oUnit -linkpkg -g library.ml test.ml
