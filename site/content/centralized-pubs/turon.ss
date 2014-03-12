#lang scheme
(provide bib)
(define bib
  '(
    (publication
     (authors "Panagiotis Manolios" "Aaron Turon")
     (title "All-Terimation(T)")
     (date ((month "March") (year 2009)))
     (download ((format "PDF") 
		(link "http://www.ccs.neu.edu/home/turon/tacas09.pdf")))
     (published "TACAS"))
    (publication
     (authors "Scott Owens" "John Reppy" "Aaron Turon")
     (title "Regular expression derivatives reexamined")
     (date ((month "March") (year 2009)))
     (download ((format "PDF")
		(link "http://www.ccs.neu.edu/home/turon/re-deriv.pdf")))
     (published "JFP"))
    (publication
     (authors "John Reppy" "Aaron Turon")
     (title "Metaprogramming with Traits")
     (date ((month "July") (year 2007)))
     (download ((format "PDF")
		(link "http://www.ccs.neu.edu/home/turon/ecoop07-meta-traits.pdf")))
     (published "ECOOP"))
    (publication
     (authors "John Reppy" "Aaron Turon")
     (title "A foundation for trait-based metaprogramming")
     (date ((month "January") (year 2006)))
     (download ((format "PDF")
		(link "http://www.ccs.neu.edu/home/turon/traits-fool.pdf")))
     (published "FOOL/WOOD"))))