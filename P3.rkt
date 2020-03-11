#lang racket

#|
Find the K'th element of a list.
The first element in the list is number 1.
Example:
* (element-at '(a b c d e) 3)
C
|#


; [X] [List-of X] Number -> Number
; ASSUME: (>= (length l) k) AND (> k 0)
(define (element-at l k)
  (cond
    [(= k 1) (first l)]
    [else (element-at (rest l) (sub1 k))]))

(module+ test
  (require rackunit)
  (check-equal? (element-at '(a b c d e) 3) 'c))
