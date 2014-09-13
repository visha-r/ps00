;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 21a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "21.rkt")
(require 2htdp/image)
(require rackunit)
(require "extras.rkt")


(define person1 (make-person "Visha" "Vijay" 26 165 55))
(define person2 (make-person "Shreya" "Goshal" 45 130 40))

;; name-image : String String -> Image
;; GIVEN : the first and the last name of the person
;; RETURNS : the image of first and last name concatenated.
;; (name-image ("Visha" "Vijay"))  ->  
;; (text "Visha Vijay" 16 'blue))
;; (name-image ("Shreya" "Goshal"))  -> 
;; (text "Shreya Goshal" 16 'blue))
;; Strategy : Function composition

(define (name-image first last person)
  (text (string-append first " " last) 16 'blue))

;; Tests :

(check-equal? (name-image "Visha" "Vijay" person1)
              (text "Visha Vijay" 16 'blue))
(check-equal? (name-image "Shreya" "Goshal" person2)
              (text "Shreya Goshal" 16 'blue)) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; person-image-with-name : Person -> Image
;; GIVEN : a Person 
;; RETURNS : an Image that corresponds to the height of the person
;; with the first and last drawn under the image.
;; Examples :
;; (person-image-with-name person1) ->
;; (above (person-image person1)
;;       (text "Visha Vijay" 16 'blue))) 

;; (person-image-with-name person2) ->
;; (above (person-image person2)
;       (text "Shreya Goshal" 16 'blue)))
;; Design strategy : function composition
;; Strategy : Structural decomposition on person : Person

(define (person-image-with-name person)
  (above (person-image person) 
         (name-image (person-first-name person) (person-last-name person) person)))

;; Tests :

(check-equal? (person-image-with-name person1)
              (above (person-image person1)
                     (text "Visha Vijay" 16 'blue))) 
(check-equal? (person-image-with-name person2)
              (above (person-image person2)
                     (text "Shreya Goshal" 16 'blue)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  