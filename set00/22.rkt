;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |22|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; writing an expression whose value is the list of numbers from 1 to 5

(define list1 (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty))))))

;; another way to define the list

(define list2 (list 1 2 3 4 5))