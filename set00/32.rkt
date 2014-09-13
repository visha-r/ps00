;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |32|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)
(require "extras.rkt")

(define-struct point (x y))
;; A Point is a
;; (make-point Number Number)
;; Interpretation :
;; x is the x-coordinate (from left in pixels)
;; y is the y-coordinate (from top in pixels)
;; point-fn : point -> ??
;; (... point-x point
;;      point-y point...)


;; A ListOfPoint is one of
;; - empty
;; - (cons Point ListOfPoint)
;; Interpretation :
;; an element of ListOfPoint is a
;; position (x,y) in the scene
;; ListOfPoint-fn : ListOfPoint -> ??
;; (cond[(empty? ListOfPoint) ... ]
;;      [(else (first ListOfPoint) (ListOfPoint-fn (rest ListOfPoint))....])



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; distance-helper : Point -> Number
;; GIVEN : a Point (x,y)
;; RETURNS : the distances of those Points from (0,0)
;; using the formula (x+y).
;; Examples :
;; (distance-helper (make-point 14 5)) = 19
;; (distance-helper (make-point -6 12)) = 6
;; (distance-helper (make-point 21 -15) = 6
;; Strategy : structural decomposition on p : Point

(define (distance-helper p)     
  (+ (point-x p) (point-y p)))

;; Tests :

(check-equal? (distance-helper (make-point 14 5)) 19)
(check-equal? (distance-helper (make-point -6 12)) 6)
(check-equal? (distance-helper (make-point 21 -15)) 6)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; distance-sum : ListOfPoint -> Number
;; GIVEN : a list of Points (x,y)
;; RETURNS : the sum of all distances of those Points from (0,0).
;; Examples :
;; (distance-sum (list (make-point 14 5)
;;                     (make-point -6 12)
;;                     (make-point 21 -15)
;;                     (make-point -16 -11))) = 
;; (+ (point-x (make-point 14 5)) (point-y (make-point 14 5))
;;    (point-x (make-point -6 12)) (point-y (make-point -6 12))
;;    (point-x (make-point 21 -15)) (point-y (make-point 21 -15))
;;    (point-x (make-point -16 -11)) (point-y (make-point -16 -11)))
;; Startegy : Function composition

(define (distance-sum LoP)
  (cond [(empty? LoP) 0]
        [else (+ (distance-helper (first LoP)) 
                 (distance-sum (rest LoP)))]))


;; Tests :

(check-equal? (distance-sum (list (make-point 14 5)
                                  (make-point -6 12)
                                  (make-point 21 -15)
                                  (make-point -16 -11))) 4)



