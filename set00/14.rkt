;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set01:4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; predicting the methods for structure definition

(define-struct student (id name major))

;; the following fuctions are defined for the above data definition :
;; make-student
;; student?
;; student-id
;; student-name
;; student-major