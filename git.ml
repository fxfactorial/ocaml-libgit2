open Ctypes
open Foreign

module Common = struct

    let git_feature_t = typedef int64_t "git_feature_t"
    let git_libgit_2_opt_t = typedef int64_t "git_libgit2_opt_t"

    let git_libgit2_version =
      foreign
        "git_libgit2_version"
        (ptr int @-> ptr int @-> ptr int @-> returning void)

    let git_libgit2_features =
      foreign
        "git_libgit2_features"
        (void @-> returning int)

    (* This needs a second varidic argument *)
    let git_libgit2_opts =
      foreign
        "git_libgit2_opts"
        (int @-> returning int)
  end

module Buffer = struct
    type git_buf
    let struc = structure ""
    let ptr_ = field struc "ptr" (ptr char)
    let size_ = field struc "size" size_t

    let git_buf =
      let _ = field struc "asize" size_t in
      let _ = field struc "size" size_t in
      seal struc;
      typedef
        (struc : git_buf structure typ)
        "git_buf"

    let git_buf_free =
      foreign
        "git_buf_free"
        (ptr git_buf @-> returning void)

    let git_buf_grow =
      foreign
        "git_buf_grow"
        (ptr git_buf @-> size_t @-> returning int)

    let git_buf_set =
      foreign
        "git_buf_set"
        (ptr git_buf @-> ptr void @-> size_t @-> returning int)

    let git_buf_is_binary =
      foreign
        "git_buf_is_binary"
        (ptr git_buf @-> returning int)

    let git_buf_contains_nul =
      foreign
        "git_buf_contains_nul"
        (ptr git_buf @-> returning int)
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
    type git_time_t
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
    let git_otype = typedef int64_t "git_otype"

    let git_odb =
      typedef
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

    let git_blob =
      typedef
        (structure "git_blob" : git_blob structure typ)
        "git_blob"

    let git_commit =
      typedef
        (structure "git_commit" : git_commit structure typ)
        "git_commit"

    let git_tree_entry =
      typedef
        (structure "git_tree_entry" : git_tree_entry structure typ)
        "git_tree_entry"
    (* Stopped, please continue *)

    let git_tree =
      typedef
        (structure "git_tree" : git_tree structure typ)
        "git_tree"

    let git_treebuilder =
      typedef
        (structure "git_treebuilder" : git_treebuilder structure typ)
        "git_treebuilder"

    let git_index =
      typedef
        (structure "git_index" : git_index structure typ)
        "git_index"

    let git_index_conflict_iterator =
      typedef
        (structure "git_index_conflict_iterator"
         : git_index_conflict_iterator structure typ)
        "git_index_conflict_iterator"

    let git_config =
      typedef
        (structure "git_config" : git_config structure typ)
        "git_config"

    let git_config_backend =
      typedef
        (structure "git_config_backend" : git_config_backend structure typ)
        "git_config_backend"

    let git_reflog_entry =
      typedef
        (structure "git_reflog_entry" : git_reflog_entry structure typ)
        "git_reflog_entry"

    let git_reflog =
      typedef
        (structure "git_reflog" : git_reflog structure typ)
        "git_reflog"

    let git_note =
      typedef
        (structure "git_note" : git_note structure typ)
        "git_note"

    let git_packbuilder =
      typedef
        (structure "git_packbuilder" : git_packbuilder structure typ)
        "git_packbuilder"

    let git_time =
      typedef
        (structure "git_time" : git_time structure typ)
        "git_time"

    let git_signature =
      typedef
        (structure "git_signature" : git_signature structure typ)
        "git_signature"

    let git_reference =
      typedef
        (structure "git_reference" : git_reference structure typ)
        "git_reference"

    let git_reference_iterator =
      typedef
        (structure "git_reference_iterator" : git_reference_iterator structure typ)
        "git_reference_iterator"

    let git_transaction =
      typedef
        (structure "git_transaction" : git_transaction structure typ)
        "git_transaction"

    let git_transfer_progress =
      typedef
        (structure "git_transfer_progress" : git_transfer_progress structure typ)
        "git_transfer_progress"

    let git_annotated_commit =
      typedef
        (structure "git_annotated_commit" : git_annotated_commit structure typ)
        "git_annotated_commit"

    let git_merge_result =
      typedef
        (structure "git_merge_result" : git_merge_result structure typ)
        "git_merge_result"

    let git_status_list =
      typedef
        (structure "git_status_list" : git_status_list structure typ)
        "git_status_list"

    let git_rebase =
      typedef
        (structure "git_rebase" : git_rebase structure typ)
        "git_rebase"

    let git_refspec =
      typedef
        (structure "git_refspec" : git_refspec structure typ)
        "git_refspec"

    let git_remote =
      typedef
        (structure "git_remote" : git_remote structure typ)
        "git_remote"

    let git_transport =
      typedef
        (structure "git_transport" : git_transport structure typ)
        "git_transport"

    let git_push =
      typedef
        (structure "git_push" : git_push structure typ)
        "git_push"

    let git_remote_head =
      typedef
        (structure "git_remote_head" : git_remote_head structure typ)
        "git_remote_head"

    let git_remote_callbacks =
      typedef
        (structure "git_remote_callbacks" : git_remote_callbacks structure typ)
        "git_remote_callbacks"

    let git_transfer_progress =
      typedef
        (structure "git_transfer_progress" : git_transfer_progress structure typ)
        "git_transfer_progress"

    let git_transfer_progress_cb =
      (ptr git_transfer_progress @-> ptr void @-> returning int)

    let git_transport_message_cb =
      (string @-> int @-> ptr void @-> returning int)

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

