#lang racket
(provide me)
(define me 
  '(person "Stevie Strickland" 
     (group "Alumni")
     (graduated 2012)
     (thesis "http://www.ccs.neu.edu/racket/pubs/dissertation-strickland.pdf")
     (picture "gallery/stevie.jpg")
     (homepage "http://www.ccs.neu.edu/~sstrickl/")
     (bio "I came to Northeastern in 2004, and after my first year here, I
           took leave for industrial work in the area of network security.
           I then returned to the PRL in 2007.  My research is focused on
           extending contract systems like the one in Racket to cover
           features like first-class modules, first-class classes, and values
           like vectors and objects that contain mutable state.  I've
           also done work on appropriate type systems for language
           features like Scheme's variable-arity map and apply.")))
