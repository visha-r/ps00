;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; applying remainder functionality to find even numbers.

; is-even? : Integer -> Boolean
; GIVEN: a number 
; RETURNS: true if its divisible by 2, false otherwise.
; Examples:
; (is-even? 5)    =>  false
; (is-even? -24)   =>  true
; (is-even? -61)   =>  false  
; (is-even? 100)  =>  true 

(define (is-even? num)
  (cond [(= (remainder num 2) 0) true]
        [else false]))

; Tests:

(check-expect (is-even? 5) false)
(check-expect (is-even? -24) true)
(check-expect (is-even? -61) false)
(check-expect (is-even? 100) true)