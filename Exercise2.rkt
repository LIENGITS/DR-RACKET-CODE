;;Ex2
(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 10 "solid" "red"))

(define (main-1 y)
  (big-bang y
    [on-tick sub1]
    [to-draw place-dot-at]
    [on-key stop]
    [stop-when zero?]))

(define (place-dot-at y)
  (place-image DOT 50 y BACKGROUND))

(define (stop y key)
  0)
  
