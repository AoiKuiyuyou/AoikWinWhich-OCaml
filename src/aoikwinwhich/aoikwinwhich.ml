(**)
#load "str.cma";;

(**)
let rec list_uniq lst =
    match lst with
    | [] -> []
    | head::tail_s ->
        head :: (list_uniq (List.filter (fun x -> x <> head) tail_s))
;;

(**)
let string_endswith str tail =
    let str_len = String.length(str)  in
    let end_len = String.length(tail) in
    if str_len < end_len then
        false
    else (
        let str_tail = (String.sub str (str_len - end_len) end_len) in
            str_tail = tail
    )
;;

(**)
let find_exe_paths (prog) =
    (* 8f1kRCu *)
    let env_pathext = try Sys.getenv("PATHEXT") with Not_found -> ""
    in

    (* 4fpQ2RB *)
    if env_pathext = "" then (
        (* 9dqlPRg *)
        (* Return *)
        []
    )
    else (
        (* 6mPI0lg *)
        (* Split into a list of extensions *)
        let ext_s = (Str.split (Str.regexp ";") env_pathext)
        in

        (* 2pGJrMW *)
        (* Strip *)
        let ext_s = List.map (String.trim) ext_s
        in

        (* 2zdGM8W *)
        (* Convert to lowercase *)
        let ext_s = List.map (String.lowercase) ext_s
        in

        (* 2gqeHHl *)
        (* Remove empty.
        Must be done after the stripping at 2pGJrMW.
        *)
        let ext_s = List.filter (fun x -> x <> "") ext_s
        in

        (* 2fT8aRB *)
        (* Uniquify*)
        let ext_s = list_uniq(ext_s)
        in

        (* 4ysaQVN *)
        let env_path = try Sys.getenv("PATH") with Not_found -> ""
        in

        (**)
        let dir_path_s =
            (* 5gGwKZL *)
            if env_path = "" then (
                (* 7bVmOKe *)
                (* Go ahead with "dir_path_s" being empty *)
                []
            )
            else
                (* 6mPI0lg *)
                (* Split into a list of dir paths *)
                (Str.split (Str.regexp ";") env_path)
        in

        (* 5rT49zI*)
        (* Insert empty dir path to the beginning.

        Empty dir handles the case that "prog" is a path, either relative or
        absolute. See code 7rO7NIN.
        *)
        let dir_path_s = ("")::dir_path_s
        in

        (* 2klTv20 *)
        (* Uniquify *)
        let dir_path_s = list_uniq dir_path_s
        in

        (* Check if "prog" ends with one of the file extension in "ext_s"

        "ext_s" are all in lowercase, ensured at 2zdGM8W.
        *)
        let prog_has_ext =
            let prog_lc = String.lowercase(prog) in
                List.exists
                    (fun ext -> (string_endswith prog_lc ext)) ext_s in

        let exe_path_s = ref [] in

        (* 6bFwhbv *)
        let call_each item_s func = List.iter func item_s in

        begin
        call_each dir_path_s (fun dir_path ->
            (* 7rO7NIN *)
            (* Synthesize a path *)
            let path =
                if dir_path = "" then
                    prog
                else
                    String.concat "" [dir_path; "\\"; prog]
            in

            begin
            (* 6kZa5cq *)
            (* If "prog" ends with executable file extension *)
            if prog_has_ext then
                if Sys.file_exists(path) then
                    (* 2ffmxRF *)
                    exe_path_s := path :: !exe_path_s
            ;

            (* 2sJhhEV *)
            (* Assume user has omitted the file extension *)
            call_each ext_s (fun ext ->
                (* 6k9X6GP *)
                (* Synthesize a path with one of the file extensions in PATHEXT
                *)
                let path_2 = String.concat "" [path; ext]
                in

                (* 6kabzQg *)
                if Sys.file_exists(path_2) then
                    (* 7dui4cD *)
                    exe_path_s := path_2 :: !exe_path_s
                );
            end
        );

        (* 8swW6Av *)
        (* Uniquify *)
        exe_path_s := list_uniq !exe_path_s;

        (* Reverse, due to prepending at 2ffmxRF and 7dui4cD  *)
        exe_path_s := List.rev !exe_path_s;

        (* 7y3JlnS *)
        (* Return *)
        !exe_path_s
        end
    )
;;

(**)
let main () =
    (* 9mlJlKg *)
    (* If not exactly one command argument is given *)
    if Array.length Sys.argv <> 2 then (
        (* 7rOUXFo *)
        (* Print program usage *)
        let usage = "Usage: aoikwinwhich PROG

#/ PROG can be either name or path
aoikwinwhich notepad.exe
aoikwinwhich C:\\Windows\\notepad.exe

#/ PROG can be either absolute or relative
aoikwinwhich C:\\Windows\\notepad.exe
aoikwinwhich Windows\\notepad.exe

#/ PROG can be either with or without extension
aoikwinwhich notepad.exe
aoikwinwhich notepad
aoikwinwhich C:\\Windows\\notepad.exe
aoikwinwhich C:\\Windows\\notepad"
        in
            print_endline(usage);

        (* 3nqHnP7 *)
        (* Exit *)
        1
    )
    else (
        (* 9m5B08H *)
        (* Get executable name or path *)
        let prog = Sys.argv.(1) in

        (* 8ulvPXM *)
        (* Find executable paths *)
        let exe_path_s = find_exe_paths(prog) in

        (* 5fWrcaF *)
        (* If has found none *)
        if List.length(exe_path_s) = 0 then
            (* 3uswpx0 *)
            (* Exit *)
            2
        (* 5fWrcaF *)
        (* If has found none *)
        else (
            (* 9xPCWuS *)
            (* Print result *)
            print_endline(String.concat "\n" exe_path_s);

            (* 4s1yY1b *)
            (* Exit *)
            0
        )
    );
;;

(* 4zKrqsC *)
(* Program entry *)
let () =
    exit(main());
;;
