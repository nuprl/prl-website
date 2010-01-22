(module render-html scheme 
  (require
    (lib "list.ss")
    (lib "xml.ss" "xml"))

  (define (href-to sxml-name)
    (regexp-replace "[.]sxml$" sxml-name ".html"))
  (define (name-of sxml-name)
    (string-titlecase (regexp-replace "-" (regexp-replace "[.]sxml$" sxml-name "") " ")))

  (define toplevel-files
    '(("Projects" "projects.ss")
      ("People" "people.ss")))

  (define all-sxml-names (vector->list (current-command-line-arguments)))


  (define (apply-general-style sxml page-name)
    `(html
      (head (title ,page-name)
            (link ((rel "stylesheet") (type "text/css") (href "../static/prl.css"))))
      (body (div ((class "sidebar"))
                 (a ((href "programming-research-laboratory.html"))
                    (img ((src "../static/prl.png"))))
                 (ul
                  ,@(map
                     (lambda (sxml-name)
                       `(li (a ((href ,(href-to sxml-name))
                                (class ,(if (string=? (name-of sxml-name) page-name)
                                            "internal-self-link"
                                            "internal-link")))
                               ,(name-of sxml-name))))
                     all-sxml-names)))
            (div ((class "mainstream")) (h1 ,page-name) ,sxml))))
    

  ; String[file name] -> Void
  ; effect: create or overwrite file.html with page
  (define (produce-page sxml-name)
    (printf " ... ~s~n" sxml-name)
    (let ((sxml (apply-general-style (dynamic-require sxml-name 'page) (name-of sxml-name)))
          (file.html (open-output-file (string-append "output/" (href-to sxml-name))
                     #:exists 'replace)))
      (write-xml/content (xexpr->xml sxml)  file.html)))



  (for-each produce-page all-sxml-names))