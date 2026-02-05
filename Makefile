.PHONY: check generate inspect clean

check:
	guile --no-auto-compile tests/smoke.scm
	guile --no-auto-compile -c '(load "src/lolly.scm")'

generate:
	mkdir -p build
	guile --no-auto-compile bin/lolly examples/json.scm build/json-parser.scm
	guile --no-auto-compile bin/lolly examples/mini-language.scm build/mini-language-parser.scm

inspect:
	guile --no-auto-compile bin/lolly --inspect examples/json.scm

clean:
	rm -f build/*
