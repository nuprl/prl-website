(module people scheme
 (provide people grouped-people)


 (define (give-default-sort-name person)
   (cond 
    [(assoc 'sort-name (cddr person))  person]
    [else
     (append person
             `((sort-name ,(car (regexp-match* #rx" ([^ ]+) *$" (cadr person))))))]))


 (define people
   (sort
    (map (lambda (filename)
           (give-default-sort-name
            (dynamic-require (string-append "working/people/" filename) 'me)))
         (filter 
          (lambda (filename) (regexp-match "[.]ss$|[.]rkt$" filename)) ; Racket files
          (map path->string (directory-list "working/people/"))))
    (lambda (p1 p2)
      (string<? (cadr (assoc 'sort-name (cddr p1)))
                (cadr (assoc 'sort-name (cddr p2)))))))


 (define grouped-people
   (map
    (lambda (group-name)
      `(,group-name
        ,@(filter
          (lambda (person)
            (match person
                   [(list 'person person-name assoc ...)
                    (string=? (cadr (assq 'group assoc)) group-name)])) ; in the given group?
          people)))
    '("Faculty" "Research Scientists" "Post-Docs" "Visitors" "Students" "Alumni" "Former Members")))

 (for-each
  (lambda (person)
    (if (not (ormap (lambda (group) (member person (cdr group))) grouped-people))
        (error (format "'~s' doesn't have a group" person))
        '*void*))
  people)

)
