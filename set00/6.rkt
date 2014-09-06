;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; to find the root of a quadratic equation

; quadratic-root : Number Number Number -> Number
; GIVEN: the values a, b & c of the quadratic equation
; RETURNS: one of the root values.
; Examples:
; (quadratic-equation 1 -3 -4)  => 4
; (quadratic-equation 1 0 -4)   => 2
; (quadratic-equation 1 4 -12)  => 2
; Strategy : Domain knowledge

(define (quadratic-equation a b c)
  (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a)))

; Tests:

(check-expect (quadratic-equation 1 -3 -4) 4)
(check-expect (quadratic-equation 1 0 -4) 2)
(check-expect (quadratic-equation 1 4 -12) 2)