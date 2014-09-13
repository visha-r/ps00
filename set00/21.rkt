;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |21|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; to assemble a human shape using the image functions.

(require 2htdp/image)
(require rackunit)
(require "extras.rkt")

(define MODE "solid")
(define COLOR 'brown)
(define LEFT-FOOT-X1 0)
(define LEFT-HAND (line -30 40 COLOR))
(define RIGHT-HAND (line 30 40 COLOR))


(define-struct person (first-name last-name age height weight))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; defining the persons for test cases
(define person1 (make-person "Visha" "Vijay" 26 165 55))
(define person2 (make-person "Shreya" "Goshal" 45 130 40))

;; providing the methods to make them available for the files that extend this

(provide person-image 
         make-person
         person-first-name
         person-last-name)
         

;; radius : PosReal -> PosReal
;; GIVEN : the height h of the person (in cm)
;; RETURNS : the radius of the circle (in cm) to draw the head 
;; using the formula, radius = h * 0.1.
;; Examples :
;; (radius 165) -> 16.5
;; (radius 130) -> 13
;; Design strategy : Function composition

(define (radius h)
  (* h 0.1))

;; Tests :
(check-equal? (radius 165) 16.5)
(check-equal? (radius 130) 13)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; head : Person -> Image
;; GIVEN : a Person p
;; RETURNS : a circle which looks a person's head 
;; which is proportion to the person's height 
;; WHERE : circle radius = 0.1 * person's height.
;; Examples :
;; (head person1)   -> (circle 16.5 MODE COLOR)
;; (head person2) -> (circle 13 MODE COLOR)
;; Design strategy : Structural decomposition on p : Person

(define (head p)
  (circle (radius (person-height p)) MODE COLOR))

;; Tests :
(check-equal? (head person1) (circle 16.5 MODE COLOR)) 
(check-equal? (head person2) (circle 13 MODE COLOR))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; width : PosReal -> PosReal
;; GIVEN : height h of the person (in cm)
;; RETURNS : the width (in cm) to draw the required human part 
;; using the formula, width = 0.5 * h.
;; Examples :
;; (width person1)-> 82.5.
;; (width person2)-> 65.
;; Design strategy : Function composition

(define (width h)
  (/ h 2))

;; Tests :

(check-equal? (width 165) 82.5)
(check-equal? (width 130) 65)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; height : PosReal -> PosReal
;; GIVEN : the height h of the person (in cm)
;; RETURNS : the height to draw the required human part using the formula 
;; height = 0.4 * h.
;; Examples :
;; (height 165) -> 66
;; (height 130) -> 52
;; Design strategy : Function composition

(define (height h)
  (* h 0.4))

;; Tests :
(check-equal? (height 165) 66)
(check-equal? (height 130) 52)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; chest : Person -> Image
;; GIVEN : a Person p
;; RETURNS : a rectangle proportion to the person's height 
;; using the formula, rectangle width = 0.5 * person's height & 
;; rectangle height = 0.4 * person's height.
;; Examples :
;; (chest person1)-> (rectangle 82.5 66 MODE COLOR).
;; (chest person2)-> (rectangle 65 52 MODE COLOR).
;; Design strategy : Structural decomposition on p : Person

(define (chest p)
  (rectangle (width (person-height p)) (height (person-height p)) MODE COLOR))

;; Tests :

(check-equal? (chest person1) (rectangle 82.5 66 MODE COLOR))
(check-equal? (chest person2)(rectangle 65 52 MODE COLOR))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; left-leg-x : PosReal -> PosReal
;; GIVEN : the width w of the person in cm
;; RETURNS : the x-position of the line (which looks like the left leg
;; of the person) using the formula, left-leg-x = 0.4 * w.
;; Examples :
;; (left-leg-x 82.5) -> 33
;; (left-leg-x 65) -> 26
;; Design strategy : Function composition

(define (left-leg-x w)
  (* w 0.4))

;; Tests :
(check-equal? (left-leg-x 82.5) 33)
(check-equal? (left-leg-x 65) 26)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; leg-y2 : PosReal -> PosReal
;; GIVEN : the height h of the person in cm
;; RETURNS : the y2-position of the line (which looks like the left leg
;; of the person) using the formula, 
;; leg-y2 = h - (h * 0.2).
;; Examples :
;; (leg-y2 165) -> 132
;; (leg-y2 135) -> 104
;; Design strategy : Function composition

(define (leg-y2 h)
  (- h (* h 0.2)))

;; Tests :
(check-equal? (leg-y2 165) 132)
(check-equal? (leg-y2 130) 104)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; right-leg-x : PosReal -> PosReal
;; GIVEN : the width w of the person in cm
;; RETURNS : the x-position of the line (which looks like the right leg
;; of the person)using the formula, left-leg-x = 0.4 * w.
;; Examples :
;; (right-leg-x 82.5) -> 57.75
;; (right-leg-x 65) -> 45.5
;; Design strategy : Function composition

(define (right-leg-x w)
  (* w 0.7))

;; Tests :
(check-equal? (right-leg-x 82.5) 57.75)
(check-equal? (right-leg-x 65) 45.5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; foot-y : PosReal -> PosReal
;; GIVEN : the height h of the person in cm
;; RETURNS : the y-position of the line (which looks like a foot)
;; using the formula, foot-y = 0.8 * h.
;; Examples :
;; (foot-y 164) -> 132
;; (foot-y 130) -> 104
;; Design strategy : Function composition

(define (foot-y h)
  (* h 0.8))

;; Tests :
(check-equal? (foot-y 165) 132)
(check-equal? (foot-y 130) 104)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; chest-with-legs : Person -> Image
;; GIVEN : a Person 
;; RETURNS : a rectangle aligned with 4 lines and the points at which 
;; the lines are to be aligned is calculated using the height & width of the person.
;; Examples :
;; (chest-with-legs person1) ->
;; (overlay (add-line (rectangle 82.5 66 MODE COLOR) 33 66 33 132 COLOR)
;;         (add-line (rectangle 82.5 66 MODE COLOR) 57.75 66 57.75 132 COLOR)
;;         (add-line (rectangle 82.5 66 MODE COLOR) 0 132 33 132 COLOR)
;;         (add-line (rectangle 82.5 66 MODE COLOR) 57.75 132 82.5 132 COLOR))
;; Design strategy : Structural decomposition on p : Person

(define (chest-with-legs p)
 (overlay (add-line (chest p) (left-leg-x (width (person-height p))) (height (person-height p)) 
                    (left-leg-x (width (person-height p))) (leg-y2 (person-height p)) COLOR)
          (add-line (chest p) (right-leg-x (width (person-height p))) (height (person-height p)) 
                    (right-leg-x  (width (person-height p))) (leg-y2 (person-height p)) COLOR)
          (add-line (chest p) LEFT-FOOT-X1 (foot-y (person-height p)) (left-leg-x (width (person-height p))) 
                    (foot-y (person-height p)) COLOR)
          (add-line (chest p) (right-leg-x (width (person-height p))) (foot-y (person-height p)) 
                    (width (person-height p)) (foot-y (person-height p)) COLOR)))

;; Tests :

(check-equal? (chest-with-legs person1)
              (overlay (add-line (rectangle 82.5 66 MODE COLOR) 33 66 33 132 COLOR)
                       (add-line (rectangle 82.5 66 MODE COLOR) 57.75 66 57.75 132 COLOR)
                       (add-line (rectangle 82.5 66 MODE COLOR) 0 132 33 132 COLOR)
                       (add-line (rectangle 82.5 66 MODE COLOR) 57.75 132 82.5 132 COLOR))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; person-image : Person -> Image
;; GIVEN : a Person 
;; RETURNS : an Image in which the height and width of the image
;; corresponds to the height the person.
;; Examples :
;; (person-image person1)  ->
;; (above (circle 16.5 MODE COLOR)
;;       (beside LEFT-HAND 
;;               (overlay (add-line (rectangle 82.5 66 MODE COLOR) 
;;                                  33 66 33 132 COLOR)
;;                        (add-line (rectangle 82.5 66 MODE COLOR) 
;;                                  57.75 66 57.75 132 COLOR)
;;                        (add-line (rectangle 82.5 66 MODE COLOR) 
;;                                  0 132 33 132 COLOR)
;;                        (add-line (rectangle 82.5 66 MODE COLOR) 
;;                                  57.75 132 82.5 132 COLOR))
;;               RIGHT-HAND))
;; Design strategy : function composition

(define (person-image p)
  (above (head p) 
         (beside LEFT-HAND (chest-with-legs p) RIGHT-HAND)))

;; Tests :
(check-equal? (person-image person1)
              (above (circle 16.5 MODE COLOR)
                     (beside LEFT-HAND 
                             (overlay (add-line (rectangle 82.5 66 MODE COLOR) 
                                                33 66 33 132 COLOR)
                                      (add-line (rectangle 82.5 66 MODE COLOR) 
                                                57.75 66 57.75 132 COLOR)
                                      (add-line (rectangle 82.5 66 MODE COLOR) 
                                                0 132 33 132 COLOR)
                                      (add-line (rectangle 82.5 66 MODE COLOR) 
                                                57.75 132 82.5 132 COLOR))
                             RIGHT-HAND)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






