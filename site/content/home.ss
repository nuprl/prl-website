(module home scheme
 (provide page)

 (define page 
   '(div
     (h1 
      (a ((href "http://www.neu.edu/") (style "color: black;"))
         (span ((style "font-size: 50%")) "Northeastern University")) (br)
      (a ((href "http://www.ccs.neu.edu/") (style "color: black;"))
         (span ((style "font-size: 70%")) "College of Computer and Information Science")) (br)
         "Programming Research Laboratory")
     (p "We believe that writing computer programs is the fundamental act of
computer science, and that programming languages are therefore our
fundamental tool.")
     (p "We seek a deeper understanding of this fundamental tool and how it
should be used, and we seek to apply this understanding to the program design
process, as well as to novel applications.")
     (p "We take a multi-faceted approach to the study of programming
languages and programming methodology, incorporating elements of design,
mathematics, experimental science, and engineering.")


     (p "We conduct research on all aspects of programming, including"
        (ul
         (li "the development of small and large programs")
         (li "the design, implementation, and analysis of programming languages")
         (li "programming environment tools")))

     (p "Our research program is intertwined with our mission to train
undergraduates and graduate students. We routinely exploit research results for
our undergraduate courses, and we routinely find research challenges in our
teaching. Some of the faculty and PhD students assist the TeachScheme! project,
including Bootstrap, its middle school program.")))
)