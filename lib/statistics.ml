let evaluate_probability values conditions =
  let verify value =
    List.for_all (fun condition -> condition value) conditions
  in
  let results = List.map verify values in
  float_of_int (Utils.count_true results) /. float_of_int (List.length values)

let cumulative_distribution_function target values =
  let[@tail_mod_cons] rec cumulative_distribution_function' target values
      accumulator =
    match target with
    | 0 ->
        accumulator
    | _ ->
        let is_equal_to_x = Utils.is_equal_to target in
        let probability = evaluate_probability values [is_equal_to_x] in
        cumulative_distribution_function' (target - 1) values
          (accumulator +. probability)
  in
  cumulative_distribution_function' target values 0.0
