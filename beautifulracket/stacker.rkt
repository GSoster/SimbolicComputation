#lang br/quicklang
; These are positional arguments we can name them whatever we like
(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '(handle ~a) src-lines))
  (define module-datum `(module stacker-mod "stacker.rkt"
                          ,@src-datums))
  (datum->syntax #f module-datum))
; Racket has no explicit return statement. The return value of a function is just the last expression that appears in its body

; In Racket, all definitions are private by default. To make a definition public, we use provide:
(provide read-syntax)

; prefix #'—to make code into a syntax object. It’s similar to the ' prefix we’ve already used that makes code into a datum.
(define-macro (stacker-module-begin HANDLE-EXPR ...)
  #'(#%module-begin
     HANDLE-EXPR ...
     (display (first stack)))); here we allow us to see the result of our operations
(provide (rename-out [stacker-module-begin #%module-begin]))
; provide exposes the macro to outside with the new name module-begin

(define stack empty)

; pop stack retrieves the first value and stores into arg. Then sets the value of stack to be the rest of the list (whithout first)
; finally returns the arg
(define (pop-stack!)
  (define arg (first stack))
  (set! stack (rest stack))
  arg)

(define (push-stack! arg)
  (set! stack (cons arg stack)))


; Handle accepts numbers or '+' or '*' as values.
; if it is '+' or '*' it will pop the stack and execute the operation, then add the result back to the stack
; if it is a number it will only add it to the stack
; Note that arg is defined with #f to make it an optional argument.
; so if no input or any input that is not a number, '+' or '*' will just be ignored since we don't have
; a cond for them.
(define (handle [arg #f])
  (cond
    [(number? arg) (push-stack! arg)]
    [(or (equal? + arg) (equal? * arg))
     (define op-result (arg (pop-stack!) (pop-stack!)))
     (push-stack! op-result)]))
(provide handle)

; using the br/quicklang definition of '+' and '*'
; to provide a binding for those identifiers
(provide + *)