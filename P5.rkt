#lang racket

#|
Reverse a list.
|#


(define (my-append l1 l2)
  (match l1
    ['() '()]
    [(cons f r) (cons f (my-append r l2))]))

(define (my-reverse l)
  (match l
    ['() '()]
    [(cons f r) (my-append (my-reverse r) (list f))]))


(module+ test
  (require rackunit)
  (check-equal? (reverse '()) '())
  (check-equal? (reverse '(1 2 3)) '(3 2 1)))