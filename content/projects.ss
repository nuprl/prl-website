;; -*- scheme -*-
(module projects scheme

 (require (for-syntax scheme/string))

 (provide page)

 (define-syntax project
   (lambda (syn)
     (syntax-case syn (homepage faculty description)
       [(_ proj-name (_ url) (_ fac ...) (_ desc ...))
        #` `(div
             (h2  (a ((href url)) proj-name)
                  " (" ,(string-join (list fac ...) ", ") ")")
             desc ...)])))

 (define page
   `(div
     ,(project "PLT Scheme"
               (homepage "http://www.plt-scheme.org/")
               (faculty "Felleisen")
               (description 
                (p "PLT Scheme is an umbrella name for a family of
projects. PLT is the distributed group of people who produced
DrScheme, the underlying implementation language MzScheme, and many
teaching-oriented tools. The current projects include: the design and
implementation of language extensions for Scheme; the design and
implementation of innovative programming environment tools; the design
and implementation of teaching subsets of, and teaching tools for,
Java; the study of interactive web programming via continuation-based
servers; and the exploration of the role of interface contracts in
program design. This work is currently supported by two NSF grants.")
                (p "TeachScheme! is a PLT project whose objective it is to
turn Computing and Programming into an indispensable part of the
liberal arts curriculum. The TeachScheme! project is now its 10th
year, and is supported by a multi-institution NSF grant and a donation
from CORD.  Felleisen and Proulx are now investigating how to
generalize the lessons of TeachScheme! to an object-oriented language
such as Java.")
                (p "Clinger and Felleisen are currently developing a version
of Scheme on the .NET platform; this work (joint with Will Clinger) is
supported by a gift from Microsoft Research. The eventual goal is to
have a second implementation of MzScheme for scripting Microsoft's
class framework for the CLR.")))

    ,(project "Demeter"
              (homepage "http://www.ccs.neu.edu/home/lieber/demeter.html")
              (faculty "Lieberherr" 
                       ;;"Lorenz"
                       )
              (description
               (p "The goal of the Demeter project is to improve on current
leading-edge software development practices using ideas from
programming languages and software engineering. Our focus is on
Separation of Concerns (SOC) technology, in particular on adaptive
programming and aspect-oriented programming." )))

    ,(project "Generational Garbage Collection"
              (homepage "http://www.ccs.neu.edu/home/will/GC/index.html")
              (faculty "Clinger")
              (description 
               (p "This work seeks to find new algorithms for generational
garbage collection and to explore, both experimentally and
theoretically, the behavior of garbage collection algorithms.  This
work is supported by a Sun Collaborative Research grant and by the "
                  (a ((href "http://www.nsf.gov"))
                     "National Science Foundation")
                  " under grant CCR-0208722.") ))

    ,(project "Analysis-Based Program Transformation"
              (homepage "http://www.ccs.neu.edu/home/wand/research/analysis-transformation.html")
              (faculty "Wand")
              (description 
               (p "We are interested in understanding just how a program
analysis justifies the program transformation that is typically based
upon it.  We have studied a sequence of analysis-based
transformations, including offline partial evaluation, lightweight
closure conversion, useless variable elimination, and destructive
update introduction.  We seek to extend this work to context- and
flow-dependent analyses, and to languages in which procedures may be
invoked implicitly via events, callbacks, or aspects.  This work is
supported by the "
                  (a ((href "http://www.nsf.gov")) "National Science Foundation")
                  " under grant CCR-0097740. ("
                  (a ((href "http://www.ccs.neu.edu/home/wand/semantics/analysis-papers.html")) 
                     "recent papers") 
                  ")") ))

    ,(project "Semantics of Programming Languages"
              (homepage "http://www.ccs.neu.edu/home/wand/research/semantics.html")
              (faculty "Wand")
              (description 
               (p "We are interested in various aspects of the semantics of
programming languages, including operational semantics of monads,
semantics of aspect-oriented programming, and compiler correctness.")
               ))

    ,(project "Logic Across the Curriculum"
              (homepage "http://www.teachlogic.org")
              (faculty "Felleisen")
              (description 
               (p "Logic is to computer science and software engineering
what calculus is to physics and engineering. The project's goal is to
integrate logic into all aspects of the computer science curriculum so
that students understand how logic helps with the most fundamental
task of our science, programming and system design. This is joint work
with Moshe Vardi at Rice and Phoikon Kolaitis at UCSC and is supported
by the " (a ((href "http://www.nsf.gov")) "National Science Foundation") ".")
               ))
    ))
 
 )