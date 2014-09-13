;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |30|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; reversing the booleans in the list
(require rackunit)
(require "extras.rkt")

;; A ListOfBoolean is one of
;; - empty
;; - (cons Boolean ListOfBoolean)
;; Interpretation :
;; an element of ListOfBoolean is a boolean
;; ListOfBoolean-fn : ListOfBoolean -> ??
;; (cond[(empty? ListOfBoolean) ... ]
;;      [(else (first ListOfBoolean) (ListOfBoolean-fn (rest ListOfBoolean))....])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; neg-list : ListOfBoolean -> ListOfBoolean
;; GIVEN : a list of booleans LoB
;; RETURNS : returns the list of booleans with each boolean reversed
;; Examples : 
;; (neg-list (list true false false true))= 
;; (cons false (cons true (cons true (cons false empty))))
;; (neg-list (list false false false false))= 
;; (cons true (cons true (cons true (cons true empty))))
;; Strategy : Function composition

(define (neg-list LoB)
  (cond [(empty? LoB) empty]
        [else (cons (not (first LoB)) (neg-list (rest LoB)))]))


;; Tests :

(check-equal? (neg-list (list true false false true))
              (cons false (cons true (cons true (cons false empty)))))
  
(check-equal? (neg-list (list false false false false))
              (cons true (cons true (cons true (cons true empty)))))                                               