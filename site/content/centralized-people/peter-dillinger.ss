#lang scheme
(provide me)
(define me 
  (quote (person "Peter Dillinger"
                 (group "Alumni")
                 (picture "gallery/Peter_Dillinger.jpg")
                 (homepage "http://www.peterd.org/")
                 (graduated 2010)
                 (thesis "http://www.peterd.org/pcd-diss.pdf")
                 (bio " B.S., M.S., and doctoral work in Computer Science at Georgia Tech from 1999 through 2007. I came to Northeastern in 2007 with advisor Pete Manolios. My broad interests include tools and techniques for development of correct systems. Specifically, I have made contributions to explicit-state model checkers including Spin, Murphi, and Java Pathfinder. I have also written a development environment for the ACL2 theorem prover called ACL2s (for \"ACL2 Sedan\")."))))
