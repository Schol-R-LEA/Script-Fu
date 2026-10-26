(define (make-transparent-rectangle layer start-x start-y height width)
  (if ()
    (gimp-add-alpha-channel))
  (gimp-layer-select-rectangle layer 0 start-x start-y height width)
  (gimp-drawable-edit-clear)
  (gimp-selection-none)
  (gimp-image-undo-group-end)
  (gimp-display-flush



(script-fu-register "make-transparent-rectangle"
    "Selection"
    "<description>"
    
    "Schol-R-LEA;2"
    "<year>"
    "*"
    SF-IMAGE    "Image"         0
    SF-DRAWABLE "Current Layer" 0
    SF-TOGGLE   "Merge Layers?" FALSE
)

  (script-fu-register
    "make-transparent-rectangle"                      ;function name
    "Make Transparent Rectangle"                      ;menu label
    "Makes an alpha channel rectangle of given at the given location"   ;description
    "Schol-R-LEA;2 (Alice Trillian Osako)"            ;author
    "copyright 2026, Alice Trillian Osako"            ;copyright notice
    "Created:   2026-10-24+019:03:33 \
     Last modified: 2026-10-26+022:25:28 "            ; timestamp
    ""                                                ;image type that the script works on
    SF-<variable type>   "<arg-1>"  "<default value>" ; script-fu variable declaration
    SF-<variable type>   "<arg-2>"  "<default value>" ; script-fu variable declaration
    ; ... 
  )
  (script-fu-menu-register "<function name>" "<menu path>")