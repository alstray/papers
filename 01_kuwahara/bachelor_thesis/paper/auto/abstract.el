(TeX-add-style-hook
 "abstract"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("jbook" "a4paper" "12pt") ("ltjbook" "a4paper" "12pt")))
   (add-to-list 'LaTeX-verbatim-environments-local "alltt")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "jbook"
    "jbk12"
    "ltjbook"
    "ltjbook12"))
 :latex)

