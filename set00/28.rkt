;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; combined-text : ListOfStr -> String
;; GIVEN : a list of strings
;; RETURNS : the concatenated string with spaces in between.
;; Examples :
;; (combined-text (list "visha" "studies" "at" "Northeastern"))  
;; (string-append "visha " "studies " "at " "Northeastern ")
;; Startegy : Function composition

(define (combined-text list)
  (cond [(empty? list) ""]
        [else (string-append (first list) " " (combined-text (rest list)))]))

;; Tests :
(check-equal? (combined-text (list "visha" "studies" "at" "Northeastern")) 
              (string-append "visha " "studies " "at " "Northeastern "))  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; sublist-image : ListOfString -> Image
;; GIVEN : a list of strings
;; RETURNS : the image of the combined text of the strings in the list.
;; Examples :
;; (list-image (list "visha" "studies")) = (text (string-append "visha" "studies") SIZE COLOR)
;; (list-image (list "at" "northeastern")) = (text (string-append "at" "northeastern") SIZE COLOR)
;; Strategy : Function composition

(define (sublist-image sub-list)
  (cond [(empty? sub-list) empty-image]
        [else (text (combined-text sub-list) SIZE COLOR)]))

;; Tests :
(check-equal? (sublist-image (list "visha" "studies")) 
              (text (string-append "visha " "studies ") SIZE COLOR)) 
(check-equal? (sublist-image (list "at" "northeastern")) 
              (text (string-append "at " "northeastern ") SIZE 'purple))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; list-image : ListOfListOfString -> Image
;; GIVEN : a list of list of strings
;; RETURNS : the image of the combined text of the strings in the list in the list.
;; Examples :
;;(list-image (list (list "visha" "studies")
;;                                (list "at" "Northeastern")
;;                                (list "which" "is" "located")
;;                                (list "at" "Huntington" "Ave."))) =
;;              (beside (text (string-append "visha " "studies") SIZE COLOR)
;;                      (text (string-append "at " "Northeastern") SIZE COLOR)
;;                      (text (string-append "which " "is " "located ") SIZE COLOR)
;;                      (text (string-append "at " "Huntington " "Ave. ") SIZE COLOR))
;; Startegy : Function composition

(define (list-image main-list)
  (cond [(empty? main-list) empty-image]
        [else (beside (sublist-image (first main-list)) 
                      (list-image (rest main-list)))]))


;; Tests :

(check-equal? (list-image (list (list "visha" "studies")
                                (list "at" "Northeastern")
                                (list "which" "is" "located")
                                (list "at" "Huntington" "Ave.")))
              (beside (text (string-append "visha " "studies ") SIZE COLOR)
                      (text (string-append "at " "Northeastern ") SIZE COLOR)
                      (text (string-append "which " "is " "located ") SIZE COLOR)
                      (text (string-append "at " "Huntington " "Ave. ") SIZE COLOR)))


