;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; rectangle sequence

(require 2htdp/image)
(require rackunit)
(require "extras.rkt")
(define MODE "solid")
(define COLOR 'blue)


;; width : PosInt -> PosInt
;; Given : a number n
;; Returns : the width of the rectangle
;; using the formula width =  2 ^ n
;; Examples :
;; (width 1)    => 2
;; (width 3)    => 8
;; (width 5)    => 32
;; Strategy : Function composition

(define (width n)
  (expt 2 n))

;; Tests :

(check-equal? (width 1) 2)
(check-equal? (width 3) 8)
(check-equal? (width 5) 32)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; height : PosInt -> PosInt
;; Given : a number n
;; Returns : the height of the rectangle
;; using the formula width =  2 ^ (n + 1)
;; Examples :
;; (height 1)    => 4
;; (height 3)    => 16
;; (height 5)    => 64
;; Strategy : Function composition

(define (height n)
  (expt 2 (+ n 1)))

;; Tests :

(check-equal? (height 1) 4)
(check-equal? (height 3) 16)
(check-equal? (height 5) 64)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; rec-sequence : PosInt -> Image
;; Given : an integer n
;; Returns : the rectangle with dimensions
;; calculated using the formula width =  2 ^ n & height = 2 ^ (n+1)
;; Examples :
;; (rec-sequence 1)    => (rectangle 2 4 MODE COLOR)
;; (rec-sequence 3)    => (rectangle 8 16 MODE COLOR)
;; (rec-sequence 5)    => (rectangle 32 64 MODE COLOR)
;; Strategy : Function composition

(define (rec-sequence n)
 (rectangle (width n) (height n) MODE COLOR))

; Tests :

(check-equal? (rec-sequence 1) (rectangle 2 4 MODE COLOR))
(check-equal? (rec-sequence 3) (rectangle 8 16 MODE COLOR))
(check-equal? (rec-sequence 5) (rectangle 32 64 MODE COLOR))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