module Blame = struct
    type git_blame_options
    type git_blame_hunk
    type git_blame

    let git_blame_flag_t = typedef int64_t "git_blame_flag_t"

    let git_blame_options =
      typedef
        (structure "git_blame_options" : git_blame_options structure typ)
        "git_blame_options"

    let git_blame_hunk =
      typedef
        (structure "git_blame_hunk" : git_blame_hunk structure typ)
        "git_blame_hunk"

    let git_blame =
      typedef
        (structure "git_blame" : git_blame structure typ)
        "git_blame"

    let git_blame_init_options =
      foreign
        "git_blame_init_options"
        (ptr git_blame_options @-> uint @-> returning int)

    let git_blame_get_hunk_count =
      foreign
        "git_blame_get_hunk_count"
        (ptr git_blame @-> returning uint32_t)

    let git_blame_get_hunk_byindex =
      foreign
        "git_blame_get_hunk_byindex"
        (ptr git_blame @-> uint32_t @-> returning (ptr git_blame_hunk))

    let git_blame_get_hunk_byline =
      foreign
        "git_blame_get_hunk_byline"
        (ptr git_blame @-> uint32_t @-> returning (ptr git_blame_hunk))

    let git_blame_file =
      foreign
        "git_blame_file"
        (ptr (ptr git_blame) @->
           ptr Types.git_repository @->
             string @->
               ptr git_blame_options @-> returning int)

    let git_blame_buffer =
      foreign
        "git_blame_buffer"
        (ptr (ptr git_blame) @->
           ptr git_blame @->
             string @->
               size_t @-> returning int)

    let git_blame_free =
      foreign
        "git_blame_free"
        (ptr git_blame @-> returning void)
  end

module Indexer = struct

  end
module Checkout = struct

  end
module Remote = struct
    let git_remote_rename_problem_cb =
      string @-> ptr void @-> returning int

  end
module Transport = struct

  end
