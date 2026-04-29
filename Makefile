.PHONY: test clean

test:
	rebar3 eunit

clean:
	rebar3 clean
	rm -fv TEST-roman.xml
