-module(roman).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.
-export([to/1,from/1]).

-define(XLATE,lists:reverse([{1,"I"},{4,"IV"},{5,"V"},{9,"IX"},{10,"X"},{40,"XL"},{50,"L"},{90,"XC"},{100,"C"},{400,"CD"},{500,"D"},{900,"CM"},{1000,"M"}])).
-define(EMPTY,"").
-define(ZERO,0).

to(Number) ->
    to(Number,?EMPTY,?XLATE).
to(?ZERO,String,_) ->
    String;
to(Number,String,[{Arabic,Roman}|_Tail]=List) when Number >= Arabic ->
    to(Number-Arabic,String ++ Roman, List);
to(Number,String,[_Head|Tail]) ->
    to(Number,String,Tail). 

from(String) ->
    from(String,?ZERO,?XLATE).
from(?EMPTY,Number,_) ->
    Number;
from(String,Number,[{Arabic,Roman}|Tail]=List) ->
    case string:str(String,Roman) of
	1 -> from(string:substr(String,string:len(Roman)+1),Number+Arabic,List);
	_ -> from(String,Number,Tail)
    end.

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