module Repository = struct

    type git_repository_init_options

    let git_repository_open_flag_t = typedef int64_t "git_repository_open_flag_t"
    let git_repository_init_flag_t = typedef int64_t "git_repository_init_flag_t"
    let git_repository_init_mode_t = typedef int64_t "git_repository_init_mode_t"
    let git_repository_state_t = typedef int64_t "git_repository_state_t"

    let git_repository_fetchhead_foreach_cb =
      string @-> string @-> string @-> uint @-> ptr void @-> returning int

    let git_repository_mergehead_foreach_cb =
      string @-> ptr void @-> returning int

    let git_repository_init_options =
      typedef
        (structure "git_repository_init_options" :
           git_repository_init_options structure typ)
        "git_repository_init_options"

    let git_repository_open =
      foreign
        "git_repository_open"
        (ptr (ptr Types.git_repository) @-> string @-> returning int)

    let git_repository_wrap_odb =
      foreign
        "git_repository_wrap_odb"
        (ptr (ptr Types.git_repository) @-> ptr Types.git_odb @-> returning int)

    let git_repository_discover =
      foreign
        "git_repository_discover"
        (ptr Buffer.git_buf @-> string @-> int @-> string_opt @-> returning int)

    let git_repository_open_ext =
      foreign
        "git_repository_open_ext"
        ((ptr_opt (ptr Types.git_repository)) @->
           string @-> int @-> string_opt @-> returning int)

    let git_repository_open_bare =
      foreign
        "git_repository_open_bare"
        (ptr (ptr Types.git_repository) @-> string @-> returning int)

    let git_repository_free =
      foreign
        "git_repository_free"
        (ptr Types.git_repository @-> returning void)

    let git_repository_init =
      foreign
        "git_repository_init"
        (ptr (ptr Types.git_repository) @-> string @-> uint @-> returning int)

    let git_repository_init_init_options =
      foreign
        "git_repository_init_init_options"
        (ptr git_repository_init_options @-> uint @-> returning int)

    let git_repository_init_ext =
      foreign
        "git_repository_init_ext"
        (ptr (ptr Types.git_repository) @->
           string @-> ptr git_repository_init_options @-> returning int)

    let git_repository_head =
      foreign
        "git_repository_head"
        (ptr (ptr Types.git_reference) @-> ptr Types.git_repository @-> returning int)

    let git_repository_head_detached =
      foreign
        "git_repository_head"
        (ptr Types.git_repository @-> returning int)

    let git_repository_head_unborn =
      foreign
        "git_repository_head_unborn"
        (ptr Types.git_repository @-> returning int)

    let git_repository_is_empty =
      foreign
        "git_repository_is_empty"
        (ptr Types.git_repository @-> returning int)

    let git_repository_path =
      foreign
        "git_repository_path"
        (ptr Types.git_repository @-> returning string)

    let git_repository_workdir =
      foreign
        "git_repository_workdir"
        (ptr Types.git_repository @-> returning string)

    let git_repository_set_workdir =
      foreign
        "git_repository_set_workdir"
        (ptr Types.git_repository @-> string @-> int @-> returning int)

    let git_repository_is_bare =
      foreign
        "git_repository_is_bare"
        (ptr Types.git_repository @-> returning int)

    let git_repository_config =
      foreign
        "git_repository_config"
        (ptr (ptr Types.git_config) @-> ptr Types.git_repository @-> returning int)

    let git_repository_config_snapshot =
      foreign
        "git_repository_config_snapshot"
        (ptr (ptr Types.git_config) @-> ptr Types.git_repository @-> returning int)

    let git_repository_odb =
      foreign
        "git_repository_odb"
        (ptr (ptr Types.git_odb) @-> ptr Types.git_repository @-> returning int)

    let git_repository_refdb =
      foreign
        "git_repository_refdb"
        (ptr (ptr Types.git_index) @-> ptr Types.git_repository @-> returning int)

    let git_repository_index =
      foreign
        "git_repository_index"
        (ptr (ptr Types.git_index) @-> ptr Types.git_repository @-> returning int)

    let git_repository_message =
      foreign
        "git_repository_message"
        (ptr Buffer.git_buf @-> ptr Types.git_repository @-> returning int)

    let git_repository_message_remove =
      foreign
        "git_repository_message_remove"
        (ptr Types.git_repository @-> returning int)

    let git_repository_state_cleanup =
      foreign
        "git_repository_state_cleanup"
        (ptr Types.git_repository @-> returning int)

    let git_repository_fetchhead_foreach =
      foreign
        "git_repository_fetchhead_foreach"
        (ptr Types.git_repository @->
           funptr git_repository_fetchhead_foreach_cb @->
             ptr void @-> returning int)

    let git_repository_mergehead_foreach =
      foreign
        "git_repository_mergehead_foreach"
        (ptr Types.git_repository @->
           funptr git_repository_mergehead_foreach_cb @->
             ptr void @-> returning int)

    let git_repository_hashfile =
      foreign
        "git_repository_hashfile"
        (ptr Oid.git_oid @->
           ptr Types.git_repository @->
             string @->
               Types.git_otype @->
                 string @-> returning int)

    let git_repository_set_head =
      foreign
        "git_repository_set_head"
        (ptr Types.git_repository @-> string @-> returning int)

    let git_repository_set_head_detached =
      foreign
        "git_repository_set_head_detached"
        (ptr Types.git_repository @-> ptr Oid.git_oid @-> returning int)

    let git_repository_set_head_detached_from_annotated =
      foreign
        "git_repository_set_head_detached_from_annotated"
        (ptr Types.git_repository @->
           ptr Types.git_annotated_commit @->
             returning int)

    let git_repository_detach_head =
      foreign
        "git_repository_detach_head"
        (ptr Types.git_repository @-> returning int)

    let git_repository_state =
      foreign
        "git_repository_state"
        (ptr Types.git_repository @-> returning int)

    let git_repository_set_namespace =
      foreign
        "git_repository_set_namespace"
        (ptr Types.git_repository @-> string @-> returning int)

    let git_repository_get_namespace =
      foreign
        "git_repository_get_namespace"
        (ptr Types.git_repository @-> returning string)

    let git_repository_is_shallow =
      foreign
        "git_repository_is_shallow"
        (ptr Types.git_repository @-> returning int)

    let git_repository_ident =
      foreign
        "git_repository_ident"
        (ptr string @-> ptr string @-> ptr Types.git_repository @-> returning int)

    let git_repository_set_ident =
      foreign
        "git_repository_set_ident"
        (ptr Types.git_repository @-> string @-> string @-> returning int)

  end

