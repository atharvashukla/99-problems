#lang racket

#|
Find the number of elements of a list.
|#

; [X] [List-of X] -> Natural
(define (list-len l)
  (if (empty? l) 0 (add1 (list-len (rest l)))))


(module+ test
  (require rackunit)
  (check-equal? (list-len '()) 0)
  (check-equal? (list-len '(1 2 3)) 3))