;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |29|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require rackunit)
(require "extras.rkt")
(require "21.rkt")

(define person1 (make-person "Visha" "Vijay" 23 175.6 65))
(define person2 (make-person "Shre" "Advi" 29 115 54))
(define person3 (make-person "Malli" "Raj" 42 145.2 45.5))
(define person4 (make-person "Govi" "Peru" 26 210 78))

;; A Person is a
;; (make-person String String PosInt PosReal PosReal)
;; Interpretation :
;; first-name is the person's first name
;; last-name is the person's last name
;; age is the persons age (in years)
;; height is the person's height (in cm)
;; weight is the person's weight (in kg)

;; Template :
;; person-fn : Person -> Image
;; (define (person-image p)
;;  (...
;;  (person-first-name p)
;;  (person-last-name p)
;;  (person-age p)
;;  (person-height p)
;;  (person-weight p)...))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; A ListOfPerson is one of
;; - empty
;; - (cons Person ListOfPerson)
;; Interpretation :
;; an element of ListOfPerson is a Person
;; ListOfPerson-fn : ListOfPerson -> ??
;; (cond[(empty? ListOfPerson) ... ]
;;      [(else (first ListOfPerson) (ListOfPerson-fn (rest ListOfPerson))....])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; group-image : ListOfPerson -> Image
;; GIVEN : a list of Persons LoP
;; RETURNS : an image for each persons in the list
;; based on their height.
;; Examples :
;; (group-image (list (make-person "Visha" "Vijay" 23 175.6 65) 
;;                   (make-person "Shre" "Advi" 29 115 54) 
;;                   (make-person "Malli" "Raj" 42 145.2 45.5) 
;;                   (make-person "Govi" "Peru" 26 210 78))) =
;; (beside (person-image (make-person "Visha" "Vijay" 23 175.6 65))
;;        (person-image (make-person "Shre" "Advi" 29 115 54))
;;        (person-image (make-person "Malli" "Raj" 42 145.2 45.5))
;;        (person-image (make-person "Govi" "Peru" 26 210 78)))
;; Strategy : Function composition                 
                      

(define (group-image LoP)
  (cond [(empty? LoP) empty-image]
        [else (beside (person-image (first LoP)) (group-image (rest LoP)))]))


; Tests :

(check-equal? (group-image (list person1 person2 person3 person4))
(beside (person-image person1)
              (person-image person2)
              (person-image person3)
              (person-image person4)))
