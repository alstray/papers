(TeX-add-style-hook
 "paper"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("bxjsarticle" "uplatex" "dvipdfmx" "a4paper" "twocolumn" "base=11pt" "jbase=11pt" "ja=standard")))
   (TeX-run-style-hooks
    "latex2e"
    "macro"
    "table/model2"
    "table/result"
    "bxjsarticle"
    "bxjsarticle10")
   (LaTeX-add-labels
    "table:model"
    "table:result")
   (LaTeX-add-bibliographies
    "bachelor"
    "aisat"
    "local"))
 :latex)