module Annotated_commit = struct

    let git_annotated_commit_from_ref =
      foreign
        "git_annotated_commit_from_ref"
        (ptr (ptr Types.git_annotated_commit) @->
           ptr Types.git_repository @->
             ptr Types.git_reference @-> returning int)

    let git_annotated_commit_from_fetchhead =
      foreign
        "git_annotated_commit_from_fetchhead"
        (ptr (ptr Types.git_annotated_commit) @->
           ptr Types.git_repository @->
             string @->
               string @->
                 ptr Oid.git_oid @-> returning int)

    let git_annotated_commit_lookup =
      foreign
        "git_annotated_commit_lookup"
        (ptr (ptr Types.git_annotated_commit) @->
           ptr Types.git_repository @->
             ptr Oid.git_oid @-> returning int)

    let git_annotated_commit_from_revspec =
      foreign
        "git_annotated_commit_from_revspec"
        (ptr (ptr Types.git_annotated_commit) @->
           ptr Types.git_repository @->
             string @-> returning int)

    let git_annotated_commit_id =
      foreign
        "git_annotated_commit_id"
        (ptr Types.git_annotated_commit @-> returning (ptr Oid.git_oid))

    let git_annotated_commit_free =
      foreign
        "git_annotated_commit_free"
        (ptr Types.git_annotated_commit @-> returning void)
  end

module Clone = struct
    type git_clone_options

    let git_remote_create_cb =
      (ptr @@ ptr Types.git_remote) @->
        ptr Types.git_repository @->
          string @->
            string @->
              ptr void @-> returning int

    let git_repository_create_cb =
      (ptr (ptr Types.git_repository) @->
         string @-> int @-> ptr void @-> returning int)

    let git_clone_options =
      typedef
        (structure "git_clone_options" : git_clone_options structure typ)
        "git_clone_options"

    let git_clone_init_options =
      foreign
        "git_clone_init_options"
        (ptr git_clone_options @-> int64_t @-> returning int)

    let git_clone =
      foreign
        "git_clone"
        (ptr (ptr Types.git_repository) @->
           string @->
             string @->
               ptr git_clone_options @-> returning int)
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
module Blob = struct

    let git_blob_chunk_cb =
      string @-> size_t @-> ptr void @-> returning int

    let git_blob_lookup =
      foreign
        "git_blob_lookup"
        (ptr (ptr Types.git_blob) @->
           ptr Types.git_repository @->
             ptr Oid.git_oid @-> returning int)

    let git_blob_lookup_prefix =
      foreign
        "git_blob_lookup_prefix"
        (ptr (ptr Types.git_blob) @->
           ptr Types.git_repository @->
             ptr Oid.git_oid @->
               size_t @->
                 returning int)

    let git_blob_free =
      foreign
        "git_blob_free"
        (ptr Types.git_blob @-> returning void)

    let git_blob_id =
      foreign
        "git_blob_id"
        (ptr Types.git_blob @-> returning (ptr Oid.git_oid))

    let git_blob_owner =
      foreign
        "git_blob_owner"
        (ptr Types.git_blob @-> returning (ptr Types.git_repository))

    let git_blob_rawcontent =
      foreign
        "git_blob_rawcontent"
        (ptr Types.git_blob @-> returning (ptr void))

    let git_blob_rawsize =
      foreign
        "git_blob_rawsize"
        (ptr Types.git_blob @-> returning Types.git_off_t)

    let git_blob_filtered_content =
      foreign
        "git_blob_filtered_content"
        (ptr Buffer.git_buf @->
           ptr Types.git_blob @->
             string @->
               int @-> returning int)

    let git_blob_create_fromworkdir =
      foreign
        "git_blob_create_fromworkdir"
        (ptr Oid.git_oid @-> ptr Types.git_repository @-> string @-> returning int)

    let git_blob_create_fromdisk =
      foreign
        "git_blob_create_fromdisk"
        (ptr Oid.git_oid @-> ptr Types.git_repository @-> string @-> returning int)

    let git_blob_create_fromchunks =
      foreign
        "git_blob_create_fromchunks"
        (ptr Oid.git_oid @->
           ptr Types.git_repository @->
             string @->
               funptr git_blob_chunk_cb @->
                 ptr void @-> returning int)

    let git_blob_create_frombuffer =
      foreign
        "git_blob_create_frombuffer"
        (ptr Oid.git_oid @->
           ptr Types.git_repository @->
             ptr void @->
               size_t @-> returning int)

    let git_blob_is_binary =
      foreign
        "git_blob_is_binary"
        (ptr Types.git_blob @-> returning int)
  end

