let is_question say =
  String.get say ((String.length say) - 1) == '?'

let is_shouting say =
  let up = String.uppercase say in
  (up = say) && (String.lowercase say <> up)

let is_empty say = say = ""
                           
let response_for say = let stripped_say = String.trim say in
                       match stripped_say with
                       | "" -> "Fine. Be that way!"
                       | said when (is_shouting said) -> "Whoa, chill out!"
                       | said when (is_question said) -> "Sure."
                       | _ -> "Whatever."

                                               
