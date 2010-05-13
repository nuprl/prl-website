(module xml-to-sxml scheme
;; Converts XML representations of publications into our S-expression-based
;; format.  



;; Note that this code is very strongly tied to the particular way
;; Viera has formatted her XML data.
;; 
;; In particular, the code assumes a particular set of keys in the
;; data (papers, paper, authors, title, pdf, doc, html, conf, comment)
;; and a particular format for the conf entries.
;; 
;; So, the code will need to be updated if Viera changes this format
;; (which she probably should, since the date information is quite
;; impoverished).


(require (lib "match.ss"))
(require (lib "xml.ss" "xml"))

;; The following are two distinct instances of the Maybe monad (!)
;; that are standard Scheme patterns

;; A [Maybe X] is one of
;; - #f
;; - X

;; A [LMaybe X] is one of
;; - (list X)
;; - null
       
;; assq/xml : Symbol [Listof Any] -> [Maybe (list Symbol Any)]
(define (assq/xml key content)
  (cond
   ((null? content) #f)
   ((and (pair? (car content))
         (eq? key (car (car content))))
    (car content))
   (else (assq/xml key (cdr content)))))

(define (viera->prl-format xexpr base-name)
 `(module ,(string->symbol base-name) scheme
    (provide bib)
    (define bib 
      ',(match xexpr
               (('papers attributes content ...)
                (apply append (map convert-paper content)))
               (else 
                (error 'viera->prl-format "malformed input"))))))

;; convert-paper : Xexpr -> [LMaybe Xexpr]
(define (convert-paper entry)
  (match entry
    (('paper attributes content ...)
     (list  
      `(publication 
        (authors ,@(cddr (assq/xml 'authors content)))
        (title   ,@(cdr (assq/xml 'title attributes)))
        ,@(lookup-for-download 'pdf "PDF" content)
        ,@(lookup-for-download 'doc "DOC" content)       
        ,@(lookup-for-download 'html "HTML" content)
        (date      ((year ,(extract-year-from-viera-entry content))))
        (published ,(drop-year-from-viera-entry content))
        (abstract ,@(cddr (assq/xml 'comment content)))
        )))
    (else 
     (if (and (string? entry)
              (regexp-match "[ \t\r\n]*" entry))
         null
         (error 'convert-paper "malformed input")))))

;; evil.
;; extract-year-from-viera-entry : [Listof Xexpr] -> String
;; Uses Viera's pattern of writing <conf>FOO ####</conf> (where #### is year) to "infer" publication date
(define (extract-year-from-viera-entry content)
  (car (regexp-match "....$" (caddr (assq/xml 'conf content)))))

;; drop-year-from-viera-entry : [Listof Xexpr] -> String
;; See above fcn; this one drops the year instead of returning it.
(define (drop-year-from-viera-entry content)
  (cadr (regexp-match "(.*) ....$" (caddr (assq/xml 'conf content)))))

;; lookup-for-download : [Listof Xexpr] -> [LMaybe Xexpr]
(define (lookup-for-download viera-tag prl-format-name content)
  (cond ((assq/xml viera-tag content) 
         => (lambda (entry) 
              (let ((filename (caddr entry)))
                (if (or (not (string? filename)) 
                        (equal? filename ".."))
                    null
                    (list `(download ((format ,prl-format-name)
                                      (link ,(add-viera-d/l-prefix filename)))))))))
        (else null)))

(define (add-viera-d/l-prefix str)
  (string-append "http://www.ccs.neu.edu/home/vkp/Papers/" str))



(for-each
 (lambda (filename)
   (let ((xexpr 
          (xml->xexpr (read-xml/element (open-input-file filename))))
         (base-name (regexp-replace ".xml$" filename "")))
     (call-with-output-file (string-append base-name ".ss")
       #:exists 'replace
       (lambda (out)
         (fprintf out "~s" (viera->prl-format xexpr base-name))))))
 (vector->list (current-command-line-arguments)))

)