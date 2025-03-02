
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "top" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "bottom" 4 (color:rgb 1 0 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_Top_Implant" "Line" (position 3 0 0) (position 17 0 0))

;; Restore GUI session parameters:
(sde:set-window-position 652 69)
(sde:set-window-size 840 800)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Liberation Sans" "Normal" 8 105 )
