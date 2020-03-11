#lang racket

#|
Find the last but one box of a list.
Example:
* (my-but-last '(a b c d))
(C D)
|#


; [X] [List-of X] -> X
; ASSUME: (>= (length l) 2)
(define (my-but-last l)
  (match l
    [(list a b) l]
    [(cons f r) (my-but-last r)]))


(module+ test
  (require rackunit)
  (check-equal? (my-but-last '(1 2)) '(1 2))
  (check-equal? (my-but-last '(1 2 3)) '(2 3))
  (check-equal? (my-but-last '(1 2 3 4)) '(3 4)))