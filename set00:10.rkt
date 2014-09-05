;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; sum of two large numbers

; sum : Number Number Number -> Number
; GIVEN: three numbers
; RETURNS: the sum of the two larger numbers.
; Examples:
; (sum 8 1 10)      =>  18
; (sum 5.1 6 2.3)   =>  11.1
; (sum -12 11 -6)   =>  5
; Strategy : Domain knowledge.

(define (sum a b c)
  (if (> a b) 
      (if (> b c) (+ a b) (+ a c))
      (if (> a c) (+ a b) (+ b c))))

; Tests :

(check-expect (sum 8 1 10) 18)
(check-expect (sum 5.1 6 2.3) 11.1)
(check-expect (sum -12 11 -6) 5)
 