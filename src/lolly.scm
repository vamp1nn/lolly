;;; this file is the public guile module entry point for the lolly library.
(define-module (lolly)
	#:export (lolly-read-grammar lolly-grammar-file lolly-build lolly-parser
						lolly-parse lolly-generate lolly-main)
	#:declarative? #f)
(if (file-exists? "src/lolly-core.scm")
	(primitive-load "src/lolly-core.scm")
	(primitive-load "lolly-core.scm"))
