;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; to draw circles at the given points

(require 2htdp/image)
(require rackunit)
(require "extras.rkt")
(define SCENE (empty-scene 300 300))
(define CIRCLE (circle 10 "solid" 'blue))

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




;; point->x : Point -> Number
;; GIVEN : a Point p
;; RETURNS : the value of "x"  attribute of the Point
;; Examples :
;; (point->x (make-point 125 150)) -> 125
;; (point->x (make-point -45 93))  -> -45 
;; Strategy : structural decomposition on point

(define (point->x point)
  (point-x point))

;; Tests :
(check-equal? (point->x (make-point 125 150)) 125)
(check-equal? (point->x (make-point -45 93)) -45)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; point->y : ListOfPoint -> Number
;; GIVEN : a Point p
;; RETURNS : the value of "x"  attribute of the Point
;; Examples :
;; (point->y (make-point 125 150)) -> 150
;; (point->y (make-point -45 93))  -> 93 
;; Strategy : structural decomposition on point

(define (point->y point)
  (point-y point))

;; Tests :
(check-equal? (point->y (make-point 125 150)) 150)
(check-equal? (point->y (make-point -45 93)) 93)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; circles : ListOfPoint -> Image
;; GIVEN : a scene S and list of points
;; RETURNS : a scene S with circles of radius 10 at the given points in the list
;; Examples :
;; (circles (list (make-point 55 100) (make-point 94 65) (make-point 125 150)))
;;              (place-image CIRCLE 55 100 
;;                           (place-image CIRCLE 94 65
;;                                 (place-image CIRCLE 125 150 SCENE)))) 
;; Strategy : Function composition

(define (circles LoP)
  (cond [(empty? LoP) SCENE]
        [else (place-image CIRCLE (point->x (first LoP)) (point->y (first LoP)) 
                           (circles (rest LoP)))]))

;; Tests :
(check-equal? (circles (list (make-point 55 100) (make-point 94 65) (make-point 125 150)))
              (place-image CIRCLE 55 100 
                           (place-image CIRCLE 94 65
                                 (place-image CIRCLE 125 150 SCENE))))         


