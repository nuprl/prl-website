(module people scheme
 (provide people grouped-people)

 (define people
   (map (lambda (filename)
          (dynamic-require (string-append "content/people/" filename) 'me))
        (filter 
         (lambda (filename) (regexp-match "[.]ss$" filename)) ;only files ending in .ss
         (map path->string (directory-list "content/people")))))


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
