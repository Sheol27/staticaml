let count_true bool_list =
  List.fold_left (fun acc b -> if b then acc + 1 else acc) 0 bool_list

let print_probability number =
  Printf.printf "\nProbability is: %.2f%%" (number *. 100.0)
