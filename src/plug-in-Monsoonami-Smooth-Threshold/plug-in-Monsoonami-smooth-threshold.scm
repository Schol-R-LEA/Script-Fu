#!/usr/bin/env gimp-script-fu-interpreter-3.0

;;; © 2026 Alice Trillian Osako
;;; Distributed under the provisions of the
;;; Creative Commons Attribution 4.0 International Public License.
;;; See the included file LICENSE.md for details.
;

(define (curry-drawable-filter layer)
  (lambda (filter-type)
    (let* ((full-filter-type (string-append "gegl:" filter-type))
           (filter-name (string-append layer "-" full-filter-type)))
      (gimp-drawable-new-filter layer full-filter-type filter-name))))


(define (plug-in-Monsoonami-Smooth-Threshold image drawables)
  (print "entering filter")
  (gimp-image-undo-group-start image)
  (script-fu-use-v3)
  (let* ((layer (vector-ref (car (gimp-image-get-selected-drawables image)) 0))
         (make-layer-filter (curry-drawable-filter layer))
         (drawable-threshold (make-layer-filter "threshold"))
         (drawable-gaussian-blur (make-layer-filter "gaussian-blur")))
    (drawable-threshold #:run-mode   RUN-NONINTERACTIVE
                        #:image      image
                        #:drawables  drawable)
    (drawable-gaussian-blur #:run-mode   RUN-NONINTERACTIVE
                            #:image      image
                            #:drawables  drawable)
    (gimp-drawable-levels drawable HISTOGRAM-VALUE 95 160 1.0 0 255))
  (gimp-displays-flush)
  (gimp-image-undo-group-end image))


(script-fu-register-filter
  "plug-in-Monsoonami-Smooth-Threshold"
  "Smooth Threshold"                                 ; menu label
  "Threshold with smoothed edges"                    ; description
  "Schol-R-LEA;2 (Alice Trillian Osako)"             ; author
  "© 2026 Alice Trillian Osako \
   under the provisions of the \
   Creative Commons Attribution 4.0 International \
   license."                                         ; copyright notice
   "Created:  2026-10-24+019:06:09 \
    Last modified: 2026-11-14+020:59:15 "            ; timestamp
   "RGB*, GRAY*"                                     ;image type
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; menu item types matching the arguments
   SF-ONE-DRAWABLE
   )

  (script-fu-menu-register "plug-in-Monsoonami-smooth-threshold"
                           "<Image>/Colors")
