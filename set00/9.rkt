;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; applying remainder functionality to find even numbers.

; even-num? : Integer -> Boolean 
; RETURNS: true if the given number is even, false otherwise.
; Examples:
; (even-num? 5)    =>  false
; (even-num? -24)  =>  true
; (even-num? -61)  =>  false  
; (even-num? 100)  =>  true 
; Strategy : Domain knowledge

(define (even-num? num)
  (cond [(= (remainder num 2) 0) true]
        [else false]))

; Tests:

(check-expect (even-num? 5) false)
(check-expect (even-num? -24) true)
(check-expect (even-num? -61) false)
(check-expect (even-num? 100) true)