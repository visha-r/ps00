;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |19|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; to draw rectangles with the given dimensions.

(require 2htdp/image)
(require rackunit)
(require "extras.rkt") 


;; height : PosReal PosReal -> PosReal
;; Given : the width w and the proportion p
;; Returns : the height of the rectangle
;; using the formula height =  w * p
;; Examples :
;; (height 1 3)       => 3
;; (height 12 0.5)    => 6
;; (height 25 4)      => 100
;; Strategy : Function composition

(define (height w p)
  (* w p))

;; Tests :

(check-equal? (height 1 3) 3)
(check-equal? (height 12 0.5) 6)
(check-equal? (height 25 4) 100)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; rel-rec-sequence: PosReal PosReal -> Image
;; GIVEN: two numbers, the width and the proportion of width
;; RETURNS: a solid blue rectangle, with the given width and 
;; height calculated using the formula, (height = width * proportion)
;; Examples:
;; (rel-rec-sequence 4 2)     => (rectangle 4 8 "solid" 'blue)
;; (rel-rec-sequence 50 1.5)   => (rectangle 50 75 "solid" 'blue)
;; (rel-rec-sequence 10.5 2)  => (rectangle 10.5 21 "solid" 'blue)

(define (rel-rec-sequence width proportion)
  (rectangle width (height width proportion) "solid" 'blue))

;; Tests:
(check-equal? (rel-rec-sequence 4 2) (rectangle 4 8 "solid" 'blue)) 
(check-equal? (rel-rec-sequence 50 1.5) (rectangle 50 75 "solid" 'blue))
(check-equal? (rel-rec-sequence 10.5 2) (rectangle 10.5 21 "solid" 'blue)) 