-module(roman).
-include_lib("eunit/include/eunit.hrl").
-export([to/1]).
-export([from/1]).

to(N) -> to_roman(N,"").
from(S) -> from_roman(S,0).

to_roman(N,S) when N >= 1000 -> to_roman(N-1000,S ++ "M");
to_roman(N,S) when N >= 900 -> to_roman(N-900,S ++ "CM");
to_roman(N,S) when N >= 500 -> to_roman(N-500,S ++ "D");
to_roman(N,S) when N >= 400 -> to_roman(N-400,S ++ "CD");
to_roman(N,S) when N >= 100 -> to_roman(N-100,S ++ "C");
to_roman(N,S) when N >= 90 -> to_roman(N-90,S ++ "XC");
to_roman(N,S) when N >= 50 -> to_roman(N-50,S ++ "L");
to_roman(N,S) when N >= 40 -> to_roman(N-40,S ++ "XL");
to_roman(N,S) when N >= 10 -> to_roman(N-10,S ++ "X");
to_roman(N,S) when N >= 9 -> to_roman(N-9,S ++ "IX");
to_roman(N,S) when N >= 5 -> to_roman(N-5,S ++ "V");
to_roman(N,S) when N >= 4 -> to_roman(N-4,S ++ "IV");
to_roman(N,S) when N >= 1 -> to_roman(N-1,S ++ "I");
to_roman(0,S) -> S.

from_roman("M" ++ S,N) -> from_roman(S,N+1000);
from_roman("CM" ++ S,N) -> from_roman(S,N+900);
from_roman("D" ++ S,N) -> from_roman(S,N+500);
from_roman("CD" ++ S,N) -> from_roman(S,N+400);
from_roman("C" ++ S,N) -> from_roman(S,N+100);
from_roman("XC" ++ S,N) -> from_roman(S,N+90);
from_roman("L" ++ S,N) -> from_roman(S,N+50);
from_roman("XL" ++ S,N) -> from_roman(S,N+40);
from_roman("X" ++ S,N) -> from_roman(S,N+10);
from_roman("IX" ++ S,N) -> from_roman(S,N+9);
from_roman("V" ++ S,N) -> from_roman(S,N+5);
from_roman("IV" ++ S,N) -> from_roman(S,N+4);
from_roman("I" ++ S,N) -> from_roman(S,N+1);
from_roman("",N) -> N.

roman_one_test() -> "I" = to(1).
roman_two_test() -> "II" = to(2).
roman_three_test() -> "III" = to(3).
roman_four_test() -> "IV" = to(4).
roman_five_test() -> "V" = to(5).
roman_six_test() -> "VI" = to(6).
roman_nine_test() -> "IX" = to(9).
roman_ten_test() -> "X" = to(10).
roman_sixteen_test() -> "XVI" = to(16).
roman_nineteen_test() -> "XIX" = to(19).
roman_twenty_eight_test() -> "XXVIII" = to(28).
roman_forty_test() -> "XL" = to(40).
roman_fifty_test() -> "L" = to(50).
roman_ninety_test() -> "XC" = to(90).
romman_hundred_test() -> "C" = to(100).
roman_five_hundred_test() -> "D" = to(500).
roman_four_hundred_test() -> "CD" = to(400).
roman_thousand_test() -> "M" = to(1000).
roman_nine_hundred_test() -> "CM" = to(900).
roman_nineteen_sixty_eight_test() -> "MCMLXVIII" = to(1968).

roman_from_one_test() -> 1 = from("I").
roman_from_two_test() -> 2 = from("II").
roman_from_three_test() -> 3 = from("III").
roman_from_four_test() -> 4 = from("IV").
roman_from_five_test() -> 5 = from("V").
roman_from_nine_test() -> 9 = from("IX").
roman_from_ten_test() -> 10 = from("X").
roman_from_eighteen_test() ->
    18 = from("XVIII").
