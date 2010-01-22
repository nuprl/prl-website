;; -*- scheme -*-
(module people-list scheme
 (provide page)

 (require "people.ss")
 

 ;returns a list (possibly 0) sxml elements, ready for splicing in
 (define (lookup sym assoc fn [otherwise '()])
   (cond [(assq sym assoc) => (lambda (arg) (list " " (fn (cadr arg))))]
         [else otherwise]))

 
   (define (people-list people)
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
                         (ul
                          ,@(map 
                             (lambda (person-name assoc)
                               `(li 
                                 ,@(lookup 
                                    'homepage assoc
                                    (lambda (url) `(a ((href ,url)) ,person-name))
                                    `(,person-name))
                                 ,@(lookup 
                                    'graduated assoc
                                    (lambda (year) (string-append "(" (number->string year) ")")))
                                 ,@(lookup 
                                    'thesis assoc 
                                    (lambda (url) `(a ((href ,url)) "(dissertation)")))))
                             person-name assoc)
                          ))))
             group-name person-name assoc))]))

 (define page (people-list people))
)