-module(roman).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-export([verbose_testing/0]).
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

-define(TEST_CASES,[
		    {"I",1},
		    {"II",2},
		    {"III",3},
		    {"IV",4},
		    {"V",5},
		    {"VI",6},
		    {"IX",9},
		    {"X",10},
		    {"XVI",16},
		    {"XIX",19},
		    {"XXVIII",28},
		    {"XL",40},
		    {"L",50},
		    {"XC",90},
		    {"C",100},
		    {"D",500},
		    {"CD",400},
		    {"M",1000},
		    {"CM",900},
		    {"MCMLXVIII",1968},
		    {"LXIX",69}
		   ]).

roman_to_arabic_test_() ->
    {"Roman to Arabic",
    lists:map(fun({R,A}) ->
		      {lists:flatten([R," to ",integer_to_list(A)]),
		       ?_assertEqual(A,from(R))}
	      end,
	      ?TEST_CASES)}.

arabic_to_roman_test_() ->
    {"Arabic to Roman",
     lists:map(fun({R,A}) ->
		       {lists:flatten([integer_to_list(A)," to ",R]),
			?_assertEqual(R,to(A))}
	       end,
	       ?TEST_CASES)}.

verbose_testing() ->
    eunit:test(?MODULE,[verbose]).

-endif.
