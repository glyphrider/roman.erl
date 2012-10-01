# Roman Numeral Conversion

To compile the erlang code into a beam file

	erlc roman.erl

or

	erl
	c(roman).

then

	roman:to(1234).


To run unit tests (eunit):

	erlc -DTEST roman.erl
	erl roman:test().
