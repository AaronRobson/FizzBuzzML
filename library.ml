let fizzbuzz n =
  let s = (if (n mod 3) = 0 then "Fizz" else "") ^ (if (n mod 5) = 0 then "Buzz" else "") in
  if s = "" then string_of_int n
            else s;;
