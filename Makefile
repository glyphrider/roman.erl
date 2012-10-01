BEAMS=roman.beam
ERLC_FLAGS=-DTEST

test : $(BEAMS)
	erl -noinput -run roman test -s init stop

clean :
	rm -f $(BEAMS)

%.beam : %.erl
	erlc $(ERLC_FLAGS) $^
