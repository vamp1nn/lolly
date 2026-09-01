# lolly

lolly is an LALR(1) parser generator that builds canonical LR(1) item sets then merges equivalent LR(0) cores before producing action and goto tables for a shift and reduce parser runtime

grammars use declarative data and semantic actions can construct an AST or return domain values while lexing remains outside the generator so applications can provide their own tokeniser and source location model

## examples

Use the library directly from the source tree

```scheme
(load "src/lolly.scm")
(define parser (lolly-parser (lolly-grammar-file "examples/arithmetic.scm")))
(lolly-parse parser
  (list (cons 'NUMBER 2)
        (cons 'PLUS #f)
        (cons 'NUMBER 3)))
```

Generate the larger recursive grammars with the command line interface

```sh
bin/lolly examples/json.scm build/json-parser.scm
bin/lolly examples/mini-language.scm build/mini-language-parser.scm
```

Run the regression checks with `make check`

## todos

- add conflict diagnostics with state and production information
- add parser error locations and expected token reporting
- improve grammar validation for undefined and unreachable symbols
- add a documented lexer interface with source span support
- split the implementation into a proper module
- expand regression coverage for JSON and the mini language
- add canonical LR(1) and LALR(1) table inspection commands
