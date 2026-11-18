#!/usr/bin/env gimp-script-fu-interpreter-3.0

(define (script-fu-zemarmot-hello-world
         image
         drawables
         font
         compute-size
         size
         text)
  (script-fu-use-v3)
  (let* ((layer (gimp-text-layer-new image text font size UNIT-PIXEL)))

    (gimp-image-undo-group-start image)

    (gimp-image-insert-layer image layer -1 0)
    (if (= compute-size TRUE)
      (let* ((image-width (gimp-image-get-width image))
             (layer-width (gimp-drawable-get-width layer)))
        (begin
          (set! size (* size (/ image-width layer-width)))
          (gimp-text-layer-set-font-size layer size UNIT-PIXEL)
        )
      )
    )

    (gimp-image-undo-group-end image)
  )
)

(script-fu-register-filter "script-fu-zemarmot-hello-world"
  "Script-Fu v3 Hello World"
  "Official Hello World Tutorial in Script-Fu v3"
  "Jehan"
  "Jehan, Zemarmot project"
  "2025"
  "*"
  SF-ONE-OR-MORE-DRAWABLE
  SF-FONT       "Font"               "Sans-serif"
  SF-TOGGLE     "Compute Ideal Size" #f
  SF-ADJUSTMENT "Font size (pixels)" '(20 1 1000 1 10 0 1)
  SF-STRING     "Text"               "Hello World!"
)

(script-fu-menu-register "script-fu-zemarmot-hello-world" "<Image>/Hello W_orlds")