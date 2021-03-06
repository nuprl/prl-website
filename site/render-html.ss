(module render-html scheme 
  (require
    (lib "list.ss")
    (lib "xml.ss" "xml"))

  ;first filename in the list is the actual name, others are redirects
  (define all-files
    '(("Home" "content/home.ss" ("home.html" "index.html") #t)
      ("Projects" "content/projects.ss" ("projects.html" "Projects.html") #f) ;not visible
      ("People" "people-list.ss" ("people.html" "People.html") #t)
      ("Photo gallery" "people-gallery.ss" ("photos.html" "gallery/index.html") #f)
      ("Publications" "recent-publications.ss" ("recent_publications.html" "Publications.html") #t)
      ("All publications" "all-publications.ss" ("all_publications.html") #f)
      ("Seminars" "content/seminars.ss" ("seminars.html" "Seminars.html") #t)))

  (define toplevel-files
    (filter cadddr all-files))

  (define filenames caddr)

  (define (apply-general-style sxml page-name)
    `(html
      (head (title ,(string-append page-name 
                                   " - Programming Research Laboratory - Northeastern University"))
            (link ((rel "stylesheet") (type "text/css") (href "static/prl.css"))))
      (body 
       (a ((name "top")) "")
       (div ((class "sidebar"))
            (a ((href "home.html"))
               (img ((src "static/prl.png"))))
            (ul ;links to other PRL pages
             ,@(map
                (lambda (page-stuff)
                  `(li (a ((href ,(car (filenames page-stuff)))
                           (class ,(if (string=? (car page-stuff) page-name)
                                       "internal-self-link"
                                       "internal-link")))
                          ,(car page-stuff))))
                toplevel-files)))
       (div ((class "mainstream")) 
            ,@(if (string=? "Home" page-name) '() (list `(h1 ,page-name)))
            ,sxml)
       (div ((class "footer"))
            "Built with " (a ((href "http://www.racket-lang.org")) "Racket")))))


  ; String[file name] -> Void
  ; effect: create or overwrite file.html with page
  (define (produce-page page-stuff)
    (let ((title (car page-stuff))
          (sxml-source (string-append (cadr page-stuff))))
      
      (let ((sxml (apply-general-style (dynamic-require sxml-source 'page) title))
            (file.html (open-output-file (string-append "output/" (car (filenames page-stuff)))
                     #:exists 'replace)))
        (write-xml/content (xexpr->xml sxml)  file.html))))
  
  ;create redirects
  (define (produce-redirects)
    (call-with-output-file "output/.htaccess" #:exists 'replace
      (lambda (out)
        (fprintf out "IndexIgnore */*~%")
        (fprintf out "DirectoryIndex home.html~%")
        (for-each
         (lambda (page-stuff)
           (for-each 
            (lambda (alternative)
              (fprintf out
                       "Redirect ~a ~a ~%"
                       alternative (string-append "http://www.ccs.neu.edu/research/prl/"
                                                  (car (filenames page-stuff)))))
            (cdr (filenames page-stuff))))
         all-files))))
                     

  (for-each produce-page all-files)
  (produce-redirects)
  

)
