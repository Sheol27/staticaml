let evaluate_probability values conditions =
  let verify value =
    List.for_all (fun condition -> condition value) conditions
  in
  let results = List.map verify values in
  float_of_int (Utils.count_true results) /. float_of_int (List.length values)

let[@tail_mod_cons] rec cumulative_distribution_function target values =
  match target with
  | 0 ->
      0.
  | _ ->
      let is_equal_to_x = Utils.is_equal_to target in
      let probability = evaluate_probability values [is_equal_to_x] in
      probability +. cumulative_distribution_function (target - 1) values