module Global = struct

    let git_libgit2_init =
      foreign
        "git_libgit2_init"
        (void @-> returning int)

    let git_libgit2_shutdown =
      foreign
        "git_libgit2_shutdown"
        (void @-> returning int)
  end

module Commit = struct

    let git_commit_lookup =
      foreign
        "git_commit_lookup"
        (ptr (ptr Types.git_commit) @->
           ptr Types.git_repository @->
             ptr Oid.git_oid @->
               returning int)

    let git_commit_lookup_prefix =
      foreign
        "git_commit_lookup_prefix"
        (ptr (ptr Types.git_commit) @->
           ptr Types.git_repository @->
             ptr Oid.git_oid @->
               size_t @->
                 returning int)

    let git_commit_id =
      foreign
        "git_commit_id"
        (ptr Types.git_commit @-> returning (ptr Oid.git_oid))

    let git_commit_owner =
      foreign
        "git_commit_owner"
        (ptr Types.git_commit @-> returning (ptr Types.git_repository))

    let git_commit_message_encoding =
      foreign
        "git_commit_message_encoding"
        (ptr Types.git_commit @-> returning string_opt)

    let git_commit_message =
      foreign
        "git_commit_message"
        (ptr Types.git_commit @-> returning string)

    let git_commit_message_raw =
      foreign
        "git_commit_message_raw"
        (ptr Types.git_commit @-> returning string)

    let git_commit_summary =
      foreign
        "git_commit_summary"
        (ptr Types.git_commit @-> returning string_opt)

    let git_commit_time =
      foreign
        "git_commit_time"
        (ptr Types.git_commit @-> returning Types.git_time_t)

    let git_commit_time_offset =
      foreign
        "git_commit_time_offset"
        (ptr Types.git_commit @-> returning int)

    let git_commit_committer =
      foreign
        "git_commit_committer"
        (ptr Types.git_commit @-> returning (ptr Types.git_signature))

    let git_commit_author =
      foreign
        "git_commit_author"
        (ptr Types.git_commit @-> returning (ptr Types.git_signature))

    let git_commit_raw_header =
      foreign
        "git_commit_raw_header"
        (ptr Types.git_commit @-> returning string)

    let git_commit_tree =
      foreign
        "git_commit_tree"
        (ptr (ptr Types.git_tree) @-> ptr Types.git_commit @-> returning int)

    let git_commit_tree_id =
      foreign
        "git_commit_tree_id"
        (ptr Types.git_commit @-> returning (ptr Oid.git_oid))

    let git_commit_parentcount =
      foreign
        "git_commit_parentcount"
        (ptr Types.git_commit @-> returning uint)

    let git_commit_parent =
      foreign
        "git_commit_parent"
        (ptr (ptr Types.git_commit) @->
           ptr Types.git_commit @->
             uint @->
               returning int)

    let git_commit_parent_id =
      foreign
        "git_commit_parent_id"
        (ptr Types.git_commit @-> uint @-> returning (ptr Oid.git_oid))

    let git_commit_nth_gen_ancestor =
      foreign
        "git_commit_nth_gen_ancestor"
        (ptr (ptr Types.git_commit) @->
           ptr Types.git_commit @->
             uint @->
               returning int)

    let git_commit_create =
      foreign
        "git_commit_create"
        (ptr Oid.git_oid @->
           ptr Types.git_repository @->
             string @->
               ptr Types.git_signature @->
                 ptr Types.git_signature @->
                   string @->
                     string @->
                       ptr Types.git_tree @->
                         size_t @->
                           ptr (ptr Types.git_commit) @->
                             returning int)

    let git_commit_amend =
      foreign
        "git_commit_amend"
        (ptr Oid.git_oid @->
           ptr Types.git_commit @->
             string @->
               ptr_opt Types.git_signature @->
                 ptr_opt Types.git_signature @->
                   string_opt @->
                     string_opt @->
                       ptr_opt Types.git_tree @->
                         returning int)

  end

