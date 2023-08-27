#lang br/quicklang
; These are positional arguments we can name them whatever we like
(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '(handle ~a) src-lines))
  (define module-datum `(module stacker-mod "stacker.rkt" ,@src-datums))
  (datum->syntax #f module-datum))
; Racket has no explicit return statement. The return value of a function is just the last expression that appears in its body

; In Racket, all definitions are private by default. To make a definition public, we use provide:
(provide read-syntax)