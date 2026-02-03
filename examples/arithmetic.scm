(grammar
  (start expression)
  (tokens NUMBER PLUS STAR LPAREN RPAREN)
  (precedence (left PLUS) (left STAR))
  (rules
    (expression (expression PLUS expression)
      action (lambda (left plus right) (+ left right)))
    (expression (expression STAR expression)
      action (lambda (left star right) (* left right)))
    (expression (LPAREN expression RPAREN)
      action (lambda (open value close) value))
    (expression (NUMBER))))
