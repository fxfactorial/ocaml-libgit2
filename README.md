# ocaml-libgit2

This package provides bindings to [libgit2](https://libgit2.github.com). The modules are organized
all under the `Git` module where the submodules correspond to all the
headers in the [include](https://github.com/libgit2/libgit2/tree/master/include/git2) of libgit2. 

# Helpers

The root `Git` module also contains helper functions for common
tasks. These let you deal with OCaml values rather than dealing with
the `Ctypes` library.

# Installation

Since I work on OS X primarily, my first goal is to have this working
transparently and cleanly on that platform first.

I haven't submitted to opam yet, but this works right now for OS X
users.

    git clone --recursive https://github.com/fxfactorial/ocaml-libgit2
    cd ocaml-libgit2
    make install

To do a sanity check of everything working, try the following.

in *test.ml*

    open Git
    
    let () =
      init ();
      "libgit's version is: " ^ git_library_version () |> print_endline

&#x2026;and then compile that with 

    ocamlfind ocamlopt -package ocaml-libgit2 -linkpkg test.ml -o SanityCheck
    ./SanityCheck

If all went well, no DLL errors, then congrats. This most likely means
everything is correct. 

# Documentation

I'm trying to expose as much of the API as I can and the naming is 1-1
between the OCaml side and C. If lost then look at libgit2's own
[docs](https://libgit2.github.com/libgit2/#HEAD).