let rec fold ~init:acc ~f = function
  | [] -> acc
  | head :: tail -> fold ~init:(f acc head) ~f tail

let length l = fold ~init:0 ~f:(fun acc _ -> acc + 1) l
(* helper function append_to *)
let append_to tail head = (head::tail)
let reverse l = fold ~init:[] ~f:append_to l

let map ~f:mapper list =
  reverse(fold ~init:[] ~f:(fun acc y -> ((mapper y) :: acc)) list)

let filter ~f:pred list =
  reverse (fold ~init:[] ~f:(fun acc y -> if (pred y) then (y :: acc) else acc) list)

let rec _append la lb = match la with
  | [ ] -> lb
  | (head :: tail) -> _append tail (head :: lb)
                        
let append a b = _append (reverse a) b
    (* alternative implementation *)
    (* fold ~init:lb ~f:append_to (reverse la) *)

let concat = function
  | [] -> []
  | list_of_lists -> fold ~init:[] ~f:append list_of_lists
