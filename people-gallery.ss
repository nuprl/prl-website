;; -*- scheme -*-
(module people-gallery scheme
 (provide page)

 (require "people.ss")
 

 ;returns a list (possibly 0) sxml elements, ready for splicing in
 (define (lookup sym assoc fn [otherwise '()])
   (cond [(assq sym assoc) => (lambda (arg) (list " " (fn (cadr arg))))]
         [else otherwise]))

 
   (define (people-gallery people)
     (match people
       [(list 
         (list 'group group-name
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
                               (if (and (null? (lookup 'picture assoc (lambda (x) x)))
                                        (null? (lookup 'bio assoc (lambda (x) x))))
                                   '(div)
                                   `(tr
                                     (td
                                      ,@(lookup 
                                         'picture assoc
                                         (lambda (url) 
                                           `(img ((src 
                                                   ,(string-append 
                                                     "http://www.ccs.neu.edu/research/prl/gallery/" 
                                                     url))
                                                  (width "150px"))))))
                                     (td ((width "450px"))
                                      (h3
                                       ,@(lookup 
                                          'homepage assoc
                                          (lambda (url) `(a ((href ,url)) ,person-name))
                                          `(,person-name)))
                                      ,@(lookup 'bio assoc (lambda (x) x))))))
                             person-name assoc)
                          ))))
             group-name person-name assoc))]))

 (define page (people-gallery people))
)