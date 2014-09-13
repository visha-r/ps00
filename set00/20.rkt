;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |20|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; to assemble a human shape using the image functions.


(require 2htdp/image)

(define LEFTLEG-X 20)
(define RIGHTLEG-X 40)
(define LEG-Y1 60)
(define LEG-Y2 100)
(define CHEST-WIDTH 60)
(define CHEST-HEIGHT 60)
(define HEAD-SIZE 15)
(define LEFT-FOOT-X1 0)
(define LEFT-FOOT-X2 20)
(define RIGHT-FOOT-X1 40)
(define RIGHT-FOOT-X2 60)
(define FOOT-Y 100)
(define LEFT-HAND-X -30)
(define RIGHT-HAND-X 30)
(define HAND-Y 40)
(define MODE "solid")
(define COLOR 'brown)

(define head
  (circle HEAD-SIZE MODE COLOR))

(define chest
  (rectangle CHEST-WIDTH CHEST-HEIGHT MODE COLOR))

(define body
 (overlay (add-line chest LEFTLEG-X LEG-Y1 LEFTLEG-X LEG-Y2 COLOR)
          (add-line chest RIGHTLEG-X LEG-Y1 RIGHTLEG-X LEG-Y2 COLOR)
          (add-line chest LEFT-FOOT-X1 FOOT-Y LEFT-FOOT-X2 FOOT-Y COLOR)
          (add-line chest RIGHT-FOOT-X1 FOOT-Y RIGHT-FOOT-X2 FOOT-Y COLOR)))

(define left-hand
  (line LEFT-HAND-X HAND-Y COLOR))

(define right-hand
  (line RIGHT-HAND-X HAND-Y COLOR))

(define human-shape
  (above head (beside left-hand body right-hand)))