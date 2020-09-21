-module(roman_tests).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-export([verbose_testing/0]).
-endif.
-ifdef(EUNIT).

-define(TEST_CASES,[
                    {0, ""},
		    {1, "I"},
		    {2, "II"},
		    {3, "III"},
		    {4, "IV"},
		    {5, "V"},
		    {6, "VI"},
		    {7, "VII"},
		    {8, "VIII"},
		    {9, "IX"},
		    {10, "X"},
		    {11, "XI"},
		    {14, "XIV"},
		    {15, "XV"},
		    {16, "XVI"},
		    {19, "XIX"},
		    {20, "XX"},
		    {21, "XXI"},
		    {39, "XXXIX"},
		    {40, "XL"},
		    {41, "XLI"},
		    {42, "XLII"},
		    {43, "XLIII"},
		    {44, "XLIV"},
		    {45, "XLV"},
		    {46, "XLVI"},
		    {47, "XLVII"},
		    {48, "XLVIII"},
		    {49, "XLIX"},
		    {50, "L"},
		    {89, "LXXXIX"},
		    {90, "XC"},
		    {91, "XCI"},
		    {99, "XCIX"},
		    {100, "C"},
		    {101, "CI"},
		    {200, "CC"},
		    {399, "CCCXCIX"},
		    {400, "CD"},
		    {401, "CDI"},
		    {499, "CDXCIX"},
		    {500, "D"},
		    {501, "DI"},
		    {899, "DCCCXCIX"},
		    {900, "CM"},
		    {999, "CMXCIX"},
		    {1000, "M"},
		    {1001, "MI"},
		    {1968, "MCMLXVIII"}
		   ]).

roman_to_arabic_test_() ->
    {"Roman to Arabic",
     lists:map(fun({A,R}) ->
		       {lists:flatten([R," to ",integer_to_list(A)]),
			?_assertEqual(A,roman:from(R))}
	       end,
	       ?TEST_CASES)}.

arabic_to_roman_test_() ->
    {"Arabic to Roman",
     lists:map(fun({A,R}) ->
		       {lists:flatten([integer_to_list(A)," to ",R]),
			?_assertEqual(R,roman:to(A))}
	       end,
	       ?TEST_CASES)}.

verbose_testing() ->
    eunit:test(?MODULE,[verbose]).

-endif.
