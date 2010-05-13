(module publications scheme
 (provide page) ;the default page is date-ordered

 (define (pub-fixup pub)
   (match pub
          [(list-no-order 'publication
                          (list 'authors authors ...)
                          (list-no-order 'date date-items ...)
                          more-fields ...)
           
           `(publication
             (authors ,(sxml-join authors " and "))
             (date (,@(map (lambda (date-item) `(,(car date-item)
                                                ,(if (and (string? (cadr date-item))
                                                          (string->number (cadr date-item)))
                                                     (string->number (cadr date-item))
                                                     (cadr date-item))))
                          (car date-items))))
             ,@more-fields)]))
                          
 (define (sxml-join lst connector)
   (foldl (lambda (elt rest)
            (if (empty? rest)
                (list elt)
                (cons elt (cons connector rest))))
          '()
          lst))
   

 (define pubs
   (map pub-fixup
        (foldl append '()
               (map (lambda (filename)
                      (dynamic-require (string-append "working/" filename) 'bib))
                    (filter 
                     (lambda (filename) (regexp-match "[.]ss$" filename)) ;only files ending in .ss
                     (map path->string (directory-list "working/")))))))

 (define (uniq lst eq?)
   (foldl (lambda (elt rest)
            (if (or (empty? rest)
                    (not (eq? elt (car rest))))
                (cons elt rest)
                rest))
          '() lst))

 (define (order-and-group-pubs-by accessor lt? eq?)
   (let* ((sorted-pubs (sort pubs
                             (lambda (p1 p2) (lt? (accessor p1) (accessor p2)))))
          (unique-keys (uniq (map accessor sorted-pubs) eq?)))
     (map 
      (lambda (key)
        `(,key
          ,@(filter (lambda (pub) (eq? key (accessor pub))) pubs)))
      unique-keys)))


 ;There isn't always a month.  We ignore it for now.
 (define pubs-by-date
   (order-and-group-pubs-by
    (lambda (pub) (cadr (assoc 'year (cadr (assoc 'date (cdr pub))))))
    < =))

 (define (pubs-date-list pubs)
   (match pubs
     [(list
       (list year
             (list 'publication fields ...) ...) ...)
      
      `(div 
        ,@(map
           (lambda (year fields)
             `(div 
               ((class "pub-group"))
               (a ((name ,(string-append "year" (number->string year))))
                  (h2 ,(number->string year)))
               ,@(map
                  (lambda (fields)
                    `(div (h4 (i ,(cadr (assoc 'title fields)))
                              ,@(map (lambda (link-item)  
                                       (let* ((link (cadr (assoc 'link (cadr link-item))))
                                              (format-specified (cadr (assoc 'format (cadr link-item))))
                                              (format
                                               (if (symbol? format-specified) ;'auto
                                                   (let ((guessed-extension 
                                                          (string-upcase 
                                        ;drop everything before the (first period after the last slash):
                                                           (regexp-replace "^.*/.*?[.]" link ""))))
                                                     (if (< 1 (string-length guessed-extension) 5)
                                                         guessed-extension
                                                         "download")) ;fallback
                                                   format-specified)))
                                       `(small " (" (a ((href ,link))
                                                  ,format) ")")))
                                     (filter (lambda (field) (symbol=? 'download (car field))) fields))
                              )
                          (span ((class "pub-authors")) ,@(cadr (assoc 'authors fields)))
                          
                          ))
                  fields)))
           year fields))]))

 (define page
   `(div
     (span ((style "text-align: center;"))
           ,@(sxml-join
              (map (lambda (year-group)
                    (let ((year (number->string (car year-group))))
                      `(a ((href ,(string-append "#year" year)))
                           ,year)))
                  pubs-by-date)
              " "))
     ,(pubs-date-list pubs-by-date)))

)