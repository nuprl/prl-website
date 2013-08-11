#lang scheme
(provide me)
(define me 
  (quote 
   (person "Dave Herman" 
           (group "Alumni") 
           (picture "gallery/David_Herman.jpg")
           (graduated 2010)
           (thesis "http://www.ccs.neu.edu/home/dherman/research/papers/dissertation.pdf")
           (homepage "http://www.ccs.neu.edu/home/dherman/")
           (bio "My dissertation was an exploration of the theoretical foundations of hygienic macro expansion. During grad school, I also started working on the Ecma TC39 committee designing and specifying the JavaScript programming language. I now work full-time at Mozilla as a programming language designer and implementor, and continue my work with TC39 on JavaScript."))))
