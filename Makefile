ROOT := $(shell pwd)
PACKAGES := ctypes.foreign,uri
CCLIB := libgit2.0.22.0.dylib
SRC := git.ml

.PHONY: clean

all:install

native:libgit set_meta
	ocamlfind ocamlopt -package $(PACKAGES) \
	-cclib `ocamlfind query ocaml-libgit2`/$(CCLIB) -linkpkg $(SRC)

bytecode:libgit set_meta
	ocamlfind ocamlc -package $(PACKAGES) \
	-cclib `ocamlfind query ocaml-libgit2`/$(CCLIB) -linkpkg $(SRC)

libgit:
	# Not sure why this doesn't work with opam yet.
	# @echo "Updating libgit2 itself"
	# git submodule update --remote
	ocamlfind install ocaml-libgit2 META
# The trick is the ; since cd is done in a separate shell
	cd `ocamlfind query ocaml-libgit2`; \
	cmake $(ROOT)/libgit2 -DBUILD_CLAR=OFF; \
	cmake --build .; \
	find . -not -name "*.dylib" -not -name "META" -delete

set_meta:
#Need something better
	echo "linkopts = \"-cclib" `ocamlfind query ocaml-libgit2`/$(CCLIB)"\"" >> \
	`ocamlfind query ocaml-libgit2`/META

install:native bytecode
	ocamlfind install ocaml-libgit2 -add  git.cmo git.cmi git.cmt git.o git.cmx
uninstall:
	ocamlfind remove ocaml-libgit2
clean:
	rm -rf *.cmi *.cmt *.cmx *.cmo *.o libgit_gen_* a.out
