open Git
open Git.Results
open OUnit2

let test_repo_name = "test_repo"

let test_init _ =
  assert_equal (init()) (Git_payload ())

let test_shutdown _ =
  assert_equal (shutdown ()) (Git_payload ())

let test_init_repo _ =
  assert_equal (init_repo test_repo_name) (Git_payload ())

let suite =
  let tests = ["test_init" >:: test_init;
               "test_init_repo" >:: test_init_repo;
               "test_shutdown" >:: test_shutdown] in
  "Bindings to libgit2 via OCaml and ctypes" >::: tests

(* Entry point for the tests *)
(* let () = *)
(*   run_test_tt_main suite *)

(* Not sure why oUnit is causing exceptions from the C linked code, so
   basically not using oUnit :( *)
let _ =
  init () >>= fun _ ->
  init_repo test_repo_name >>= fun _ ->
  shutdown () >>= fun _ ->
  return (Sys.command @@ "rm -rf " ^ test_repo_name)
