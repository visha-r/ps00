;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |31|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require rackunit)
(require "extras.rkt")

;; circle-image : ListOfPosReal -> ListOfImage
;; GIVEN : a list of positive Numbers
;; RETURNS : a list of Images, 
;; where each image is a circle that has a radius 
;; based on a number in the input list
;; Examples :
;; (circle-image (list 4.2 9 15.1 25)) =
;; (cons (circle 4.2 "solid" 'blue)
;;      (cons (circle 9 "solid" 'blue)
;;            (cons (circle 15.1 "solid" 'blue)
;;                  (cons (circle 25 "solid" 'blue) empty))))
;; Startegy : Function composition


(define (circle-image LoN)
  (cond [(empty? LoN) empty]
        [else (cons (circle (first LoN) "solid" 'blue) 
                    (circle-image (rest LoN)))]))


;; Tests :

(check-equal? (circle-image (list 4.2 9 15.1 25))
              (cons (circle 4.2 "solid" 'blue)
                    (cons (circle 9 "solid" 'blue)
                          (cons (circle 15.1 "solid" 'blue)
                                (cons (circle 25 "solid" 'blue) empty)))))