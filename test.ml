open OUnit

let suite =
  "FizzBuzz Test Suite" >::: [
    "Nominal Case" >:: (fun _ ->
      let result = Library.fizzbuzz 1 in
      assert_equal result "1"
    );

    "Fizz Case" >:: (fun _ ->
      let result = Library.fizzbuzz 3 in
      assert_equal result "Fizz"
    );

    "Buzz Case" >:: (fun _ ->
      let result = Library.fizzbuzz 5 in
      assert_equal result "Buzz"
    );

    "FizzBuzz Case" >:: (fun _ ->
      let result = Library.fizzbuzz 15 in
      assert_equal result "FizzBuzz"
    );
  ]

let _ = run_test_tt_main suite
