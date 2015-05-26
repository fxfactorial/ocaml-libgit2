PACKAGES := ctypes.foreign
CCLIB := libgit2.0.22.0.dylib
SRC := git.ml


.PHONY:clean git_test

git_test:
	ocamlfind ocamlopt -package $(PACKAGES) -cclib $(CCLIB) \
	-thread -linkpkg git.ml -o $@
	./$@

debug:
	ocamlfind ocamlopt -package $(PACKAGES) -cclib $(CCLIB) \
	-linkpkg $(SRC) -o $(DEBUG_EXEC)

clean:
	rm -rf *.cmi *.cmt *.cmx *.cmo *.o git_test
