(module render-html scheme 
  (require
    (lib "list.ss")
    (lib "xml.ss" "xml"))


  ; String[file name] -> Void
  ; effect: create or overwrite file.html with page
  (define (produce-page file.sxml)
    (printf " ... ~s~n" file.sxml)
    (let ((sxml (dynamic-require file.sxml 'page))
          (file.html (string-append "output/" (regexp-replace "[.]sxml$" file.sxml ".html"))))
      (write-xml/content (xexpr->xml sxml) (open-output-file file.html #:exists 'replace))))



  (for-each 
   produce-page
   (vector->list (current-command-line-arguments))))