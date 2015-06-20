ROOT := $(shell pwd)
PACKAGES := ctypes.foreign,uri
CCLIB := libgit2.0.22.0.dylib
SRC := git.ml
TEST_EXEC := Test_executable
TEST_SRC := test.ml

.PHONY: clean distclean uninstall

all:install

native:libgit set_meta
	ocamlfind ocamlopt -package $(PACKAGES) \
	-cclib `ocamlfind query ocaml-libgit2`/$(CCLIB) -linkpkg $(SRC)

bytecode:libgit set_meta
	# ocamlfind ocamlc -package $(PACKAGES) \
	# -cclib `ocamlfind query ocaml-libgit2`/$(CCLIB) -linkpkg $(SRC)
	ocamlfind ocamlc -custom -package ctypes.foreign,uri \
	-linkpkg -cclib -L$(shell ocamlfind query ocaml-libgit2) \
	-cclib -lgit2 $(SRC)

libaries:native bytecode

libgit:
	# Not sure why this doesn't work with opam yet.
	# @echo "Updating libgit2 itself"
	# git submodule update --remote
	ocamlfind install ocaml-libgit2 META
# The trick is the ; since cd is done in a separate shell
	cd `ocamlfind query ocaml-libgit2`; \
	cmake $(ROOT)/libgit2 -DBUILD_CLAR=OFF -DCMAKE_MACOSX_RPATH=. ;\
	cmake --build .; \
	find . -not -name "*.dylib" -not -name "META" -delete

set_meta:
#Need something better
	echo \
	"linkopts = \"-cclib" `ocamlfind query ocaml-libgit2`/$(CCLIB)"\"" >> \
	`ocamlfind query ocaml-libgit2`/META

tests:install
	$(eval PACKAGES := oUnit,ocaml-libgit2)
	ocamlfind ocamlopt $(TEST_SRC) -package \
	$(PACKAGES) -linkpkg -o $(TEST_EXEC)
	./$(TEST_EXEC)

install:native bytecode
	ocamlfind install ocaml-libgit2 -add git.*

distclean:clean uninstall

uninstall:
	ocamlfind remove ocaml-libgit2
clean:
	rm -rf *.cmi *.cmt *.cmx *.cmo *.o libgit_gen_* a.out
