#lang racket

#|
Find out whether a list is a palindrome.
A palindrome can be read forward or backward; e.g. (x a m a x).
|#

; [X] [List-of X] -> Boolean
; is `l` a palindrome?
(define (is-palindrome? l)
  (or (empty? l) (empty? (rest l))
      (and (equal? (first l) (my-last l))
           (is-palindrome? (my-remove-last (rest l))))))

; [X] [NEList-of X] -> X
; last element of nel
(define (my-last nel)
  (match nel
    [(list e) e]
    [(cons f r) (my-last r)]))

; [X] [NEList-of X] -> [List-of X]
; removes the last element of l
(define (my-remove-last l)
  (match l
    [(list e) '()]
    [(cons f r) (my-remove-last r)]))

(module+ test
  (require rackunit)
  (check-equal? (is-palindrome? '()) true)
  (check-equal? (is-palindrome? '(1)) true)
  (check-equal? (is-palindrome? '(1 2)) false)
  (check-equal? (is-palindrome? '(2 1)) false)
  (check-equal? (is-palindrome? '(1 2 1)) true)
  (check-equal? (is-palindrome? '(1 2 2 1)) true)
  (check-equal? (is-palindrome? '(1 1 1 1)) true)
  (check-equal? (is-palindrome? '(2 1 1 2)) true)
  (check-equal? (is-palindrome? '(2 1 3 1 2)) true)
  (check-equal? (is-palindrome? '(2 1 3 3 1 2)) true))