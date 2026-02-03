;;; these checks exercise the public api through a real grammar file
(load "../src/lolly-core.scm")

(define (check name expected actual)
  (if (equal? expected actual)
      (display (string-append "ok: " name "\n"))
      (error "failed check" name expected actual)))

(define parser (lolly-parser (lolly-grammar-file "examples/arithmetic.scm")))
(check "addition" 5
       (lolly-parse parser
                    (list (cons 'NUMBER 2) (cons 'PLUS #f) (cons 'NUMBER 3))))
(check "precedence" 14
       (lolly-parse parser
                    (list (cons 'NUMBER 2) (cons 'PLUS #f) (cons 'NUMBER 3)
                          (cons 'STAR #f) (cons 'NUMBER 4))))
(check "parentheses" 20
       (lolly-parse parser
                    (list (cons 'LPAREN #f) (cons 'NUMBER 2) (cons 'PLUS #f)
                          (cons 'NUMBER 3) (cons 'RPAREN #f) (cons 'STAR #f)
                          (cons 'NUMBER 4))))
(display "all smoke checks passed\n")
