#!/usr/bin/env gimp-script-fu-interpreter-3.0

(define (script-fu-zemarmot-hello-world2
         width height
         font
         compute-size
         size
         text)
  (script-fu-use-v3)
  (let* ((image (gimp-image-new width height RGB))
         (layer (gimp-text-layer-new image text font size UNIT-PIXEL)))

    (gimp-image-undo-group-start image)

    (gimp-display-new image)
    (gimp-image-insert-layer image layer -1 0)
    (if (= compute-size TRUE)
      (let* ((layer-width (gimp-drawable-get-width layer)))
        (begin
          (set! size (* size (/ width layer-width)))
          (gimp-text-layer-set-font-size layer size UNIT-PIXEL)
        )
      )
    )

    (gimp-image-undo-group-end image)
  )
)

(script-fu-register-procedure "script-fu-zemarmot-hello-world2"
  "Script-Fu v3 Hello World 2"
  "Official Hello World Tutorial in Script-Fu v3"
  "Jehan, Zemarmot project"
  "2025"
  SF-ADJUSTMENT "Image Width"        '(1920 10 100000 1 10 0 1)
  SF-ADJUSTMENT "Image Height"       '(1080 10 100000 1 10 0 1)
  SF-FONT       "Font"               "Sans-serif"
  SF-TOGGLE     "Compute Ideal Size" #f
  SF-ADJUSTMENT "Font size (pixels)" '(20 1 1000 1 10 0 1)
  SF-STRING     "Text"               "Hello World!"
)

(script-fu-menu-register "script-fu-zemarmot-hello-world2" "<Image>/Hello W_orlds")