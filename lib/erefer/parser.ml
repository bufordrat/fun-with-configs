let x = 5

module Files = struct
  let spinup = Prelude.readfile "lib/examples/spinup.refer"
  let attc = Prelude.readfile "lib/examples/attc.refer"
  let ccl = Prelude.readfile "lib/examples/example.ccl"
end
include Files

let parse configstr =
  let open Prelude in
  let open Etude.Result.Make (struct
               type t = int * string
             end) in
  Refer.Seq.of_string configstr
  |> Seq.to_list
  |> List.map (Result.map snd)
  |> sequence
