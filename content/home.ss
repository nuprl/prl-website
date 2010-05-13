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
should be used, and we seek to apply this understanding to novel
applications, to improving the programming and design process, and to
improving computer science education.")
     (p "We take a multi-faceted approach to the study of programming
languages and programming methodology, incorporating elements of design,
mathematics, experimental science, engineering, and education.")


     (p "We conduct research on all aspects of programming, including"
        (ul
         (li "the development of small and large programs")
         (li "the design, implementation, and analysis of programming languages")
         (li "programming environment tools")
         (li "the pedagogy of programming")))

     (p "Our research program is deeply integrated with its undergraduate
teaching mission. We also participate in the widely visible
TeachScheme!  outreach project.")

     (p "Our research program is also deeply integrated with our graduate
teaching mission.  We aim to provide an environment that is both
nurturing and challenging in order to give our PhD students the best
possible scientific education.")))
)