;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname set00:3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
 ; Fahrenheit to Celsius conversion

 ; f->c : Number -> Number
 ; GIVEN: a temperature in degrees Fahrenheit as an argument
 ; RETURNS: the equivalent temperature in degrees Celsius.
 ; Examples:
 ; (f->c 32)  => 0
 ; (f->c 100) => 37.77777777777778
 ; (f->c 44)  => 6.666666667
 ; (f->c -10) => -23.33333333

 (define (f->c f)
  (* (- f 32) (/ 5 9)))

 ; Tests :

 (check-expect (f->c 32) 0)
 (check-expect (f->c 100) 37.77777777777778)
 (check-expect (f->c 44) 6.666666667)
 (check-expect (f->c -10) -23.33333333)