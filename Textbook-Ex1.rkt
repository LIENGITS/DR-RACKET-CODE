(require 2htdp/batch-io)
(require 2htdp/image)
(require 2htdp/universe)

(define (c f)
  (* 5/9 (- f 32))) ;;here f is at the input posistion and c is the output. > (c 32) > 0 

;(write-file 'stdout "212\n")  

(define (convert in out)   ;; in is the for the Fahrenheit, and out is the Celsius as a result
  (write-file out
              (string-append
               (number->string
                (c
                 (string->number
                  (read-file in))))
               "\n")))

(define (number->square s)
  (square s "solid" "red"))

(define (world x0)
  (big-bang x0
    [to-draw number->square]
    [on-tick sub1]
    [on-key rest-0]
    [on-mouse increase-size]
    [stop-when less?]))

(define (rest-0 s key)
  (if (string=? key "\r")
      100
      s))

;; w is the world state and x&y is the coordinate where the mouse is clicked(you can press a function of a moving object), me is the mouse-evnt 
;; For ex: "button-down" is mouse clike, "move" is mouse pointer moves, "drag" is mouse clike and move
(define (increase-size w x y me) 
  (cond [(string=? me "button-down") 50] 
         [else w]))
 
(define (less? s) 
  (< s 20))
