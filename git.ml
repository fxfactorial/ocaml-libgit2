open Ctypes
open Foreign

module Common = struct
    let git_libgit2_version =
      foreign "git_libgit2_version" (ptr int @-> ptr int @-> ptr int @-> returning void)

    let git_libgit2_features =
      foreign "git_libgit2_features" (void @-> returning int)

    (* This needs a second varidic argument *)
    let git_libgit2_opts =
      foreign "git_libgit2_opts" (int @-> returning int)
  end

module Types = struct
    type git_odb
    type git_odb_backend
    type git_odb_object
    type git_odb_stream
    type git_odb_writepack
    type git_refdb
    type git_refdb_backend
    type git_repository
    type git_object
    type git_revwalk
    type git_tag
    type git_blob
    type git_commit
    type git_tree_entry
    type git_tree
    type git_treebuilder
    type git_index
    type git_index_conflict_iterator
    type git_config
    type git_config_backend
    type git_reflog_entry
    type git_reflog
    type git_note
    type git_packbuilder
    type git_time
    type git_signature
    type git_reference
    type git_reference_iterator
    type git_transaction
    type git_annotated_commit
    type git_merge_result
    type git_status_list
    type git_rebase
    type git_refspec
    type git_remote
    type git_transport
    type git_push
    type git_remote_head
    type git_remote_callbacks
    type git_transfer_progress

    let git_off_t = typedef int64_t "git_off_t"
    let git_time_t = typedef int64_t "git_time_t"
    let git_ref_t = typedef int64_t "git_ref_t"
    let git_branch_t = typedef int64_t "git_branch_t"
    let git_filemode_t = typedef int64_t "git_filemode_t"
    let git_cert_t = typedef int64_t "git_cert_t"

    let git_odb = typedef
                    (structure "git_odb" : git_odb structure typ)
                    "git_odb"

    let git_odb_backend =
      typedef
        (structure "git_odb_backend" :  git_odb_backend structure typ)
        "git_odb_backend"

    let git_odb_object =
      typedef
        (structure "git_odb_object" : git_odb_object structure typ)
        "git_odb_object"

    let git_odb_stream =
      typedef
        (structure "git_odb_stream" : git_odb_stream structure typ)
        "git_odb_stream"

    let git_odb_writepack =
      typedef
        (structure "git_odb_writepack" : git_odb_writepack structure typ)
        "git_odb_writepack"

    let git_refdb =
      typedef
        (structure "git_refdb" : git_refdb structure typ)
        "git_refdb"

    let git_refdb_backend =
      typedef
        (structure "git_refdb_backend" : git_refdb_backend structure typ)
        "git_refdb_backend"

    let git_repository =
      typedef
        (structure "git_repository" : git_repository structure typ)
        "git_repository"

    let git_object =
      typedef
        (structure "git_object" : git_object structure typ)
        "git_object"

    let git_revwalk =
      typedef
        (structure "git_revwalk" : git_revwalk structure typ)
        "git_revwalk"

    let git_tag =
      typedef
        (structure "git_tag" : git_tag structure typ)
        "git_tag"

    let git_blog =
      typedef
        (structure "git_blob" : git_blob structure typ)
        "git_blog"

    let git_commit =
      typedef
        (structure "git_commit" : git_commit structure typ)
        "git_commit"

    let git_tree_entry =
      typedef
        (structure "git_tree_entry" : git_tree_entry structure typ)
        "git_tree_entry"
        (* Stopped, please continue *)
  end

