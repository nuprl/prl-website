(module seminars scheme
  (provide page)

  
  (define-syntax seminar
    (lambda (syn)
      (syntax-case syn ()
        [(_ seminar-name mailing-list home-page desc)
         #` `(li
              "The " (strong seminar-name)
              " (" (a ((href ,(string-append "http://lists.ccs.neu.edu/pipermail/" mailing-list))) 
                      "mailing list") ")"
              " (" (a ((href home-page)) "home page") "): "
              desc)])))


  (define page
    `(div (ul
           ,(seminar "PL seminar"
                     "pl-seminar"
                     "http://www.ccs.neu.edu/home/wand/pl-seminar/"
                     "a regular meeting of Boston-area researchers in programming languages")
           ,(seminar "Demeter seminar"
                     "demeter-seminar"
                     "http://www.ccs.neu.edu/research/demeter/seminar/seminar.html"
                     "an irregular meeting of researchers in aspect-oriented software development")
           ,(seminar "junior PL seminar"
                     "pl-sem-jr"
                     "http://www.ccs.neu.edu/home/turon/pljr.html"
                     "a regular student-only seminar, suitable for those new to the study of programming languages"))))
)


