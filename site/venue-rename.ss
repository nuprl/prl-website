#lang scheme
(provide venues)

;Map venue abbreviations to their full names (and sometimes links).
;This is used to translate venues on the publications page.
(define venues
  '(("ICFP"  (a ((href "http://icfpconference.org/")) 
                "International Conference on Functional Programming"))
    ("POPL"  (a ((href "http://www.sigplan.org/popl.htm"))
                "Principles of Programming Languages"))
    ("ESOP"  "European Symposium on Programming")
    ("SIGCSE"(a ((href "http://www.sigcse.org/"))
                "ACM Special Interest Group on Computer Science Education"))))