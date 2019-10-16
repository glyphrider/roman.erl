# Roman Numeral Conversion

To compile the erlang code into a beam file

	erlc roman.erl

or

	erl
	1> c(roman).

then

	2> roman:to(1234).


To run unit tests (eunit):

	erlc -DTEST roman.erl
	erl -s roman verbose_testing -s init stop

Todo: See about an Emakefile.
