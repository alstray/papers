(TeX-add-style-hook
 "macro"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("graphicx" "dvipdfmx")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "alltt")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "graphicx"
    "lineno"
    "url"
    "alltt"
    "ascmac"
    "listings"
    "plistings")
   (TeX-add-symbols
    '("reduct" 2)
    '("nbody" 1)
    '("pbody" 1)
    '("neglits" 1)
    '("poslits" 1)
    '("body" 1)
    '("head" 1)
    '("naf" 1)
    '("code" 1)
    "asap"
    "gringo"
    "clingo"
    "dlv"
    "wasp"
    "lstlistingname"
    "lstlistlistingname"))
 :latex)

