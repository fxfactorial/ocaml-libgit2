ROOT := $(shell pwd)
PACKAGES := ctypes.foreign,uri
CCLIB := libgit2.0.22.0.dylib
SRC := git.ml

.PHONY: clean

native:libgit set_meta
	ocamlfind ocamlopt -package $(PACKAGES) \
	-cclib `ocamlfind query ocaml-libgit2`/$(CCLIB) -linkpkg $(SRC) -o Git_test

libgit:
	@echo "Updating libgit2 itself"
	git submodule update --remote
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

install:
	ocamlfind install ocaml-libgit2 -add git.cmo git.cmi git.cmt git.o git.cmx

uninstall:
	ocamlfind remove ocaml-libgit2
clean:
	rm -rf *.cmi *.cmt *.cmx *.cmo *.o git_test libgit_gen_* a.out
