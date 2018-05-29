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
	erl -s roman test -s init stop

See `Jenkinsfile` for modern build formulae. Reference at [Using a Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/).

Todo: See about an Emakefile.
