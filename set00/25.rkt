;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |25|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)
(require "extras.rkt")

;; check-list-true : ListOfBoolean -> Boolean
;; RETURNS : true if all booleans in the given list are true.
;; Examples: 
;; (check-list-true (list)) = true
;; (check-list-true (list true false)) = false
;; (check-list-true (list true true true)) = true
;; (check-list-true (list false) = false

(define (check-list-true lst)
  (cond [(empty? lst) true]
        [else (and (first lst) (check-list-true (rest lst)))]))
  
;; Tests:
(check-equal? (check-list-true (list)) true)
(check-equal? (check-list-true (list true false)) false)
(check-equal? (check-list-true (list true true true)) true)
(check-equal? (check-list-true (list false)) false)

