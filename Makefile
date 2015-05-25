PACKAGES := ctypes.foreign
CCLIB := libgit2.0.22.0.dylib
SRC := git.ml

.PHONY:clean


debug:
	ocamlfind ocamlopt -package $(PACKAGES) -cclib $(CCLIB) \
	-linkpkg $(SRC) -o Git_test
