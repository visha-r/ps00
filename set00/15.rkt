;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; writing data definition

(define-struct student (id name major))

;; a Student is a 
;; (make-student PosInt String String)
;; Interpretation:
;;     id is the student's identification number.
;;     name is the student's full name.
;;     major is the student's main course of study.

;; student-fn : Student -> ??
;; (define (student-fn s)
;;  (...(student-id s)
;;      (student-name s)
;;      (student-major s)))