(TeX-add-style-hook
 "macro"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "graphicx"
    "bm"
    "tikz"
    "url"
    "amsmath"
    "color"
    "listings"
    "plistings")
   (TeX-add-symbols
    '("reduct" 2)
    '("Cn" 1)
    '("nbody" 1)
    '("pbody" 1)
    '("neglits" 1)
    '("poslits" 1)
    '("atom" 1)
    '("body" 1)
    '("head" 1)
    '("naf" 1)
    '("code" 1)
    '("rz" 1)
    "bhline"
    "asap"
    "gringo"
    "clasp"
    "clingo"
    "dlv"
    "wasp"))
 :latex)

