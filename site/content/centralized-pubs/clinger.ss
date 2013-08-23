(module clinger scheme
  (provide bib)

;; -*- scheme -*-
;; Publications have:
;; * anchor      [Maybe String]  -- this must be GLOBALLY UNIQUE!
;; * authors     [Listof Xexpr]
;; * title       Xexpr
;; * date        ((month String) (year [Oneof Number String]))
;; * published   [Maybe ((in Xexpr) (issue Xexpr) (pages Xexpr))] [Maybe Xexpr]
;; * abstract    [Maybe Xexpr]
;; * copyright   [Maybe Xexpr]   -- otherwise just use Matthias' message?
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
;; * kind (oneof 'Paper 'Dissertation 'Tech-Report)

(define mitch-wand 
'(a ((href "http://www.ccs.neu.edu/home/wand/")) "Mitchell Wand"))

(define will-clinger 
'(a ((href "http://www.cesura17.net/~will/Professional")) "William D Clinger"))

(define acm-copyright 
'(a ((href "http://www.acm.org/pubs/copyright_policy/")) "ACM"))

(define bib
  `(
(publication 
 (authors ,will-clinger)
 (title "Common Larceny")
 (download ((format "PDF")
            (link "http://www.cesura17.net/~will/Professional/Research/Presentations/ILC2005/commonLarceny.pdf")))
 (download ((format "HTML slides")
            (link "http://www.cesura17.net/~will/Professional/Research/Presentations/ILC2005/Slides/title.html")))
 (download ((format "MP3 of the conference presentation")
            (link "http://international-lisp-conference.org/2005/media/clinger-audio.mp3")))
 (date ((month "June")
        (year "2005")))
 (published ((in "Proc. International Lisp Conference, June 2005, pages 101-107."))))
(publication
 (authors ,will-clinger)
 (title "How to Read Floating Point Numbers Accurately (Retrospective)")
 (download ((format "PDF")
            (link "http://www.cesura17.net/~will/Professional/Research/Papers/retrospective.pdf")))
 (date ((month "April")
        (year "2004")))
 (copyright ,acm-copyright)
 (published ((in "20 years of the ACM SIGPLAN Conference on Programming Language
Design and Implementation: 1979 - 1999. A Selection., April 2004")))
)
(publication 
 (authors "Lars T Hansen" ,will-clinger)
 (title   "An experimental study of renewal-older-first garbage collection")
 (download ((format "PDF")
            (link "http://cesura17.net/~will/Professional/Research/Papers/p131-hansen.pdf")))
 (date ((month "October")
        (year "2002")))
 (copyright ,acm-copyright)
 (published ((in (span "Proceedings of the 2002 ACM "
                       (a ((href "http://icfp2002.cs.brown.edu/"))
                          "International Conference on Functional Programming")))))
 (abstract (div
            (p "
    Generational collection has improved the efficiency
    of garbage collection in fast-allocating programs by focusing on
    collecting young garbage, but has done little to reduce the cost of
    collecting a heap containing large amounts of older data.  A new
    generational technique, older-first collection, shows promise in its
    ability to manage older data.")
            (p " 
    This paper reports on an implementation study that compared two
    older-first collectors to traditional (younger-first) generational
    collectors.  One of the older-first collectors performed well and
    was often effective at reducing the first-order cost of collection
    relative to younger-first collectors.  Older-first collectors
    perform especially well when objects have queue-like or random
    lifetimes.")))
 (note (div "Some larger benchmark data are now available:"
            (ol
             (li (a ((href "GC/p131-table1.pdf")) "expanded version of Table 1"))
             (li (a ((href "GC/p131-table2.pdf")) "expanded version of Table 2"))
             (li (a ((href "GC/p131-figure5.pdf")) "expanded version of Figure 5"))
             (li a ((href "GC/p131-figure6.pdf")) "expanded version of Figure 6"))) ))

(publication 
 (authors "David Detlefs"
          "Ross Knippel" 
          ,will-clinger
          "Matthias Jacob")
 (title "Concurrent Remembered Set Refinement in Generational Garbage Collection")
 (date ((month "August")
        (year "2002")))
 (download ((format "PDF")
            (link "http://research.sun.com/jtech/pubs/02-clog.pdf")))
 (download ((format "HTML")
            (link "http://research.sun.com/jtech/pubs/02-clog-html/clog.html")))
 (published ((in "
    Proceedings of the 2002 USENIX Java VM Research and Technology
    Symposium"
)))
 (abstract "
    Generational garbage collection divides a heap up into two or
    more generations, and usually collects a youngest generation most
    frequently. Collection of the youngest generation requires
    identification of pointers into that generation from older
    generations; a data structure that supports such identification is
    called a remembered set. Various remembered set mechanisms have
    been proposed; these generally require mutator code to execute a
    write barrier when modifying pointer fields. Remembered set data
    structures can vary in their precision: an imprecise structure
    requires the garbage collector to do more work to find old-to-young
    pointers. Generally there is a tradeoff between remembered set
    precision and barrier cost: a more precise remembered set requires
    a more elaborate barrier. Many current systems tend to favor more
    efficient barriers in this tradeoff, as shown by the widespread
    popularity of relatively imprecise card marking techniques. This
    imprecision becomes increasingly costly as the ratio between old-
    and young-generation sizes grows. We propose a technique that
    maintains more precise remembered sets that scale with old-generation
    size, using a barrier whose cost is not significantly greater than
    card marking.
"
))

(publication
 (authors "H. Abelson" "R.K. Dybvig" "C.T. Haynes" "G.J. Rozas" "N.I. Adams IV" 
          "D.P. Friedman" "E. Kohlbecker" "G.L. Steele Jr." "D.H. Bartley" 
          "R. Halstead" "D. Oxley" "G.J. Sussman" "G. Brooks" "C. Hanson" 
          "K.M. Pitman" "M. Wand")
 (title "Revised^5 Report on the Algorithmic Language Scheme")
 (download ((format "PS")
            (link "ftp://ftp-swiss.ai.mit.edu/pub/scheme-reports/r5rs.ps")))
 (download ((format "alternate")
            (link "http://swiss.csail.mit.edu/~jaffer/Scheme")))
 (copyright ,acm-copyright)
 (published ((in "Journal of Higher Order and Symbolic Computation")
             (issue "11(1)")
             (pages "7-105"))
)
 (note "Also appears in ACM SIGPLAN Notices 33(9), September 1998.")
 (date ((month "August")
        (year "1998")))
 (abstract "
    The report gives a defining description of the programming language
    Scheme. Scheme is a statically scoped and properly tail-recursive
    dialect of the Lisp programming language invented by
    Guy Lewis Steele Jr. and Gerald Jay Sussman.
    It was designed to have an exceptionally clear and simple semantics
    and few different ways to form expressions.
    A wide variety of programming paradigms, including imperative,
    functional, and message passing styles, find convenient expression
    in Scheme."))

(publication 
 (authors ,will-clinger)
 (title "Proper tail recursion and space efficiency")
 (download ((format "PS.GZ")
            (link "ftp://ftp.ccs.neu.edu/pub/people/will/tail.ps.gz")))
 (date ((month "June")
        (year "1998")))
 (copyright ,acm-copyright)
 (published ((in (span "Proceedings of the 1998 ACM Conference on "
                       (a ((href "http://www.cs.virginia.edu/pldi98"))
                          "Programming Language Design and Implementation")))
             (pages "174-185")))
 (abstract (div
            (p
"   The IEEE/ANSI standard for Scheme requires implementations to be
    properly tail recursive.  This ensures that portable code can rely
    upon the space efficiency of continuation-passing style and other
    idioms.  On its face, proper tail recursion concerns the efficiency
    of procedure calls that occur within a tail context.  When examined
    closely, proper tail recursion also depends upon the fact that
    garbage collection can be asymptotically more space-efficient than
    Algol-like stack allocation.")
            (p
"   Proper tail recursion is not the same as ad hoc tail call optimization
    in stack-based languages.  Proper tail recursion often
    precludes stack allocation of variables, but yields a well-defined
    asymptotic space complexity that can be relied upon by portable programs.")
            (p
"    This paper offers a formal and implementation-independent definition
    of proper tail recursion for Scheme.  It also shows how an entire
    family of reference implementations can be used to characterize
    related safe-for-space properties, and proves the asymptotic
    inequalities that hold between them."))))

(publication 
 (authors ,mitch-wand ,will-clinger)
 (title "Set constraints for destructive array update optimization")
 (download ((format "PS")
            (link "ftp://ftp.ccs.neu.edu/pub/people/wand/papers/iccl-98.ps")))
 (copyright ,acm-copyright)
 (date ((month "May")
        (year  "1998")))
 (published ((in (span "Proceedings of the IEEE Computer Society "
                       (a ((href "http://www.math.luc.edu/iccl98/")) 
                          "International Conference on Computer Languages 1998")))
             (pages "184-193")))
 (abstract (div (p"
    Destructive array update optimization is critical for writing
    scientific codes in functional languages.  We present set constraints
    for an interprocedural update optimization that runs in polynomial
    time.  This is a multi-pass optimization, involving interprocedural
    flow analyses for aliasing and liveness.")
                (p"
    We characterize the soundness of these analyses using small-step
    operational semantics.  We have also proved that any sound liveness
    analysis induces a correct program transformation."))))

(publication
 (authors ,will-clinger
          (a ((href "http://www.ccs.neu.edu/home/lth")) "Lars Hansen"))
 (copyright ,acm-copyright)
 (title "Generational garbage collection and the radioactive decay model")
 (download ((format "PS.GZ")
            (link "ftp://ftp.ccs.neu.edu/pub/people/will/radioactive.ps.gz")))
 (date ((month "June")
        (year "1997")))
 (published ((in "Proceedings of the 1997 ACM Conference on Programming Language
    Design and Implementation")
             (pages "97-108")))
 (abstract (div (p"
    If a fixed exponentially decreasing probability distribution is used
    to model every object's lifetime, then the age of an object gives no
    information about its future life expectancy.  This " (em "radioactive
    decay model") "implies that there can be no rational basis for
    deciding which live objects should be promoted to another generation.
    Yet there remains a rational basis for deciding how many objects to
    promote, when to collect garbage, and which generations to collect.")
                (p"
    Analysis of the model leads to a new kind of generational garbage
    collector whose effectiveness does not depend upon heuristics that
    predict which objects will live longer than others.")
                (p"
    This result provides insight into the computational advantages of
    generational garbage collection, with implications for the
    management of objects whose life expectancies are difficult to
    predict."))))

(publication 
 (authors ,will-clinger
          (a ((href "http://www.ccs.neu.edu/home/lth")) "Lars Thomas Hansen"))
 (title "Lambda, the ultimate label, or a simple optimizing compiler for Scheme")
 (download ((format "ACM") 
            (link "http://www.acm.org/pubs/citations/proceedings/lfp/182409/p128-clinger/")))
 (copyright ,acm-copyright)
 (date ((month "July") 
        (year "1994")))
 (published ((in "
    Proceedings of the 1994 ACM conference on LISP and Functional
    Programming, SIGPLAN Lisp Pointers")
             (issue "7(3) (July-September 1994)")
             (pages "128-139")))
 (abstract "
    Optimizing compilers for higher-order languages need not be terribly
    complex.  The problems created by non-local, non-global variables
    can be eliminated by allocating all such variables in the heap.
    Lambda lifting makes this practical by eliminating all non-local
    variables except for those that would have to be allocated on the
    heap anyway.  The eliminated non-local variables become local
    variables that can be allocated in registers.  Since calls to known
    procedures are just gotos that pass arguments, lifted lambda
    expressions are just assembly language labels that have been
    augmented by a list of symbolic names for the registers that
    are live at that label.
"
))

(publication 
 (authors "A.V.S. Sastry" ,will-clinger)
 (title "Parallel destructive updating in strict functional languages")
 (copyright ,acm-copyright)
 (download ((format "ACM")
            (link "http://www.acm.org/pubs/citations/proceedings/lfp/182409/p263-sastry/")))
 (date ((month "July-September")
        (year "1994")))
 (published ((in "Proceedings of the 1994 ACM conference on LISP and Functional
    Programming, SIGPLAN Lisp Pointers")
             (issue "7(3) (July-September 1994)")
             (pages "263-272")))
 (abstract "
    In [a previous] paper, we gave an efficient interprocedural update
    analysis algorithm for strict functional languages with flat arrays
    and sequential evaluation.  In this paper, we show that the same
    algorithm extends to a parallel functional language with additional
    constructs for partitioning and combining arrays.  Even with
    parallel evaluation, the complexity of the analysis remains polynomial.
    The analysis has been implemented and the results show that several
    numerical algorithms such as direct and iterative methods for solving
    linear equations, LU, Cholesky, and QR factorizations, multigrid
    methods for solving partial differential equations, and non-numeric
    algorithms such as sorting can be implemented functionally with all
    updates made destructive.  We describe a new array construct to
    specify a collection of updates on an array and show that problems
    like histogram, inverse permutation, and polynomial multiplication
    have efficient parallel functional solutions.  Monolithic array
    operators can be considered a special case of this new construct.
"
))

(publication
 (authors ,will-clinger
          (a ((href "http://mubble.net/jar")) "Jonathan Rees")
)
 (title "Macros that work")
 (copyright ,acm-copyright)
 (date ((year "1991")))
 (download ((format "tex.gz")
            (link "ftp://ftp.cs.indiana.edu/pub/scheme-repository/doc/prop/macros_that_work.tex.gz")))
 (published ((in "Proceedings of the 1991 ACM Conference on Principles of Programming Languages")
             (pages "155-162")))
 (abstract (div "
    This paper describes a modified form of Kohlbecker's algorithm
    for reliably hygienic (capture-free) macro expansion in block-structured
    languages.  Unlike previous algorithms, the modified algorithm runs
    in linear instead of quadratic [or exponential] time,
    copies few constants, does not assume that syntactic keywords
    (e.g. " (code "if") ") are reserved words,
    and allows local (scoped) macros to refer to lexical variables
    in a referentially transparent manner.")))

(publication
 (authors ,will-clinger)
 (title "How to Read Floating Point Numbers Accurately")
 (copyright ,acm-copyright)
 (date ((year "1990")))
 (download ((format "PS") 
            (link "ftp://ftp.ccs.neu.edu/pub/people/will/howtoread.ps")))
 (published ((in "Proceedings of the 1990 ACM Conference on Programming
    Language Design and Implementation")
             (pages "92-101")))
 (note (div "Reprinted, with a short "
            (a ((href"ftp://ftp.ccs.neu.edu/pub/people/will/retrospective.pdf")) "retrospective")
            " by the author, in "
            (em (a ((href "http://www.cs.utexas.edu/users/mckinley/20-years.html"))
                   "20 Years of the ACM SIGPLAN Conference on Programming Language
                    Design and Implementation (1979-1999): A Selection"))
            "Kathryn S. McKinley, Editor, ACM SIGPLAN Notices,  Volume 39, Number 4, April 2004."))
 (abstract (div (p"
    Consider the problem of converting decimal scientific notation
    for a number into the best binary floating point approximation
    to that number, for some fixed precision.  This problem cannot
    be solved using arithmetic of any fixed precision.  Hence the"
    (cite "IEEE Standard for Binary Floating-Point Arithmetic")
    "does not require the result of such a conversion to be the best
    approximation.")
                (p"
    This paper presents an efficient algorithm that always finds the
    best approximation.  The algorithm uses a few extra bits of
    precision to compute an IEEE-conforming approximation while
    testing an intermediate result to determine whether the
    approximation could be other than the best.  If the approximation
    might not be the best, then the best approximation is determined
    by a few simple operations on multiple-precision integers, where
    the precision is determined by the input.  When using 64 bits of
    precision to compute IEEE double precision results, the algorithm
    avoids higher-precision arithmetic over 99% of the time."))))

(publication 
 (authors ,will-clinger)
 (title "Macros in Scheme")
 (download ((format "PS.GZ") 
            (link "ftp://ftp.cs.indiana.edu/pub/scheme-repository/doc/prop/macinsch.ps.gz")))
 (date ((month "December") (year "1991")))
 (published ((in "Lisp Pointers")
             (issue "IV(4)")
             (pages "17-23"))))

(publication
 (authors ,will-clinger)
 (title "Hygienic macros through explicit renaming")
 (download ((format "PS.GZ")
            (link "ftp://ftp.cs.indiana.edu/pub/scheme-repository/doc/prop/exrename.ps.gz")))
 (date ((month "December") (year "1991")))
 (published ((in "Lisp Pointers")
             (issue "IV(4)")
             (pages "25-28"))))


(publication
 (authors ,will-clinger)
 (title "Compiler Optimization for Symbolic Languages")
 (date ((year "1987")))
 (download ((format "MPEG")
            (link "http://www.archive.org/download/WilliamC1987/WilliamC1987.mpeg")))
 (published () (span "49-minute video, University Video Communications, 1987.
Provided online at the " (a ((href "http://www.archive.org")) "Internet Archive Movie Archive"))))

(publication
 (authors ,will-clinger)
 (title "Foundations of Actor Semantics")
 (date ((year 1981)))
 (download ((format "PS")
            (link "ftp://publications.ai.mit.edu/ai-publications/500-999/AITR-633.ps")))
 (published () "MIT Artificial Intelligence Laboratory Technical Report 633, May 1981."))
))

)