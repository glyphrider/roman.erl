-module(roman).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-export([to/1,from/1,verbose_testing/0]).
-else.
-export([to/1,from/1]).
-endif.

-define(XLATE,
	lists:reverse([
		       {1,"I"},
		       {4,"IV"},
		       {5,"V"},
		       {9,"IX"},
		       {10,"X"},
		       {40,"XL"},
		       {50,"L"},
		       {90,"XC"},
		       {100,"C"},
		       {400,"CD"},
		       {500,"D"},
		       {900,"CM"},
		       {1000,"M"}
		      ])).
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
to_basecase_test() ->
    ?assertEqual(result,to(0,result,unknown)).

from_basecase_test() ->
    ?assertEqual(number,from("",number,unknown)).

verbose_testing() ->
    eunit:test(?MODULE,[verbose,{report,{eunit_surefire,[{dir,"."}]}}]).
-endif.
