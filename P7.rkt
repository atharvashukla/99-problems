#lang racket

#|
Flatten a nested list structure.
Transform a list, possibly holding lists as elements into a `flat' list by
replacing each list with its elements (recursively).

Example:
* (my-flatten '(a (b (c d) e)))
(A B C D E)
|#


; Sexp is one of:
; - symbol
; - [List-of Sexp]


; Sexp -> [List-of Symbol]
; flatten an sexp into a list
(define (my-flatten sexp)
  (match sexp
    [(or (? symbol?) '()) sexp]
    [_ (let* ([ff (my-flatten (first sexp))]
              [fr (my-flatten (rest sexp))])
         (if (list? ff) (append ff fr) (cons ff fr)))]))

(module+ test
  (require rackunit)
  (check-equal? (my-flatten '(a (b (c d) e))) '(a b c d e)))