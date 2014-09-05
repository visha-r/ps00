;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; to compute the circumference of a circle

; circumference : Number -> Number
; GIVEN: the radius r of a circle 
; RETURNS: its circumference, using the formula 2 * pi * r.
; Examples:
; (circumference 1)  =>  6.283185307179586 
; (circumference 0)  =>  0
; (circumference -2) =>  -12.566370614359172
; (circumference 7)  =>  43.982297150257104

(define (circumference r)
  (* 2 pi r))


; Tests :

(check-within (circumference 1) 6.28 0.1)
(check-expect (circumference 0) 0)
(check-within (circumference -2) -12.57 0.1)
(check-within (circumference 7) 43.99 0.1)
