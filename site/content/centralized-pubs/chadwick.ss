 #lang scheme
 (provide bib)

(define chadwick '(a ((href "http://www.ccs.neu.edu/home/chadwick/")) "Bryan Chadwick"))
(define lieber '(a ((href "http://www.ccs.neu.edu/home/lieber/")) "Karl Lieberherr"))

(define bib
  `(
    (publication
     (authors ,chadwick)
     (title "Functional Adaptive Programming")
     (date ((month "September") (year 2010)))
     (download ((format "PDF") (link "http://www.ccs.neu.edu/home/chadwick/files/thesis-single.pdf")))
     (published "PhD Dissertation, Northeastern University."))

    (publication
     (authors ,chadwick ,lieber)
     (title "A Functional Approach to Generic Programming using Adaptive Traversals")
     (date ((month "September") (year 2010)))
     (download ((format "PDF") (link "http://www.ccs.neu.edu/home/chadwick/demeterf/papers/mitchfest.pdf")))
     (published (a ((href "http://osl.iu.edu/wgp2010/")) "Higher-Order and Symbolic Computation")
                ". Festschrift for Mitch Wand."))

    (publication
     (authors ,chadwick ,lieber)
     (title "Algorithms for Traversal-Based Generic Programming")
     (date ((month "July") (year 2010)))
     (download ((format "PDF") (link "http://www.ccs.neu.edu/home/chadwick/demeterf/papers/wgp10-final.pdf")))
     (published (a ((href "http://osl.iu.edu/wgp2010/")) "Workshop on Generic Programming")))

    (publication
     (authors ,chadwick ,lieber)
     (title "Weaving Generic Programming and Traversal Performance")
     (date ((month "March") (year 2010)))
     (download ((format "PDF") (link "http://www.ccs.neu.edu/home/chadwick/demeterf/papers/aosd10-final.pdf")))
     (published (a ((href "http://www.aosd.net/")) "AOSD")))

    (publication
     (authors ,chadwick ,lieber)
     (title "A Type System for Functional Traversal-Based Aspects")
     (date ((month "March") (year 2009)))
     (download ((format "PDF") (link "http://www.ccs.neu.edu/home/chadwick/demeterf/papers/foal09-final.pdf")))
     (published (a ((href "http://www.eecs.ucf.edu/FOAL/index.shtml")) "FOAL Workshop")))
    ))
