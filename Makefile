PACKAGES := ctypes.foreign,uri
CCLIB := libgit2.0.22.0.dylib
SRC := git.ml

.PHONY:clean git_test build_libgit

git_test:
	ocamlfind ocamlopt -package $(PACKAGES) -cclib $(CCLIB) \
	-linkpkg $(SRC) -o $@
	./$@

build_libgit:
	@echo "Updating libgit2 itself"
	git submodule update --remote
	mkdir libgit2/build
	cmake libgit2
	cmake --build libgit2/build/
clean:
	rm -rf *.cmi *.cmt *.cmx *.cmo *.o git_test libgit_gen_*
