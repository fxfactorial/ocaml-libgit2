open Ctypes
open Foreign

let prepare_git =
  foreign "git_libgit2_init" (ptr void @-> returning void)

type git_repository
let git_repository : git_repository structure typ = structure "git_repository"

let check_if_repo =
  foreign
    "git_repository_open_ext"
    ((ptr (ptr git_repository)) @-> string @-> int @-> string @-> returning int)

let () =
  prepare_git null;
  let result = check_if_repo
                 (from_voidp (ptr git_repository) null)
                 "/Users/Edgar/Repos/oboto"
                 0
                 ""
  in
  print_string (string_of_int result)

