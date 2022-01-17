(TeX-add-style-hook
 "problem"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "tikz/tikz-test-output"
    "tikz/tikz-test-netsuki-input"
    "tikz/tikz-test-netsuki-output"
    "tikz/tikz-test-core-0"
    "tikz/tikz-test-core-1"
    "tikz/tikz-test-core-3"
    "tikz/tikz-test-core-2")
   (TeX-add-symbols
    '("lw" 1))
   (LaTeX-add-labels
    "chap:problem"
    "topology"
    "electrical"
    "fig:test-output"
    "fig:test-netsuki-input"
    "fig:test-netsuki-output"
    "fig:test-core"))
 :latex)

