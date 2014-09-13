;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |23|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; expression whose value is a list of 5 booleans, 
;; alternating between true and false, starting with true

(define bool-list1 (cons true (cons false (cons true (cons false (cons true empty))))))

;; another way of defining the same list

(define bool-list2 (list true false true false true))