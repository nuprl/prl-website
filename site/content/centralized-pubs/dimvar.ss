#lang scheme
(provide bib)
(define bib
  '(
    (publication
     (authors "Dimitrios Vardoulakis" "Olin Shivers")
     (title "Pushdown Flow Analysis of First-Class Control")
     (date ((year 2011)))
     (published "International Conference on Functional Programming (ICFP)")
     (download ((format "PDF")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/cfa2-1st-class.pdf")))
     (download ((format "slides")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/cfa2-1st-class-slides.pdf"))))

    (publication
     (authors "Dimitrios Vardoulakis" "Olin Shivers")
     (title "CFA2: a Context-Free Approach to Control-Flow Analysis")
     (date ((year 2011) (month "May")))
     (published "Logical Methods in Computer Science (LMCS), 7(2:3):1-39")
     (download ((format "PDF")
                (link "http://www.lmcs-online.org/ojs/viewarticle.php?id=705"))))

    (publication
     (authors "Dimitrios Vardoulakis" "Olin Shivers")
     (title "CFA2: a Context-Free Approach to Control-Flow Analysis")
     (date ((year 2010)))
     (published "European Symposium on Programming (ESOP)")
     (download ((format "PDF")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/cfa2-NU-CCIS-10-01.pdf")))
     (download ((format "slides")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/cfa2-esop-slides.pdf"))))

    (publication
     (authors "Dimitrios Vardoulakis" "Olin Shivers")
     (title "Ordering Multiple Continuations on the Stack")
     (published "Partial Evaluation and Program Manipulation (PEPM)")
     (date ((year 2011)))
     (download ((format "PDF")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/rcps-NU-CCIS-11-01.pdf")))
     (download ((format "slides")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/rcps-pepm11-slides.pdf"))))

    (publication
     (authors "Dimitrios Vardoulakis" "Mitchell Wand")
     (title "A Compositional Trace Semantics for Orc")
     (date ((year 2008)))
     (published "International Conference on Coordination Models and Languages (COORDINATION)")
     (download ((format "PDF")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/orc-coord.pdf")))
     (download ((format "slides")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/orc-coord-slides.pdf"))))

    (publication
     (authors "Dimitrios Vardoulakis" "Mitchell Wand")
     (title "A Compositional Trace Semantics for Orc (short version)")
     (date ((year 2007)))
     (published "BPESO/CSCW")
     (download ((format "PDF")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/orc-bpeso.pdf")))
     (download ((format "slides")
                (link "http://www.ccs.neu.edu/home/dimvar/papers/orc-bpeso-slides.pdf"))))))
