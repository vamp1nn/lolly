 thenthen merges equivalent LR(0) cores before producing action and goto tables for a shift and reduce parser runtime. srammars are written as scheme data and semantic actions can construct an AST or return domain values. lexing stays outside the generator so applications can provide their own tokeniser and source location model

## example

Uue the library directly from scheme:

```scheme
(load "src/lolly.scm")
(define parser (lolly-parser (lolly-grammar-file "examples/arithmetic.scm")))
(lolly-parse parser
  (list (cons 'NUMBER 2)
        (cons 'PLUS #f)
        (cons 'NUMBER 3)))
```

## todos

- add conflict diagnostics w/ state and production information
- add parser error locations and expected token reporting
- improve grammar validation for undefined and unreachable symbols
- add a documented lexer interface w/ source span support
- split the impl into a proper scheme module
- expand regression coverage for JSON and the mini language
- add canonical LR(1) and LALR(1) table inspection commands