module Oid = struct
    type git_oid
    type git_oid_shorten

    let git_oid_shorten =
      typedef
        (structure "git_oid_shorten" : git_oid_shorten structure typ)
        "git_oid_shorten"

    let git_oid =
      typedef
        (structure "git_oid" : git_oid structure typ)
        "git_oid"

    let git_oid_fromstr =
      foreign
        "git_oid_fromstr"
        (ptr git_oid @-> string @-> returning int)

    let git_oid_fromstrp =
      foreign
        "git_oid_fromstrp"
        (ptr git_oid @-> string @-> returning int)

    let git_oid_fromstrn =
      foreign
        "git_oid_fromstrn"
        (ptr git_oid @-> string @-> returning size_t)

    let git_oid_fmt =
      foreign
        "git_oid_fmt"
        (string @-> ptr git_oid @-> returning void)

    let git_oid_nfmt =
      foreign
        "git_oid_nfmt"
        (string @-> size_t @-> ptr git_oid @-> returning void)

    let git_oid_pathfmt =
      foreign
        "git_oid_pathfmt"
        (string @-> ptr git_oid @-> returning void)

    let git_oid_tostr_s =
      foreign
        "git_oid_tostr_s"
        (ptr git_oid @-> returning string)

    let git_oid_tostr =
      foreign
        "git_oid_tostr"
        (string @-> size_t @-> ptr git_oid @-> returning string)

    let git_oid_cpy =
      foreign
        "git_oid_cpy"
        (ptr git_oid @-> ptr git_oid @-> returning void)

    let git_oid_cmp =
      foreign
        "git_oid_cmp"
        (ptr git_oid @-> ptr git_oid @-> returning int)

    let git_oid_equal =
      foreign
        "git_oid_equal"
        (ptr git_oid @-> ptr git_oid @-> returning int)

    let git_oid_ncmp =
      foreign
        "git_oid_ncmp"
        (ptr git_oid @-> ptr git_oid @-> size_t @-> returning int)

    let git_oid_streq =
      foreign
        "git_oid_streq"
        (ptr git_oid @-> string @-> returning int)

    let git_oid_strcmp =
      foreign
        "git_oid_strcmp"
        (ptr git_oid @-> string @-> returning int)

    let git_oid_iszero =
      foreign
        "git_oid_iszero"
        (ptr git_oid @-> returning int)

    let git_oid_shorten_new =
      foreign
        "git_oid_shorten_new"
        (size_t @-> returning (ptr git_oid_shorten))

    let git_oid_shorten_add =
      foreign
        "git_oid_shorten_add"
        (ptr git_oid_shorten @-> string @-> returning int)

    let git_oid_shorten_free =
      foreign
        "git_oid_shorten_free"
        (ptr git_oid_shorten @-> returning void)

  end

module Attr = struct

    let git_attr_for_each_cb = string @-> string @-> ptr void @-> returning int

    let git_attr_value = foreign "git_attr_value" (string @-> returning int)
    let git_attr_get =
      foreign
        "git_attr_get"
        ((ptr string) @->
           (ptr Types.git_repository) @->
             uint32_t @->
               string @->
                 string @-> returning int)

    let git_attr_get_many =
      foreign
        "git_attr_get_many"
        (ptr string @->
           (ptr Types.git_repository) @->
             uint32_t @->
               string @->
                 size_t @->
                   ptr string @->
                     returning int)

    let git_attr_for_each =
      foreign
        "git_attr_foreach"
        (ptr Types.git_repository @->
           uint32_t @->
             string @->
               funptr git_attr_for_each_cb @->
                 ptr void @->
                   returning int)

    let git_attr_add_macro =
      foreign
        "git_attr_cache_flush"
        (ptr Types.git_repository @-> returning void)

    let git_attr_add_macro =
      foreign
        "git_attr_add_macro"
        (ptr Types.git_repository @-> string @-> string @-> returning int)
  end

let () =
  let major = allocate int 0 in
  let minor = allocate int 0 in
  let rev = allocate int 0 in
  Common.git_libgit2_version major minor rev;
  Printf.sprintf "%d.%d.%d" (!@ major) (!@ minor) (!@ rev) |> print_endline;
  let features_value = Common.git_libgit2_features () in
  print_endline (string_of_int features_value)
