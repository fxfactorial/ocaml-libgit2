# ocaml-libgit2

This package provides bindings to [libgit2](https://libgit2.github.com). The modules are organized
all under the \`Git\` module where the submodules correspond to all the
headers in the [include](https://github.com/libgit2/libgit2/tree/master/include/git2) directory of libgit2.

# Helpers

The root \`Git\` module also contains helper functions for common
tasks. These let you deal with OCaml values rather than dealing with
the \`Ctypes\` library. 

# Documentation

I'm trying to expose as much of the API as I can and the naming is 1-1
between the OCaml side and C. 
If lost, the best documentation is libgit2's [docs](https://libgit2.github.com/libgit2/#HEAD)