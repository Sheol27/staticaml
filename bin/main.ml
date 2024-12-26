open Staticaml.Statistics

let possible_values = [1; 2; 3; 4; 5; 6]

let is_even number = number mod 2 = 0

let is_equal_to value = value = 4

let conditions = [is_even; is_equal_to]

let probability = evaluate_probability possible_values conditions

let () = Staticaml.Utils.print_probability probability
