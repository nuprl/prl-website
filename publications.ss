(module publications scheme
 (provide pubs-in-range-inclusive pubs-by-date pubs-date-page)

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

 (define (pubs-in-range-inclusive start-year end-year)
   (filter (lambda (year-group)
             (<= start-year (car year-group) end-year))
           pubs-by-date))






 (define (maybe-list fields sym drop-in) ;for when the fields have ('sym item item item ...)
   (if (assoc sym fields)
       (drop-in (cdr (assoc sym fields)))
       '(span)))

 (define (maybe-item fields sym drop-in) ;for when the fields have ('sym item)
   (maybe-list fields sym (lambda (x) (drop-in (car x)))))
   
 (define (published-line published-expr)
   ;idiosyncratic formats
   `(span ((class "published-in"))
     ,(match published-expr
        [(list (list (list 'in place)
                     more-info ...))
         `(span "in " ,place
                ,(maybe-item more-info 'issue (lambda (x) `(span " (" ,x ") ")))
                ,(maybe-item more-info 'pages (lambda (x) `(span " pp. " ,x))))]
        [(list (list) desc)
         desc]
        [(list desc)
         desc])))
      

 (define (pubs-date-page pubs)
   (match pubs
     [(list
       (list year
             (list 'publication fields ...) ...) ...)
      
      `(div 
        ,@(map
           (lambda (year fields)
             `(div 
               ((class "pub-group"))
      ;The space is a hack that we wouldn't need if we correctly identified ourselves as XHTML. I think.
               (a ((name ,(string-append "year" (number->string year)))) " ")
               (h2 ((class "year-header")) ,(number->string year))
               ,@(map
                  (lambda (fields)
                    `(div 
                      ,(maybe-item fields 'anchor (lambda (x) `(a ((name ,x)) " ")))
                      (h4 ((class "paper-title")) (i ,(cadr (assoc 'title fields)))
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
                                 (filter (lambda (field) (symbol=? 'download (car field))) fields)))
                      (span ((class "pub-authors")) ,@(cadr (assoc 'authors fields))) (br)
                      ,(maybe-list fields 'published published-line)))
                  fields)))
           year fields))]))


)