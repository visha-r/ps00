;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; writing the contracts for point function.

(define-struct point (x y))

;; make-point : Number Number -> Point
;; point?     : Point -> Boolean
;; point-x    : Point -> Number
;; point-y    : Point -> Number