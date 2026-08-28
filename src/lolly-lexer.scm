;;; this file defines a small source-aware token contract for host lexers.

(define (lolly-source-span file line column end-line end-column)
  (vector file line column end-line end-column))

(define (lolly-lexeme type value span)
  (vector type value span))

(define (lolly-lexeme-type lexeme)
  (vector-ref lexeme 0))

(define (lolly-lexeme-value lexeme)
  (vector-ref lexeme 1))

(define (lolly-lexeme-span lexeme)
  (vector-ref lexeme 2))

(define (lolly-parser-tokens lexemes)
  (map (lambda (lexeme)
         (cons (lolly-lexeme-type lexeme) (lolly-lexeme-value lexeme)))
       lexemes))
