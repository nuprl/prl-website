(module all-publications scheme
 (provide page)
 
 (require "publications.ss")
 
 (define recent-pubs (pubs-in-range-inclusive 1066 2061) )

 (define page
   `(div
     (center
           ,@(map (lambda (year-group)
                    (let ((year (number->string (car year-group))))
                      `(span (a ((href ,(string-append "#year" year)))
                           ,year) " ")))
                  recent-pubs))
     ,(pubs-date-page recent-pubs)))
)