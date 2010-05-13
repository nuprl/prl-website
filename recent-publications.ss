(module recent-publications scheme
 (provide page)
 
 (require "publications.ss")
 
 (define recent-pubs (pubs-in-range-inclusive 2001 2061) )

 (define page
   `(div
     (center
           ,@(map (lambda (year-group)
                    (let ((year (number->string (car year-group))))
                      `(span (a ((href ,(string-append "#year" year)))
                           ,year) " ")))
                  recent-pubs)
           (br)
           (a ((href "all_publications.html"))
              "All publications (1972" ndash ")")
           )
     ,(pubs-date-page recent-pubs)))
)