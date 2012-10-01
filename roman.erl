-module(roman).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.
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

-ifdef(EUNIT).
to_roman_one_test() -> "I" = to(1).
to_roman_two_test() -> "II" = to(2).
to_roman_three_test() -> "III" = to(3).
to_roman_four_test() -> "IV" = to(4).
to_roman_five_test() -> "V" = to(5).
to_roman_six_test() -> "VI" = to(6).
to_roman_nine_test() -> "IX" = to(9).
to_roman_ten_test() -> "X" = to(10).
to_roman_sixteen_test() -> "XVI" = to(16).
to_roman_nineteen_test() -> "XIX" = to(19).
to_roman_twenty_eight_test() -> "XXVIII" = to(28).
to_roman_forty_test() -> "XL" = to(40).
to_roman_fifty_test() -> "L" = to(50).
to_roman_ninety_test() -> "XC" = to(90).
to_roman_hundred_test() -> "C" = to(100).
to_roman_five_hundred_test() -> "D" = to(500).
to_roman_four_hundred_test() -> "CD" = to(400).
to_roman_thousand_test() -> "M" = to(1000).
to_roman_nine_hundred_test() -> "CM" = to(900).
to_roman_nineteen_sixty_eight_test() -> "MCMLXVIII" = to(1968).

from_roman_one_test() -> 1 = from("I").
from_roman_two_test() -> 2 = from("II").
from_roman_three_test() -> 3 = from("III").
from_roman_four_test() -> 4 = from("IV").
from_roman_five_test() -> 5 = from("V").
from_roman_six_test() -> 6 = from("VI").
from_roman_nine_test() -> 9 = from("IX").
from_roman_ten_test() -> 10 = from("X").
from_roman_sixteen_test() -> 16 = from("XVI").
from_roman_nineteen_test() -> 19 = from("XIX").
from_roman_twenty_eight_test() -> 28 = from("XXVIII").
from_roman_forty_test() -> 40 = from("XL").
from_roman_fifty_test() -> 50 = from("L").
from_roman_ninety_test() -> 90 = from("XC").
from_roman_hundred_test() -> 100 = from("C").
from_roman_five_hundred_test() -> 500 = from("D").
from_roman_four_hundred_test() -> 400 = from("CD").
from_roman_thousand_test() -> 1000 = from("M").
from_roman_nine_hundred_test() -> 900 = from("CM").
from_roman_nineteen_sixty_eight_test() -> 1968 = from("MCMLXVIII").
-endif.
