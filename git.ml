open Ctypes
open Foreign

module Common = struct
    let git_libgit2_version =
      foreign "git_libgit2_version" (ptr int @-> ptr int @-> ptr int @-> returning void)
  end

let () =
  let major = allocate int 0 in
  let minor = allocate int 0 in
  let rev = allocate int 0 in
  Common.git_libgit2_version major minor rev;
  Printf.sprintf "%d.%d.%d" (!@ major) (!@ minor) (!@ rev) |> print_endline
