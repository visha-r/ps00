;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; to compute the area of a circle

; circle-area : Number -> Number
; GIVEN: the radius r of a circle 
; RETURNS: its area, using the formula pi * r * r.
; Examples:
; (circle-area 1)  =>  3.141592653589793
; (circle-area 3)  =>  28.274333882308138
; (circle-area 5)  =>  78.53981633974483

(define (circle-area r)
  (* pi r r))

; Tests :

(check-within (circle-area 1) 3.14 0.1)
(check-within (circle-area 3) 28.27 0.1)
(check-within (circle-area 5) 78.54 0.1)