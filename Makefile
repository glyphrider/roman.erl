SRC=src
TESTS=tests
EBIN=ebin
ERLC_FLAGS=-DTEST

MAIN_MODULE=roman

BEAMS=roman roman_tests

BEAMFILES=$(addprefix $(EBIN)/,$(addsuffix .beam,$(BEAMS)))

.PHONY : test
test : TEST-$(MAIN_MODULE).xml

TEST-$(MAIN_MODULE).xml : $(BEAMFILES)
	erl -pz $(EBIN) -noinput -run $(MAIN_MODULE) verbose_testing -s init stop

$(EBIN)/%.beam : $(SRC)/%.erl
	@mkdir -pv $(EBIN)
	erlc $(ERLC_FLAGS) -o $(EBIN) $<

clean :
	@rm -fv $(BEAMFILES)
	@rmdir -v $(EBIN)
	@rm -fv TEST-$(MAIN_MODULE).xml
