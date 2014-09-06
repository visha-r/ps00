;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; to calculate the square.

; sq : Number -> Number
; RETURNS: the square of the given number.
; Examples:
; (sq 10)    => 100
; (sq 12.4)  => 153.76
; (sq -5)    => 25
; (sq -7.5)  => 30.25
; Strategy : Domain knowledge

(define (sq num)
  (sqr num))

; Tests:
(check-expect (sq 10) 100)
(check-expect (sq 12.4) 153.76)
(check-expect (sq -5) 25)
(check-expect (sq -7.5) 56.25)