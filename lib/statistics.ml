let evaluate_probability (values : float list) (conditions : (float -> bool) list) : float =
  let verify value = List.for_all (fun condition -> condition value) conditions in
  let results = List.map verify values in
  float_of_int (Utils.count_true results) /. float_of_int (List.length values)

let cumulative_distribution_function (target : float) (values : float list) =
  let[@tail_mod_cons] rec aux (target : float) (values : float list) (accumulator : float) =
    match target with
    | 0.0 ->
        accumulator
    | _ ->
        let is_equal_to_x = Utils.is_equal_to target in
        let probability = evaluate_probability values [is_equal_to_x] in
        aux (target -. 1.0) values (accumulator +. probability)
  in
  aux target values 0.0
