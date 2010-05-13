(module plt scheme
  (provide bib)
;; -*- scheme -*-
;; Publications have:
;; * anchor      [Maybe String]  -- this must be GLOBALLY UNIQUE!
;; * authors     ([Listof Xexpr])
;; * title       (Xexpr)
;; * date        (month String, year String)
;; * published   (Xexpr)
;; * abstract    [Maybe Xexpr]
;; * copyright   [Maybe Xexpr]    (otherwise just use Matthias' message?)
;; * download    [Maybe ((format String) (link String))]
;; * bibtex      [Maybe String]
;; * note        [Maybe Xexpr]

#| Basic template for an entry.
(publication 
 (authors ---)
 (title ---)
 (download ((format ---) (link ---)))
 (date ((month ---) (year ---)))
 (published ---)
 (abstract ---))
|#

(define northeastern-univ
  '(small "[N" (small "ORTHEASTERN") "U" (small "NIVERSITY") "]"))

(define plt-link 
  (lambda (file) `(link ,(string-append "http://www.ccs.neu.edu/scheme/pubs/" file))))

(define Felleisen "Matthias Felleisen")
(define Sabry     "Amr Sabry")
(define Duba      "Bruce F. Duba")
(define Flanagan  "Cormac Flanagan")
(define Clements  "John Clements")
(define Findler   "Robert Bruce Findler")
(define Flatt     "Matthew Flatt")
(define Krishnamurthi "Shriram Krishnamurthi")
(define Matthews  "Jacob Matthews")
(define Antoniu   "Tudor Antoniu")
(define Steckler  "Paul A. Steckler")
(define Neuwirth  "Erich Neuwirth")
(define Meunier   "Phillippe Meunier")
(define Graunke   "Paul Graunke")
(define Logan     "Mark Logan")
(define Blank-Edelman "David Blank-Edelman")
(define Van-der-Hoeven "Steve Van Der Hoeven")
(define Wand      "Mitchell Wand")
(define Latendresse "Mario Latendresse")
(define Cobbe       "Richard Cobbe")
(define Culpepper   "Ryan Culpepper")
(define Herman      "Dave Herman")
(define Eastlund    "Carl Eastlund")
(define Vaillancourt "Dale Vaillancourt")
(define Tobin-Hochstadt "Sam Tobin-Hochstadt")
(define Yu          "Gang Yu")
(define Hopkins     "Peter Walton Hopkins")
(define McCarthy    "Jay McCarthy")
(define Pettyjohn   "Greg Pettyjohn")
(define Barzilay    "Eli Barzilay")
(define Page        "Rex Page")
(define Marshall    "Joe Marshall")
(define Owens       "Scott Owens")


(define bib
`(
(publication  
 (authors ,Eastlund, Vaillancourt, Felleisen )
 (title "ACL2 for Freshmen: First Experiences"  )
 (date ((year 2007)))
 (download ((format "PDF") ,(plt-link "acl207-evf.pdf"  )))
 (published "ACL2 Workshop"))

(publication 
 (authors ,Culpepper, Felleisen)
 (title "Debugging Macros"  )
 (date ((year 2007)))
 (download ((format "PDF") ,(plt-link "gpce07-cf.pdf"  )))
 (published "GPCE"))

(publication 
 (authors ,Culpepper, Tobin-Hochstadt, Flatt)
 (title "Advanced Macrology and the Implementation of Typed Scheme"  )
 (date ((year 2007)))
 (download ((format "PDF") ,(plt-link "scheme2007-ctf.pdf"  )))
 (published "Scheme Workshop"))

(publication 
 (authors ,Flatt, Yu, Findler, Felleisen)
 (title "Adding Delimited and Composable Control to a Production Programming Environment"  )
 (date ((year 2007)))
 (download ((format "PDF") ,(plt-link "icfp07-fyff.pdf"  )))
 (published "ICFP")
 (note (a ((href "http://www.cs.utah.edu/plt/delim-cont/")) "the working system and model")))

(publication 
 (authors ,Krishnamurthi,  Hopkins,  McCarthy, Graunke, Pettyjohn , Felleisen)
 (title "Implementation and Use of the PLT Scheme Web Server"  )
 (date ((year 2007)))
 (download ((format "PDF") ,(plt-link "hosc07-sk-mf.pdf"  )))
 (published "Journal of Higher-Order and Symbolic Computing"))

(publication 
 (authors ,Krishnamurthi,  Findler, Graunke, Felleisen)
 (title "Modeling Web Interactions and Errors")
 (date ((year 2006)))
 (download ((format "PDF") ,(plt-link "interactive06-sk-mf.pdf")))
 (published "Interactive Computation (Editors: Goldin, Smolka, Wegner)"))

(publication 
 (authors ,Flatt, Findler, Felleisen )
 (title "Scheme with Classes, Mixins, and Traits")
 (date ((year 2006)))
 (download ((format "PDF") ,(plt-link "asplas06-fff.pdf"  )))
 (published "ASPLAS"))

(publication 
 (authors ,Tobin-Hochstadt, Felleisen)
 (title "Interlanguage Migration: From Scripts to Programs"  )
 (date ((year 2006)))
 (download ((format "PDF") ,(plt-link "dls06-tf.pdf")))
 (published "DLS"))

(publication 
 (authors ,Culpepper, Felleisen )
 (title "A Stepper for Scheme Macros")
 (date ((year 2006)))
 (download ((format "PDF") ,(plt-link "scheme2006-cf.pdf")))
 (published "Scheme Workshop"))

(publication 
 (authors ,Barzilay)
 (title "A Self-Hosting Evaluator using HOAS (Scheme Pearl)")
 (date ((year 2006)))
 (download ((format "PDF") ,(plt-link "scheme2006-b.pdf")))
 (published "Scheme Workshop"))

(publication 
 (authors ,Vaillancourt, Page, Felleisen)
 (title "ACL2 in DrScheme")
 (date ((year 2006)))
 (download ((format "PDF") ,(plt-link "acl206-vpf.pdf"  )))
 (published "ACL2 Workshop"))

(publication 
 (authors ,Meunier, Findler, Felleisen)
 (title "Modular Set-Based Analysis from Contracts")
 (date ((year 2006)))
 (download ((format "PDF") ,(plt-link "popl06-mff.pdf")))
 (published "POPL"))

(publication
 (authors ,Pettyjohn, Clements, Marshall, Krishnamurthi, Felleisen)
 (title "Continuations from Generalized Stack Inspection")
 (date ((year 2005)))
 (download ((format "PDF") ,(plt-link "icfp05-pcmkf.pdf")))
 (published "ICFP")
 (note (span "Also see: " (a ((href "stackhack4.html")) "Joe Marshall's \"Hacking the Stack\""))))

(publication 
 (authors ,Barzilay ,Clements)
 (title "Laziness Without All the Hard Work")
 (date ((year 2005)))
 (download ((format "PDF") ,(plt-link "fdpe05-bc.pdf")))
 (published "FDPE"))

(publication 
 (authors ,Culpepper, Owens, Flatt)
 (title "Syntactic Abstraction in Component Interfaces")
 (date ((year 2005)))
 (download ((format "PDF") ,(plt-link "gpce05-cof.pdf")))
 (published "GPCE"))

(publication
 (authors ,Meunier , Findler , Steckler , Wand)
 (title "Selectors Make Set-Based Analysis Too Hard")
 (date ((year 2005)))
 (download ((format "PDF") ,(plt-link "hosc05-mfsw.pdf")))
 (published "Journal of Higher-Order and Symbolic Computing"))

(publication
 (authors , Cobbe , Felleisen)
 (title "Environmental Acquisition Revisited")
 (date ((year 2005)))
 (download ((format "PDF") ,(plt-link "popl05-cf.pdf")))
 (published "POPL"))

(publication
 (authors , Culpepper , Felleisen)
 (title "Taming Macros")
 (date ((year 2004)))
 (download ((format "PDF") ,(plt-link "gpce2004-cf.pdf")))
 (download ((format "PS")  ,(plt-link "gpce2004-cf.ps")))
 (published "GPCE"))

(publication 
 (authors , Herman , Meunier )
 (title "Improving the Static Analysis of Embedded Languages via Partial Evaluation")
 (date ((year 2004)))
 (download ((format "PDF") ,(plt-link "icfp2004-hm.pdf")))
 (download ((format "PS") ,(plt-link "icfp2004-hm.ps")))
 (published "ICFP"))

(publication
 (authors ,Flanagan ,Sabry ,Duba ,Felleisen)
 (title "The Essence of Compiling with Continuations (Retrospective)")
 (date ((year 2004) (month "April")))
 (download ((format "PDF") ,(plt-link "pldi-fsdf.pdf")))
 (download ((format "PS") ,(plt-link "pldi-fsdf.ps")))
 (published "20 years of the ACM SIGPLAN Conference on 
Programming Language Design and Implementation: 1979 - 1999. A Selection.")
 (note (span "See below for the " (a ((href "#fsdf-pldi")) "paper") ".")))

(publication 
 (authors ,Clements, Felleisen, Findler, Flatt, Krishnamurthi)
 (date ((month "March") (year 2004)))
 (title "Fostering Little Languages")
 (published "DrDobb's")
 (note "available on request"))

(publication 
 (authors ,Felleisen, Findler, Flatt, Krishnamurthi)
 (date ((month "April") (year 2004)))
 (title "Building Little Languages with Macros")
 (published "DrDobb's")
 (note "available on request"))

(publication 
 (anchor "toplas04-cf")
 (authors ,Clements, Felleisen)
 (date ((year 2004)))
 (published "Transactions on Programming Languages and Systems")
 (title "A Tail-Recursive Machine with Stack Inspection")
 (download ((format "PDF") ,(plt-link "cf-toplas04.pdf"))))

(publication
 (authors ,Findler, Flatt, Felleisen)
 (date ((month "June") (year 2004)))
 (published "ECOOP")
 (title "Semantic Casts: Contracts and Structural Subtyping in a Nomimal World")
 (download ((format "PDF") ,(plt-link "ecoop2004-fff.pdf"))))

(publication 
 (authors ,Matthews, Findler, Flatt, Felleisen)
 (date ((year 2004) (month "June")))
 (published "RTA")
 (title "A Visual Environment for Developing Context-Sensitive Term Rewriting Systems")
 (download ((format "PDF") ,(plt-link "rta2004-mfff.pdf"))))

(publication
 (authors ,Antoniu, Steckler, Krishnamurthi, Neuwirth, Felleisen)
 (date ((year 2004) (month "May")))
 (published "ICSE")
 (title "Validating the Unit Correctness of Spreadsheet Programs")
 (download ((format "PS") ,(plt-link "asknf-icse04.ps"))))

(publication
 (anchor "jase2003-mfgkf")
 (date ((year 2004) (month "October")))
 (authors ,Matthews, Findler, Graunke, Krishnamurthi, Felleisen)
 (published " Journal of Automated Software Engineering ")
 (title " Automatically Restructuring Software for the Web ")
 (download ((format "PS") ,(plt-link "./jase2003-mfgkf.ps.gz")))
 (download ((format "PDF") ,(plt-link "./jase2003-mfgkf.pdf"))))
(publication
 (anchor "esop2003-cf")
 (date ((year 2003) (month "April")))
 (published " ESOP")
 (authors ,Clements, Felleisen )
 (title " A Tail-Recursive Semantics for Stack Inspections ")
 (download ((format "PS") ,(plt-link "esop2003-cf.ps.gz")))
 (download ((format "PDF") ,(plt-link "esop2003-cf.pdf"))))
(publication
 (anchor "esop2003-gfkf")
 (date ((year 2003) (month "April")))
 (published " ESOP")
 (authors ,Graunke, Findler, Krishnamurthi, Felleisen )
 (title " Modeling Web Interactions ")
 (download ((format "PS") ,(plt-link "esop2003-gfkf.ps.gz")))
 (download ((format "PDF") ,(plt-link "esop2003-gfkf.pdf"))))
(publication
 (anchor "fdpe2002-fffk")
 (date ((year 2002) (month "October")))
 (published " FDPE ")
 (authors ,Felleisen, Findler, Flatt, Krishnamurthi )
 (title " The Structure and Interpretation of the Computer Science Curriculum ")
 (download ((format "PS") ,(plt-link "fdpe2002-fffk.ps")))
 (download ((format "PDF") ,(plt-link "fdpe2002-fffk.pdf"))))
(publication
 (anchor "afp2002-f")
 (date ((year 2002) (month "August")))
 (published " AFP")
 (authors ,Felleisen )
 (title " Developing Interactive Web Programs ")
 (download ((format " PS.gz ") ,(plt-link "afp2002-f.ps.gz")))
 (download ((format "PS") ,(plt-link "afp2002-f.ps"))))
(publication
 (anchor "lisa2002-lfb")
 (date ((year 2002) (month "November")))
 (published " LISA")
 (authors ,Logan, Felleisen, Blank-Edelman )
 (title " Environmental Acquisition in Network Management ")
 (download ((format "PS") ,(plt-link "lisa2002-lfb.ps.gz"))))
(publication
 (anchor "sfp2002-s")
 (date ((year 2002) (month "August")))
 (authors ,Steckler )
 (published " Software Practice and Experience ")
 (title " Component Support in PLT Scheme ")
 (note " [Not available here for copyright reasons.] "))
(publication
 (anchor "icse2002-gk")
 (date ((year 2002) (month "May")))

;; @proceedings{DBLP:conf/icse/2002,
;;   title     = {Proceedings of the 22rd International Conference on Software
;;               Engineering, ICSE 2002, 19-25 May 2002, Orlando, Florida, USA},
;;  booktitle = {ICSE},
;;  publisher = {ACM},
;;  year      = {2002},
;;  bibsource = {DBLP, http://dblp.uni-trier.de}
 (published " ICSE")
 (authors ,Graunke, Krishnamurthi)
 (title " Advanced Control Flows for Flexible Graphical User Interfaces ")
 (download ((format "PS") ,(plt-link "icse2002-gk.ps.gz")))
 (download ((format "PDF") ,(plt-link "icse2002-gk.pdf.gz"))))
(publication
 (anchor "ase2001-gfkf")
 (date ((year 2001) (month "November")))
 (published " Automated Software Engineering 2001 ")
 (authors ,Graunke, Findler, Krishnamurthi, Felleisen )
 (title " Automatically Restructuring Programs for the Web ")
 (download ((format "PS") ,(plt-link "ase2001-gfkf.ps.gz")))
 (download ((format "PDF") ,(plt-link "ase2001-gfkf.pdf"))))
(publication
 (anchor "scmfun01-mfsw")
 (date ((year 2001) (month "September")))
 (published " Scheme and Functional Programming 2001 ")
 (authors , Meunier, Findler, Steckler " and " ,Wand )
 (title (span " Selectors Make Analysis of " (tt () " case-lambda ") " Too Hard "))
 (download ((format "DVI") ,(plt-link "scmfun01-mfsw.dvi.gz")))
 (download ((format "PS") ,(plt-link "scmfun01-mfsw.ps.gz"))))
(publication
#|
Proceedings of the 2001 ACM SIGPLAN Conference on Object-Oriented Programming Systems, Languages and Applications, OOPSLA 2001, October 14-18, 2001, Tampa, Florida, USA. SIGPLAN Notices 36(11), November 2001, ACM, ISBN 1-58113-355-9
|#
 (anchor "oopsla01-ff")
 (date ((year 2001) (month "October")))
 (published " OOPSLA")
 (authors , Findler, Felleisen )
 (title " Contract Soundness for Object-Oriented Languages ")
 (download ((format "PDF") ,(plt-link "oopsla01-ff.pdf")))
 (download ((format "PS") ,(plt-link "oopsla01-ff.ps"))))
(publication
 (anchor "fse01-flf")
 (date ((year 2001) (month "September")))
 (published " FSE ")
 (authors , Findler, Latendresse, Felleisen )
 (title " Behavioral Contracts and Behavioral Subtyping ")
 (download ((format "PDF") ,(plt-link "fse01-flf.pdf"))))
(publication
 (anchor "mw01-cgkf")
 (date ((year 2001) (month "March")))
 (published " Monterey Workshop ")
 (authors ,Clements, Graunke, Krishnamurthi " and " ,Felleisen )
 (title " Little Languages and their Programming Environments ")
 (download ((format "PDF") ,(plt-link "mw01-cgkf.pdf"))))
(publication
 (anchor "jfp01-fcffksf")
 (date ((year 2002) (month "March")))
 (authors , Findler, Clements, Flanagan, Flatt, Krishnamurthi, Steckler " and " ,Felleisen )
 (published " Journal of Automated Software Engineering ")
 (title " DrScheme: A Programming Environment for Scheme ")
 (download ((format "PS") ,(plt-link "jfp01-fcffksf.ps")))
 (download ((format "PDF") ,(plt-link "jfp01-fcffksf.pdf"))))
(publication
#|
@proceedings{DBLP:conf/esop/2001,
  editor    = {David Sands},
  title     = {Programming Languages and Systems, 10th European Symposium on
               Programming, ESOP 2001 Held as Part of the Joint European Conferences
               on Theory and Practice of Software, ETAPS 2001 Genova, Italy,
               April 2-6, 2001, Proceedings},
  booktitle = {ESOP},
  publisher = {Springer},
  series    = {Lecture Notes in Computer Science},
  volume    = {2028},
  year      = {2001},
  isbn      = {3-540-41862-8},
  bibsource = {DBLP, http://dblp.uni-trier.de}
}
|#
 (anchor "esop2001-cff")
 (date ((year 2001) (month "April")))
 (published "ESOP") ;; pgs. 320-334
 (authors , Clements, Flatt, Felleisen )
 (title " Modeling an Algebraic Stepper ")
 (download ((format "DVI") ,(plt-link "esop2001-cff.dvi")))
 (download ((format "PS") ,(plt-link "esop2001-cff.ps.gz")))
 (download ((format "PDF") ,(plt-link "esop2001-cff.pdf"))))
(publication
 (anchor "esop2001-gkvf")
 (date ((year 2001) (month "April")))
 (published "ESOP") ;; pgs. 122-136
 (authors , Graunke, Krishnamurthi, Van-der-Hoeven ,Felleisen )
 (title " Programming the Web with High-Level Programming Languages ")
 (download ((format "DVI") ,(plt-link "esop2001-gkvf.dvi.gz")))
 (download ((format "PS") ,(plt-link "esop2001-gkvf.ps.gz")))
 (download ((format "PDF") ,(plt-link "esop2001-gkvf.pdf.gz"))))
(publication   ; this one is a dissertation, but we don't pay attention to pub types
 (authors ,Graunke )
 (graduated ,northeastern-univ)
 (date ((year 2003) (month "June")))
 (title "Web Interactions")
 (download ((format "PDF (1.2MB)") ,(plt-link "thesis-graunke.pdf")))
 (download ((format "PS.gz (0.9 MB)") ,(plt-link "thesis-graunke.ps.gz"))))

))
)