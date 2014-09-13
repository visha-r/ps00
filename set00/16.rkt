;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; working on image functions

(require 2htdp/image)

(define car-image1 (bitmap "car-images/orange-car.jpg"))
(define car-image2 (bitmap "car-images/blue-car.jpg"))
(define car-image3 (bitmap "car-images/red-car.jpg"))

(above/align "middle" car-image1 car-image2 car-image3)
(beside/align "bottom" car-image2 car-image3)
(overlay car-image2 car-image3)
(underlay/xy car-image2 240 150 car-image3)