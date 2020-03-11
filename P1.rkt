#lang racket

#|
Find the last box of a list.
Example:
* (my-last '(a b c d))
(D)
|#



; [X] [NEListof X] -> X
(define (my-last l)
  (match l
    [(cons e '()) l]
    [(cons fst rst) (my-last rst)]))


(module+ test
  (require rackunit)
  (check-equal? (my-last '(1)) '(1))
  (check-equal? (my-last '(1 2 3)) '(3)))