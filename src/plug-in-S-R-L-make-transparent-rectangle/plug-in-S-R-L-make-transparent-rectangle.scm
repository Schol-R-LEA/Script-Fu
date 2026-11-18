#!/usr/bin/env gimp-script-fu-interpreter-3.0

;;; © 2026 Alice Trillian Osako
;;; Distributed under the provisions of the
;;; Creative Commons Attribution 4.0 International Public License.
;;; See the included file LICENSE.md for details.

(define (curry-filter drawable)
  (lambda (filter-type)
    (let* ((full-filter-type (string-append "gegl:" filter-type))
           (filter-name
             (string-append
               (string-append "Drawable-"
                              (integer->string (gimp-item-get-id drawable)))
               (string-append "-" full-filter-type))))
      (gimp-drawable-new-filter drawable full-filter-type filter-name))))


(define (plug-in-S-R-L-make-transparent-rectangle
          image drawable start-x start-y height width)
  (gimp-image-undo-group-start image)
  (if (not (gimp-drawable-has-alpha drawable))
      (gimp-add-alpha-channel drawable))
  (gimp-selection-none image)
  (gimp-image-select-rectangle image start-x start-y height width)
  (gimp-edit-cut drawable)
  (gimp-selection-none image)
  (gimp-image-undo-group-end image)
  (gimp-display-flush))


  (script-fu-register-filter
    "plug-in-S-R-L-make-transparent-rectangle"                      ;function name
    "Make Transparent Rectangle"                      ;menu label
    "Makes an alpha channel rectangle of given at \
     the given location"                              ;description
    "Schol-R-LEA;2 (Alice Trillian Osako)"            ;author
    "© 2026 Alice Trillian Osako \
     under the provisions of the \
     Creative Commons Attribution 4.0 International \
     license."                                        ; copyright notice
    "Created:   2026-10-24+019:03:33 \
     Last modified: 2026-11-14+021:30:28 "            ; timestamp
    "RGBA, GRAYA"                                     ; image type
    SF-ADJUSTMENT 
    ; ... 
  )
  (script-fu-menu-register "plug-in-S-R-L-make-transparent-rectangle"
                           "")