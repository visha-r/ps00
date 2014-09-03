;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; to find the greatest of 3 numbers

; greatest-of-three : Number Number Number -> Number
; RETURNS: the greatest of the given three numbers.
; Examples:
; (greatest-of-three 8 1 10)    =>  10
; (greatest-of-three 47 41 0)   =>  47
; (greatest-of-three 14 51 20)  =>  51

(define (greatest-of-three a b c)
  (if (check-a>b? a b) 
      (if (check-a>c? a c) a c)
      (if (check-b>c? b c) b c)))
         
         
; check-a>b? : Number Number -> Number
; RETURNS: the greater of the given two numbers.
; Examples:
; (check-a>b? 5 8)   =>  8
; (check-a>b? 15 2)  =>  15                               

(define (check-a>b? a b)
  (> a b))

(define (check-a>c? a c)
  (> a c))

(define (check-b>c? b c)
  (> b c))


; Tests :

(check-expect (greatest-of-three 8 1 10) 10)
(check-expect (greatest-of-three 47 41 0) 47)
(check-expect (greatest-of-three 14 51 20) 51)