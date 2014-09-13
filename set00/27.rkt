;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require rackunit)
(require "extras.rkt")

(define SIZE 16)
(define COLOR 'purple)


;; A ListOfStr is one of
;; - empty
;; - (cons String ListOfStr)
;; Interpretation :
;; an element of ListOfStr is a random string
;; ListOfStr-fn : ListOfStr -> ??
;; (cond[(empty? ListOfStr) ... ]
;;      [(else (first ListOfStr) (ListOfStr-fn (rest ListOfStr))....])



;; combined-string : ListOfStr -> String
;; GIVEN : a list of strings
;; RETURNS : the concatenated string with spaces in between.
;; Examples :
;; (combined-string (list "visha" "studies" "at" "Northeastern")) =
;; Visha studies in Northeastern
;; (combined-string (list "A" "very" "happy" "birthday")) =
;; A very happy birthday


(define (combined-string list)
  (cond [(empty? list) ""]
        [else (string-append (first list) " " (combined-string (rest list)))]))

;; Tests :
(check-equal? (combined-string (list "visha" "studies" "at" "Northeastern"))
              "visha studies at Northeastern ")
(check-equal? (combined-string (list "A" "very" "happy" "birthday"))
              "A very happy birthday ")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; string-image : ListOfStr -> Image
;; GIVEN : a list of strings
;; RETURNS : the image of the combined text of the strings in the list.
;; Examples :
;; (string-image (list "visha" "studies" "at" "Northeastern")) =
;; (text "visha studies at Northeastern " 16 'purple)
;; (string-image (list "A" "very" "happy" "birthday")) =
;;  (text "A very happy birthday " 16 'purple)

(define (string-image list)
  (cond [(empty? list) empty]
        [else (text (combined-string list) SIZE COLOR)]))

;; Tests :
(check-equal? (string-image (list "visha" "studies" "at" "Northeastern"))
              (text "visha studies at Northeastern " SIZE COLOR))
(check-equal? (string-image (list  "A" "very" "happy" "birthday"))
              (text "A very happy birthday " SIZE COLOR))

