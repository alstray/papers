(TeX-add-style-hook
 "jsample-bachelor"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("jbook" "a4paper" "12pt") ("ltjbook" "a4paper" "12pt")))
   (TeX-run-style-hooks
    "latex2e"
    "jbook"
    "jbk12"
    "bachelor"
    "ltjbook"
    "ltjbook12")
   (LaTeX-add-bibitems
    "Okumura97"))
 :latex)

