

(define (make-vertical-transparent-bar layer start-x start-y width)
  (let ((height (gimp-layer-height layer)))
    (gimp-image-select-rectangle layer 0 start-x start-y height width)
    ))


(define (make-transparent-grill bar-width frequency)
  (cond
    ((> layer-width bar-width) (send-message )
           (> 50 frequency)
    (let* ((image (car (gimp-display-get-image (car (gimp-display-list)))))
           (layer (car (gimp-image-get-active-drawable image)))
           (layer-width (gimp-layer-width layer))
           ())
      
        
    