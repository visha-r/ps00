;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 27a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require rackunit)
(require "extras.rkt")

(define SIZE 16)
(define COLOR 'magenta)


;; A ListOfStr is one of
;; - empty
;; - (cons String ListOfStr)
;; Interpretation :
;; an element of ListOfStr is a random string
;; ListOfStr-fn : ListOfStr -> ??
;; (cond[(empty? ListOfStr) ... ]
;;      [(else (first ListOfStr) (ListOfStr-fn (rest ListOfStr))....])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; draw-string : String -> Image
;; GIVEN : a text
;; RETURNS : the image of the text with a space at the end.
;; Examples :
;; (draw-string "visha") = (text " visha" 16 'magenta)
;; (draw-string "birthday") = (text " birthday" 16 'magenta)
;; Strategy : Function composition

(define (draw-string str)
  (text (string-append " " str) 16 'magenta))

;; Tests :
(check-equal? (draw-string "visha") (text " visha" 16 'magenta))
(check-equal? (draw-string "birthday") (text " birthday" 16 'magenta))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; string-image : ListOfStr -> Image
;; GIVEN : a list of strings
;; RETURNS : the image of the combined text of the strings in the list.
;; Examples :
;; (string-image (list "visha" "studies" "in" "Northeastern")) =
;;              (beside (text " visha " 16 'magenta)
;;                      (text "studies " 16 'magenta)
;;                      (text "in " 16 'magenta)
;;                      (text "Northeastern " 16 'magenta)))
;; (string-image (list  "A" "very" "happy" "birthday"))
;;              (beside (text " A " 16 'magenta)
;;                      (text "very " 16 'magenta)
;;                      (text "happy " 16 'magenta)
;;                      (text "birthday " 16 'magenta)))
;; Strategy : Function composition

(define (string-image list)
  (cond [(empty? list) (draw-string "")]
        [else (beside (draw-string (first list)) (string-image (rest list)))]))

;; Tests :
(check-equal? (string-image (list "visha" "studies" "in" "Northeastern"))
              (beside (text " visha " 16 'magenta)
                      (text "studies " 16 'magenta)
                      (text "in " 16 'magenta)
                      (text "Northeastern " 16 'magenta)))
(check-equal? (string-image (list  "A" "very" "happy" "birthday"))
              (beside (text " A " 16 'magenta)
                      (text "very " 16 'magenta)
                      (text "happy " 16 'magenta)
                      (text "birthday " 16 'magenta)))