(** Now the helpers *)
module Results = struct

    type ('error_code, 'payload) t =
      | Git_error of 'error_code
      | Git_payload of 'payload

    let return x =
      Git_payload x

    let (>>=) x f =
      match x with
      | Git_error _ as x -> x
      | Git_payload x -> f x

    let of_int code =
      match code with
      | -1 -> Git_error ("Generic Error", code)
      | -3 ->  Git_error ("Requested object could not be found", code)
      | -4 ->   Git_error ("Object exists preventing operation", code)
      | -5 ->  Git_error ("More than one object matches", code)
      | -6 ->  Git_error ("Output buffer too short to hold data", code)
      | -7 ->
         Git_error
           ("GIT_EUSER is a special error that is never generated by libgit2\
             You can return it from a callback (e.g to stop an iteration)\
             to know that it was generated by the callback and \
             not by libgit2.", code)
      | -8 ->  Git_error ("Operation not allowed on bare repository", code)
      | -9 ->  Git_error ("HEAD refers to branch with no commits", code)
      | -10 ->  Git_error ("Merge in progress prevented operation", code)
      | -11 ->  Git_error ("Reference was not fast-forwardable", code)
      | -12 ->  Git_error ("Name/ref spec was not in a valid format", code)
      | -13 ->  Git_error ("Merge conflicts prevented operation", code)
      | -14 ->  Git_error ("Lock file prevented operation", code)
      | -15 ->  Git_error ("Reference value does not match expected", code)
      | -16 ->  Git_error ("Authentication error", code)
      | -17 ->  Git_error ("Server certificate is invalid", code)
      | -18 ->  Git_error ("Patch/merge has already been applied", code)
      | -19 ->  Git_error ("The requested peel operation is not possible", code)
      | -20 ->  Git_error ("Unexpected EOF", code)
      | -30 ->  Git_error ("Internal only", code)
      | -31 ->  Git_error ("Signals end of iteration with iterator", code)
      | _ -> Git_payload ()

    let result = fun code -> of_int code >>= fun _ -> Git_payload ()

  end

open Results

type commit = {oid: Oid.git_oid ptr;
               encoding: String.t;
               message: String.t;
               summary: String.t;
               time: Types.git_time_t;
               offset_in_min : int;
               committer_name:String.t;
               committer_email:String.t;
               author_name: String.t;
               author_email:String.t;
               header : String.t;
               tree_id : Oid.git_oid ptr}

let init () =
  Global.git_libgit2_init () |> result

let shutdown () =
  Global.git_libgit2_shutdown () |> result

let init_repo ?(is_bare=true) ?init_options ~repo_path:repo_path =
  let a_repo = allocate_n ~count:1 (ptr Types.git_repository) in
  (match init_options with
   | None ->
      Repository.git_repository_init
        a_repo
        repo_path
        (if not is_bare
         then Unsigned.UInt.of_int 1
         else Unsigned.UInt.of_int 0)
   | Some git_options ->
      Repository.git_repository_init_ext a_repo repo_path git_options) |>
    result

let git_library_version () =
  let major = allocate_n ~count:1 int in
  let minor = allocate_n ~count:1 int in
  let rev = allocate_n ~count:1 int in
  Common.git_libgit2_version major minor rev;
  Printf.sprintf "%d.%d.%d" (!@ major) (!@ minor) (!@ rev)

let clone_simple ?path ~repo_url:url =
  let a_repo = allocate_n ~count:1 (ptr Types.git_repository) in
  Clone.git_clone a_repo url |>
    fun curried ->
    curried
      (match path with
       | Some p -> p
       | None -> Filename.current_dir_name ^
                   (Uri.of_string url |> Uri.path |> Filename.dirname)) |>
      fun curried ->
      curried (from_voidp Clone.git_clone_options null) |> result

let find_repo path =
  let root = make Buffer.git_buf in
  Repository.git_repository_discover (addr root) path 0 None |>
    of_int >>= fun _ ->
  let result = getf root Buffer.ptr_ in
  let length = getf root Buffer.size_ |> Unsigned.Size_t.to_int in
  Git_payload (string_from_ptr result length)

let is_a_repo path =
  Repository.git_repository_open_ext None path 0 None |> result

(* let commit_info a_repo an_oid = *)

