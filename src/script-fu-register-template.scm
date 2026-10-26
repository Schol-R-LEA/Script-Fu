(script-fu-register "<script-name>"
    "<menu path>"
    "<description>"
    
    "Schol-R-LEA;2"
    "<year>"
    "*"
    SF-IMAGE    "Image"         0
    SF-DRAWABLE "Current Layer" 0
    SF-TOGGLE   "Merge Layers?" FALSE
)

  (script-fu-register
    "<function name>"                                 ;function name
    "<menu label>"                                    ;menu label
    "<description>"                                   ;description
    "Schol-R-LEA;2 (Alice Trillian Osako)"            ;author
    "copyright 2026, Alice Trillian Osako"            ;copyright notice
    "Created:  2026-10-24+019:06:09 \
     Last modified: 2026-10-26+022:08:31 "            ; timestamp
    ""                                                ;image type that the script works on
    SF-<variable type>   "<arg-1>"  "<default value>" ; script-fu variable declaration
    SF-<variable type>   "<arg-2>"  "<default value>" ; script-fu variable declaration
    ; ... 
  )
  (script-fu-menu-register "<function name>" "<menu path>")