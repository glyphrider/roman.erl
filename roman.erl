-module(roman).
-include_lib("eunit/include/eunit.hrl").
-export([to/1]).

to(N) -> to_roman(N,"").

to_roman(N,S) when N >= 1000 -> to_roman(N-1000,string:concat(S,"M"));
to_roman(N,S) when N >= 900 -> to_roman(N-900,string:concat(S,"CM"));
to_roman(N,S) when N >= 500 -> to_roman(N-500,string:concat(S,"D"));
to_roman(N,S) when N >= 400 -> to_roman(N-400,string:concat(S,"CD"));
to_roman(N,S) when N >= 100 -> to_roman(N-100,string:concat(S,"C"));
to_roman(N,S) when N >= 90 -> to_roman(N-90,string:concat(S,"XC"));
to_roman(N,S) when N >= 50 -> to_roman(N-50,string:concat(S,"L"));
to_roman(N,S) when N >= 40 -> to_roman(N-40,string:concat(S,"XL"));
to_roman(N,S) when N >= 10 -> to_roman(N-10,string:concat(S,"X"));
to_roman(N,S) when N >= 9 -> to_roman(N-9,string:concat(S,"IX"));
to_roman(N,S) when N >= 5 -> to_roman(N-5,string:concat(S,"V"));
to_roman(N,S) when N >= 4 -> to_roman(N-4,string:concat(S,"IV"));
to_roman(N,S) when N >= 1 -> to_roman(N-1,string:concat(S,"I"));
to_roman(0,S) -> S.

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
