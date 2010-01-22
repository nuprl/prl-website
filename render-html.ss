(module render-html scheme 
  (require
    (lib "list.ss")
    (lib "xml.ss" "xml"))

  (define all-files
    '(("Projects" "projects.ss" #t)
      ("People" "people-list.ss" #t)
      ("Photo gallery" "people-gallery.ss" #t)))

  (define toplevel-files
    (filter caddr all-files))

  (define (.html filename)
    (regexp-replace "[.]ss$" filename ".html"))

  (define (apply-general-style sxml page-name)
    `(html
      (head (title ,page-name)
            (link ((rel "stylesheet") (type "text/css") (href "../static/prl.css"))))
      (body (div ((class "sidebar"))
                 (a ((href "programming-research-laboratory.html"))
                    (img ((src "../static/prl.png"))))
                 (ul
                  ,@(map
                     (lambda (page-stuff)
                       `(li (a ((href ,(.html (cadr page-stuff)))
                                (class ,(if (string=? (car page-stuff) page-name)
                                            "internal-self-link"
                                            "internal-link")))
                               ,(car page-stuff))))
                     toplevel-files)))
            (div ((class "mainstream")) (h1 ,page-name) ,sxml)
            (div ((class "footer"))
                 "Built with PLT Scheme"))))
    

  ; String[file name] -> Void
  ; effect: create or overwrite file.html with page
  (define (produce-page page-stuff)
    (let ((title (car page-stuff))
          (sxml-source (cadr page-stuff)))
      (printf " ... ~s~n" title)
      
      (let ((sxml (apply-general-style (dynamic-require sxml-source 'page) title))
            (file.html (open-output-file (string-append "output/" (.html sxml-source))
                     #:exists 'replace)))
        (write-xml/content (xexpr->xml sxml)  file.html))))



  (for-each produce-page all-files))