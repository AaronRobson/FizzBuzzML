.DEFAULT_GOAL := all

.PHONY: all
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

clean_files := *.cache *.cmi *.cmo *.cmx *.o ${fizzbuzz_executable} fizzbuzztests

clean_command := rm -f ${clean_files}
ifeq ($(detected_OS), Windows)
	clean_command := del /q ${clean_files} >nul 2>&1
endif

.PHONY: clean
clean:
	${clean_command}

.PHONY: build
build: $(fizzbuzz_executable)

$(fizzbuzz_executable): library.cmx main.cmx
	ocamlopt -o fizzbuzz library.cmx main.cmx

%.cmx: %.ml
	ocamlopt -c $<

.PHONY: run
run: build
	./$(fizzbuzz_executable)

.PHONY: test
test: buildtests
	./fizzbuzztests

.PHONY: buildtests
buildtests: fizzbuzztests

fizzbuzztests: library.ml test.ml
	ocamlfind ocamlc -o fizzbuzztests -package oUnit -linkpkg -g library.ml test.ml
