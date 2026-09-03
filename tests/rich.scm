;;; these checks cover the source-aware token contract and the larger grammars.
(load "../src/lolly-core.scm")
(load "../src/lolly-lexer.scm")

(define (check name expected actual)
  (if (equal? expected actual)
      (display (string-append "ok: " name "\n"))
      (error "failed check" name expected actual)))

(define json-parser (lolly-parser (lolly-grammar-file "examples/json.scm")))
(check "json array"
       '(array ((number 7)))
       (lolly-parse json-parser
                    (list (cons 'LBRACKET #f)
                          (cons 'NUMBER 7)
                          (cons 'RBRACKET #f))))

(define mini-parser (lolly-parser (lolly-grammar-file "examples/mini-language.scm")))
(check "mini language declaration"
       '(program ((let "answer" (number 42))))
       (lolly-parse mini-parser
                    (list (cons 'LET #f)
                          (cons 'ID "answer")
                          (cons 'ASSIGN #f)
                          (cons 'NUMBER 42)
                          (cons 'SEMICOLON #f))))

(define span (lolly-source-span "demo.lol" 3 5 3 7))
(define lexeme (lolly-lexeme 'NUMBER 42 span))
(check "source span" span (lolly-lexeme-span lexeme))
(check "lexer adapter" '((NUMBER . 42))
       (lolly-parser-tokens (list lexeme)))

(define ambiguous-parser (lolly-parser (lolly-grammar-file "examples/reduce-reduce.scm")))
(define (has-conflict-kind? kind records)
  (if (null? records) #f
      (or (eq? kind (cdr (lolly-assoc 'kind (car records))))
          (has-conflict-kind? kind (cdr records)))))
(check "reduce reduce provenance" #t
       (has-conflict-kind? 'reduce-reduce (lolly-conflicts ambiguous-parser)))

(display "all rich checks passed\n")
