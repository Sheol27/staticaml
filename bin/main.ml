open Staticaml.Statistics

let possible_values = [1.0; 2.0; 3.0; 4.0; 5.0; 6.0]

let probability = cumulative_distribution_function 2.0 possible_values

let () = Staticaml.Utils.print_probability probability
