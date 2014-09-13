;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |24|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; to multiply the numbers in the given list

(require rackunit)
(require "extras.rkt")

;; A ListOfNumber is one of
;; - empty
;; - (cons Number ListOfNumber)
;; ListOfNumber-fn : ListOfNumber -> ??
;; (cond[(empty? ListOfNumber) ... ]
;;      [(else (first ListOfNumber) (ListOfNumber-fn (rest ListOfNumber))....])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; non-empty-list-helper : ListOfNumber -> Number
;; RETURNS : the multiplication of the numbers in the given list
;; WHERE : the given list is not empty
;; Examples: 
;; (non-empty-list-helper (list 5 9 3 10)) = 1350
;; (non-empty-list-helper (list 1.1 -2 3 4.0) = -26.4
;; (non-empty-list-helper (list 1.1 0 3 4.0) = 0

(define (non-empty-list-helper lst)
  (cond [(empty? lst) 1]
        [else (* (first lst) (non-empty-list-helper (rest lst)))]))

;; Tests:
(check-equal? (non-empty-list-helper (list 5 9 3 10)) 1350)
(check-equal? (non-empty-list-helper (list 1.1 -2 3 4.0)) -26.4)
(check-equal? (non-empty-list-helper (list 1.1 0 3 4.0)) 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; multiply-list : ListOfNumber -> Number
;; RETURNS : 0 if the list is empty, 
;; else returns the product of the numbers in the given list.
;; Examples: 
;; (multiply-list empty) = 0
;; (multiply-list (list 5 9 3 10)) = 1350
;; (multiply-list (list 1.1 -2 3 4.0) = -26.4
   
(define (multiply-list lst)
  (cond [(empty? lst) 0]
        [else (non-empty-list-helper lst)]))

;; Tests :

(check-equal? (multiply-list empty) 0)
(check-equal? (multiply-list (list 5 9 3 10)) 1350) 
(check-equal? (multiply-list (list 1.1 -2 3 4.0)) -26.4)


