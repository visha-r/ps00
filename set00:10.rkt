;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; sum of two large numbers

; sum-two-large : Number Number Number -> Number
; RETURNS: the sum of the two larger numbers.
; Examples:
; (sum-two-large 8 1 10)    =>  18
; (sum-two-large 47 41 0)   =>  88
; (sum-two-large 14 51 20)  =>  71

(define (sum-two-large a b c)
  (if (a>b? a b) 
      (if (b>c? b c) (sum-a&b a b) (sum-a&c a c))
      (if (a>c? a c) (sum-a&b a b) (sum-b&c b c))))

; Tests :

(check-expect (sum-two-large 8 1 10) 18)
(check-expect (sum-two-large 47 41 0) 88)
(check-expect (sum-two-large 14 51 20) 71)
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         
; check-a>b? : Number Number -> Number
; RETURNS: the larger of the given two numbers.
; Examples:
; (check-a>b? 5 8)   =>  8
; (check-a>b? 15 2)  =>  15                               

(define (a>b? a b)
  (> a b))

(define (a>c? a c)
  (> a c))

(define (b>c? b c)
  (> b c))

; Tests :

(check-expect (a>b? 7 10) false)
(check-expect (a>b? 27 1) true)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sum-a&b : Number Number -> Number
; RETURNS: the sum of the given two numbers.
; Examples:
; (sum-a&b 5 8)   =>  13
; (sum-a&b 15 2)  =>  17                               

(define (sum-a&b a b)
  (+ a b))

(define (sum-a&c a c)
  (+ a c))

(define (sum-b&c b c)
  (+ b c))

; Tests :

(check-expect (sum-a&b 7 10) 17)
(check-expect (sum-a&b 27 1) 28)
