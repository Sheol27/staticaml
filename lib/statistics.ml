let evaluate_probability values conditions =
  let verify value =
    List.for_all (fun condition -> condition value) conditions
  in
  let results = List.map verify values in
  float_of_int (Utils.count_true results) /. float_of_int (List.length values)
