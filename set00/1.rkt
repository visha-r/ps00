;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; writing an expression whose value is the number of seconds in a leap year

(* 366 24 60 60)


;; 2 more expressions that have the same value

(* (+ (/ 366 2) (* 18.3 10)) 24 (/ 600 10) (+ 2 4) 10)

(* (+ 42 (expt 18 2)) (sub1 25) (sqr (sqrt 3600)))
