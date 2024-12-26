open Staticaml.Statistics

let possible_values = [1; 2; 3; 4; 5; 6]

let probability = cumulative_distribution_function 2 possible_values

let () = Staticaml.Utils.print_probability probability
