;; -*- scheme -*-
(module people-gallery scheme
 (provide page)

 (require "people.ss")
 

 ;returns a list (possibly 0) sxml elements, ready for splicing in
 (define (lookup sym assoc allow-list fn [otherwise '()])
   (cond [(assq sym assoc) => (lambda (arg) 
                                ((if allow-list cons list) " " (fn ((if allow-list cdr cadr) arg))))]
         [else otherwise]))

 
   (define people-gallery
     (match grouped-people
       [(list 
         (list group-name
                 (list 'person person-name assoc ...) ...) ...)
        `(div
          ,@(map 
             (lambda (group-name person-name assoc) 
               (if (null? person-name)
                   '(div)
                   `(div (h2 ,group-name)
                         (table
                          ,@(map 
                             (lambda (person-name assoc)
                               (if (and (null? (lookup 'picture assoc #f (lambda (x) x)))
                                        (null? (lookup 'bio assoc #f (lambda (x) x))))
                                   '(div)
                                   `(tr
                                     (td
                                      ,@(lookup 
                                         'picture assoc #f
                                         (lambda (url) 
                                           `(img ((src ,url)
                                                  (width "150px"))))))
                                     (td ((width "450px"))
                                      (h3
                                       ,@(lookup 
                                          'homepage assoc #f
                                          (lambda (url) `(a ((href ,url)) ,person-name))
                                          `(,person-name)))
                                      ,@(lookup 'bio assoc #t (lambda (x) x))))))
                             person-name assoc)
                          ))))
             group-name person-name assoc))]))

 (define page people-gallery)
)