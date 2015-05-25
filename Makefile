PACKAGES := ctypes.foreign
CCLIB := libgit2.0.22.0.dylib
SRC := git.ml

DEBUG_EXEC := Git_test

.PHONY:clean generate_bindings

generate_bindings:
	ocamlfind ocamlopt -package $(PACKAGES) -cclib $(CCLIB) \
	-thread -linkpkg git.ml -o $@
	./$@

debug:
	ocamlfind ocamlopt -package $(PACKAGES) -cclib $(CCLIB) \
	-linkpkg $(SRC) -o $(DEBUG_EXEC)

clean:
	rm -rf *.cmi *.cmt *.cmx *.cmo *.o $(DEBUG_EXEC) generate_bindings
