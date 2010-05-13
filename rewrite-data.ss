;conversion script
(module rewrite-data scheme

(define people
   '(
     ;; The bio field is an Xexpr.
     (group "Faculty"
            (person "William D. Clinger"
                    (picture "clinger-western2_squarecrop.jpg")
                    (homepage "http://www.ccs.neu.edu/home/will/")
                    (bio "He's from Texas (BS, 1975) but served time
in Massachusetts (PhD, MIT, 1981, and at Northeastern since 1994).
Collects garbage and lifts lambdas.  Plays guitar, sings with little
provocation, and has performed country and western tonal music."  ))
            (person "Matthias Felleisen"
                    (picture "Matthias_Felleisen.gif")  
                    (homepage "http://www.ccs.neu.edu/home/matthias/") 
                    (bio "For the past 25 years, I have lived in
Arizona, Indiana, Pennsylvania, and Texas. My PhD is from Dan
Friedman (1987), and I also wrote a number of Little books with
him. With my own PhD students, I authored How to Design Programs and
started the DrScheme project. In 2001, my entire team and I moved to
Boston to create PRL with Will, Mitch, and Karl."  ))
            (person "Karl Lieberherr" 
                    (picture "karl2.gif")
                    (homepage "http://www.ccs.neu.edu/home/lieber")
                    (bio " Karl Lieberherr got his PhD in Switzerland
and he likes mountains, lakes and yoga. He likes shy programming, be
it structure-shy, concern-shy, or module-shy."
                         ))
;       (person "David Lorenz"
;               (picture "lorenz_prl.jpg")
;               (homepage "http://www.ccs.neu.edu/home/lorenz"))
            (person "Panagiotis (Pete) Manolios"
                    (picture "Pete_Manolios.jpeg")
                    (homepage "http://www.cc.gatech.edu/~manolios/")
                    )
            (person "Viera K. Proulx"
                    (picture "proulx2.jpg")
                    (homepage "http://www.ccs.neu.edu/home/vkp/")
                    (bio "
                         I got my Ph.D. from Columbia University in 1977, and I've been at 
                         Northeastern ever since. I've always liked languages - whether programming 
                         or native or foreign - and recently joined the PL group. I am especially 
                         interested in teaching program design and creating artifacts to support 
                         learning. In my spare time I like mountains - to climb and ski, water to 
                         swim in and paddle on, and music of many kinds.
                         "
                         ))

            (person "Riccardo Pucella"
                    (picture "Riccardo_Pucella.jpg")
                    (homepage "http://www.ccs.neu.edu/home/riccardo/")
                    (bio "
                         I hail from Rimouski (Quebec, Canada), which is as unlike Texas
                         as you can imagine, and yet very much like Texas at the same
                         time. After studying at McGill University and Cornell University,
                         and putting in some time at Bell Labs and Microsoft Research, I
                         joined the PRL group in 2005. I tend to research topics in logic,
                         type systems, and semantics.
                         "
                         ))
            (person "Olin Shivers"
                    (picture "Olin_Shivers.jpg")
                    (homepage "http://www.ccs.neu.edu/home/shivers/")
                    )
            (person "Mitchell Wand"
                    (picture "wand.gif")
                    (homepage "http://www.ccs.neu.edu/home/wand/")
                    (bio "
                         I got my Ph.D. from MIT in 1973, and
                         I've been at Northeastern since 1985.  When I'm not thinking about
                         programming languages or other CS-related things, I
                         play jazz piano and dote on my twin granddaughters.
                         "
                         )))

     (group "Research Scientists"
            (person "Eli Barzilay"
                    (picture "Eli_Barzilay.jpg")
                    (homepage "http://www.barzilay.org/")
                    (bio "
                         He is Israeli by nature, a member of PLT by association.
                         Eli maintains a major part of PLT's infrastructure,
                         conducts research on language prototyping, and occasionally
                         teaches a course for the College.
                         "
                         ))

            #;(person "Paul Steckler"
            (picture "steckler.jpg")
            (homepage "http://www.ccs.neu.edu/home/steck/"))
            )

     (group "Visitors"
            )

     (group "Students"
            #;(person "Ahmed Abdelmohsen"
            (picture "ugly_me.jpg")
            (bio (blink "I couldn't be bothered to submit "
            "a picture and self-description.")))
            #;(person "J. Daniel Brown"
            (picture "ugly_me.jpg")
            (bio (blink "I couldn't be bothered to submit "
            "a picture and self-description.")))
            (person "Bryan D. Chadwick"
                    (picture "Bryan_Chadwick.jpg")
                    (homepage "http://www.ccs.neu.edu/home/chadwick/")
                    (bio " I received my Masters from Northeastern in
2005 and continued on, joining PRL later that year under Karl
Lieberherr.  I'm interested in most things PL, but am currently
looking at merging various ideas from functional programming with
those of Object Oriented data structure traversals.
                         "
                         ))
            (person "Benjamin J. Chambers"
                    (picture "Ben_Chambers.jpg")
                    (bio " I am a first-year PhD student interested
especially in functional languages and program analyses, but at this
point I'm pretty much open to anything in PL.  I did my undergraduate
at Georgia Tech, where I discovered my interest in PL after taking a
course in compilers.  In my free time I enjoy reading books and am
trying to learn to play Jazz piano (although I'm afraid I don't
actually have enough free time to do that).
                         "
                         ))
            (person "Richard C. Cobbe"
                    (picture "cobbe.jpg")
                    (homepage "http://www.ccs.neu.edu/home/cobbe")
                    (bio " I'm a sixth-year PhD student working with
Matthias Felleisen, and I hope to defend my thesis at the end of
summer 2008.  My thesis research involves proposing changes to Java
that remove the need for its \"null\" value by providing safer
alternatives.  Specifically, Java programmers use null in two primary
ways: to indicate that a field (local variable, etc.) is
uninitialized, and as a rough encoding of the ML OPTION type.  I
intend to address these uses by proposing a new object initialization
mechanism that removes the need for uninitialized values and by adding
a safer two-way disjoint union to the language."
                         ))
            (person "Ryan Culpepper"
                    (picture "Ryan_Culpepper.jpg")
                    (homepage "http://www.ccs.neu.edu/home/ryanc/")
                    (bio " Born in Houston, TX, left, went back to go
to Rice University.  Interested in PL and compilers. I read during the
summer and play table tennis during the winter. I'm still looking for
someone up here who has heard of disc golf."
                         ))
            (person "Peter Dillinger"
                    (picture "Peter_Dillinger.jpg")
                    (homepage "http://www.peterd.org/")
                    (bio " B.S., M.S., and doctoral work in Computer
Science at Georgia Tech from 1999 through 2007.  I came to
Northeastern in 2007 with advisor Pete Manolios.  My broad interests
include tools and techniques for development of correct systems.
Specifically, I have made contributions to explicit-state model
checkers including Spin, Murphi, and Java Pathfinder.  I have also
written a development environment for the ACL2 theorem prover called
ACL2s (for \"ACL2 Sedan\")."
                         ))
            (person "Christos Dimoulas"
                    (picture "christos.jpg")
                    (homepage "http://www.ccs.neu.edu/home/chrdimo/")
                    (bio (p "'Would you tell me, please, which way I ought to go from here?'"
                            (br) "'That depends a good deal on where you want to get to.'"
                            (br) "'I don't know where. . .'"
                            (br) "'Then it doesn't matter which way you go.' said the Cat."
                            (br) (span ((style "margin-left: 4em;")) 
                                       "-- Alice in Wonderland, Lewis Carroll")
                            )))
            (person "Carl Eastlund"
                    (picture "Carl_Eastlund.jpg")
                    (homepage "http://www.ccs.neu.edu/home/cce/")
                    (bio " A third-year student in the languages
group, I graduated with a CS degree from CMU in '01 and worked a
couple years in industry before coming here.  My interests lie mostly
in static analysis and functional software design.  Outside school, I
enjoy kung fu, card games and board games, and geeky fiction genres."
                         )
                    )
            #;(person "David Fisher"
            (picture "ugly_me.jpg")
            (bio (blink "I couldn't be bothered to submit "
            "a picture and self-description.")))
            (person "Jingsong Feng"
                    (picture "jingsong.jpg")
                    (bio " A second-year student in the programming
languages group. In 2003 I got my master degree in Linkoping
university in Sweden, then worked one year in China as a software
engineer before coming to Northeastern. Now I am working with
professor Karl Lieberherr on Aspect-oriented Software Development
related technologies. In my spare time, I like travel, watching
movies, playing online card games, and cooking."
                         ))
            #|
            (person "Rebecca Frankel"
            (picture "Rebecca_Frankel.jpg"))
            |#

       (person "Christine Hang"
               (picture "christine-hang.jpg")
               (homepage "http://www.ccs.neu.edu/home/danhang/")
               (bio "I am a third-year PhD student from Beijing and
Grand Rapids, Michigan. I am interested in PL, especially domain
specific languages, and I've always wanted to solve hard problems in
other fields via PL. Aside from school, I enjoy traveling, reading,
swimming, photography and collecting scarves.
"
))
       #;(person "Alec Heller"
               (picture "ugly_me.jpg")
               (bio (blink "I couldn't be bothered to submit "
                           "a picture and self-description.")))
       (person "Dave Herman"
               (picture "David_Herman.jpg")
               (homepage "http://www.ccs.neu.edu/home/dherman/")
               (bio " I've been a PhD student long enough not to want
to tell you what year I am.  I split my personalities between working
with Prof. Wand on the theory of hygienic macros and working on the
Ecma TG1 committee designing and specifying the next version of
JavaScript."
))
       (person "Felix Klock"
               (picture "Felix_Klock.jpg")
               (homepage "http://www.ccs.neu.edu/home/pnkfelix/")
               (bio 
                (p "I am a fifth-year Ph.D. student.  My background is
mostly in compiler technology, e.g. dataflow analysis and register
allocation.") 
                (p "I currently work with Will Clinger on garbage
collection of large heaps with hard asymptotic bounds on space and
soft bounds on pause times.") 
                (p"I am also a "(a ((href "http://larceny.ccs.neu.edu/")) "Larceny")
                " developer;  I have contributed to the development of
Common Larceny, the Larceny x86 code generator, and the Larceny
runtime.")  ))
       (person "Sergei Kojarski" 
               (picture "kojarski-sergei.jpg")
               (bio " I am a fourth-year PhD student. I came from
Perm, Russia.  My CS interests are in the PL field, particularly in
the Object-Oriented area.  Besides that I like to read classic
literature and just have fun with my friends...
"
))
       (person "Vassilis Koutavas"
               (picture "Vasileios_Koutavas.jpg")
               (homepage "http://www.ccs.neu.edu/home/vkoutav")
               (bio " I'm a Ph.D. student in PRL since 2003, and I
will probably graduate in 2008. I'm working with Mitch Wand on
reasoning about higher-order and imperative programs. Before coming to
Boston I was living in Greece, where I got my undergraduate degree
from the National Technical University of Athens. When I have the
chance, I like traveling, swimming, reading a good book, watching
movies, and playing with unix.
"
))
#|
            (person "Owen Landgren"
       (picture "Owen_Landgren.jpg"))
            |#

#|
            (person "Jeffrey Palm"
       (picture "jeffpalm.jpg")
       (homepage "http://www.ccs.neu.edu/home/jpalm/")
       (bio "
       I'm a Ph.D student as of Fall 2003... aside from this I could
       not live without my snowboard, guitar, or Scrabble board.
       "
       ))
            |#

#|
            (person "Greg Pettyjohn"
       (picture "pettyjohn.jpg")
       (homepage "http://www.ccs.neu.edu/home/gregp/")
       (bio "
       Rounding the bend on my third year as a Ph.D. student here at Northeastern.
       Received my undergraduate degree in mathematics in '94 from
       the University of Washington. Then I went out and found a job in the
       "real world" and eventually grew interested in functional programming languages.
       Recreational interests include, but not limited to: swing dancing, board gaming,
       and a long time ago I used to bicycle and I tried a little gymnastics.
       "
       ))
            |#
       #;(person "Jamie Raymond"
               (picture "raymond.jpg")
               (homepage "http://www.ccs.neu.edu/home/raymond/")
               (bio "
In a former life I taught high school chemistry and physics, now I'm
a PhD student interested in new programming languages for scientific 
research and also continue to be interested in teaching and learning of 
all kinds.
I hail from the metropolis of Altoona, Kansas (population 500 including 
dogs, cats, pigs, goats, and chickens - all present within the city 
limits).
"
))
       (person "Fabio Rojas"
               (picture "Fabio_Rojas.jpg")
               (homepage "http://www.ccs.neu.edu/home/frojas")
               (bio " Fabio Rojas is a PhD student. He works with Prof
Clinger on Garbage Collection and Macro Expansion.
"
))
       (person "Theo Skotiniotis"
               (picture "skotiniotis.jpg")
               (homepage "http://www.ccs.neu.edu/home/skotthe/")
               (bio " I joined Northeastern in 2001, and I am
currently working with Prof.  Lieberherr. Interests ... I used to have
a list of them written on a piece of paper on my desk, but I cannot
find it right now!"
))
       (person "Stevie Strickland"
               (picture "strickland.jpg")
               (homepage "http://www.ccs.neu.edu/home/sstrickl/")
               (bio "After spending six years at Georgia Tech as both
an undergrad and a grad student I came to Northeastern in 2004 for a
change in scenery and to pursue a PhD degree.  I took a break for a
couple of years to work in industry after my first year, so I'm
currently a second year student.  My research interests in the area of
programming languages include efficiently implementing functional
languages and type theory, and I'm currently doing research for
Matthias Felleisen."
))
       (person "Sam Tobin-Hochstadt"
               (homepage "http://www.ccs.neu.edu/home/samth/")
               (picture "Sam_TH.jpg"))
       (person "Aaron J. Turon"
               (picture "Aaron_Turon.jpg")
               (homepage "http://people.cs.uchicago.edu/~adrassi/")
               (bio " I'm a first-year PhD student in the
PRL. Interests in PL semantics, type theory, and logic. Outside of CS,
I write music (electronica), read novels, watch movies, and sometimes
talk philosophy. I am happily married and have two cats."  ))
       (person "Jesse Tov"
	       (picture "tov.jpg")
               (homepage "http://www.ccs.neu.edu/home/tov/"))
#|
            (person "Dale Vaillancourt"
       (picture "Dale_Vaillancourt.jpg")
       (homepage "http://www.ccs.neu.edu/home/dalev")
       (bio "
       I am a fourth-year Ph.D. student from Billerica, MA.  Within CS, I am
       interested in programming languages, software engineering, and
       education. I also enjoy tennis, chess, piano, biking, math, theater
       production, road trips, reading, and everything Italian (language,
       culture, food, etc.).
       "
       ))
            |#
       (person "Dimitris Vardoulakis"
               (homepage "http://www.ccs.neu.edu/home/dimvar/") 
               (picture "dimitris.jpg")
               (bio " I'm from Crete, Greece. I've been at
Northeastern since 2005. I'm working with Olin Shivers on various
static analyses and compiler optimizations for functional languages."
))
       (person "Pengcheng Wu"
               (picture "wupc.jpg")
               (homepage "http://www.ccs.neu.edu/home/wupc")
               (bio "PhD student in computer science, working on
programming languages and software engineering, especially on
Object/Aspect-oriented Software Development technologies."  ))

       (person "Feng Zhou"
               (picture "Feng_Zhou.jpg")
               (bio "I am first year graduate student in PRL. My
mentor is Will Clinger. I am interested in most aspects of programming
language research. I also like reading books, doing sports."  ))
)

(group "Alumni"
       (person "Philippe Meunier"
               (picture "meunier.jpg")
               (homepage "http://www.ccs.neu.edu/home/meunier")
               (thesis "http://www.ccs.neu.edu/scheme/pubs/dissertation-meunier.pdf")
               (bio " I spend most of my time in a faraway office
chasing geckos with a butterfly net.  I also occasionaly entertain
myself by chasing students.  Most of the students are too big for my
butterfly net though, so I have to use a red pen instead, which is
much harder.  Fortunately the students do not move as fast as the
geckos.  All my other activities are classified, but I'll still tell
you if you ask me nicely because I really love you.  I used to have a
rubber ducky named Bernard but it was impounded by a jealous Customs
official."  ))
       (person "John Brinckerhoff Clements"
               (picture "clements.jpg")
               (homepage "http://www.csc.calpoly.edu/~clements/index.html")
               (thesis "http://www.ccs.neu.edu/scheme/pubs/dissertation-clements.pdf")
               (bio "I have a family and a house and an hourglass on
my desk.  I will gladly tackle questions on functional programming,
debugging, annotation, and macros.  The rest of the questions you
should ask someone else."  ))
       (person "Johan Ovlinger"
               (graduated 2004)
               (homepage "http://www.ccs.neu.edu/home/johan"))
       (person "Galen Williamson"
               ;; (picture "williamson.jpg")
               (graduated 2004)
               (homepage "http://www.ccs.neu.edu/home/gwilliam")
               )
               
       (person "Paul Graunke"
               ;; (picture "graunke.jpg")
               (graduated 2003)
               (thesis "http://www.ccs.neu.edu/scheme/pubs/thesis-graunke.pdf")
               ;; (homepage "http://www.ccs.neu.edu/home/ptg/")
	)

       (person "Lars Hansen"
               (graduated 2001)
               (thesis "http://www.ccs.neu.edu/home/lth/thesis/index.html")
               (homepage "http://www.ccs.neu.edu/home/lth/"))


       (person "Igor Siveroni"
               (graduated 2001)
               (homepage "http://www.ccs.neu.edu/home/igor/"))

       (person "Greg Sullivan"
               (graduated 1997)
               (thesis "ftp://www.ccs.neu.edu/pub/people/wand/papers/sullivan-thesis-97.ps")
               (now-at "MIT")
               (homepage "http://www.ai.mit.edu/~gregs"))

       (person "David Gladstein"
               (graduated 1996)
               (thesis "ftp://www.ccs.neu.edu/pub/people/wand/papers/gladstein-thesis-94.ps.Z"))
       
       (person "Paul Steckler"
               (graduated 1994)
               (thesis "ftp://www.ccs.neu.edu/pub/people/wand/papers/steckler-thesis-94.ps")
               (homepage "http://www.ccs.neu.edu/home/steck/"))
       
       (person "Dino Oliva"
               (graduated 1992)
               (thesis "ftp://www.ccs.neu.edu/pub/people/wand/papers/oliva-thesis-94.ps.Z")
               (homepage "http://cm.bell-labs.com/cm/cs/who/oliva/"))
)

(group "Former Members"
       (person "Joe Marshall"
               (picture "marshall.jpg")
               ;(homepage "http://home.attbi.com/~prunesquallor/")
               (bio (div (p " I was born the son of a poor black
sharecropper.  My fathers family name being Marshall, and my christian
name Joseph, my infant tongue could make of both names nothing longer
or more explicit than Joseph Marshall.  So, I called myself Joseph
Marshall, and came to be called Joseph Marshall.") (p "Some years ago
--- never mind how long precisely --- having little or no money in my
purse and nothing particular to interest me on shore, I thought I
would sail about a little and see the watery part of the world."))  ))
       (person "Kenichi Asai"
               (homepage "http://www.ccs.neu.edu/home/asai")
               (picture "asai.jpg")
               (bio " I am visiting Mitch's group for a year until the
end of February 2005.  I am interested in partial evaluation,
reflection, continuations, etc.  On leave from Ochanomizu University,
Tokyo, Japan.My " (a ((href "http://pllab.is.ocha.ac.jp/~asai/")) "web
page") "there."  ))

 )))
        
  (define (map* fn sexp)
    (cond [(empty? sexp) '()]
          [(pair? sexp) (cons (map* fn (car sexp))
                              (map* fn (cdr sexp)))]
          [else (fn sexp)]))

  (define (string-cleaning a)
    (cond [(string? a) (regexp-replace* "( |\n)+" a " ")]
          [else a]))
  




  (for-each
   (lambda (group)
     (let ((gname (cadr group)))
       (for-each 
        (lambda (person)
          (let* ((name (cadr person))
                 (schemier-name 
                  (string-downcase
                   (regexp-replace* "[^a-zA-Z -]"
                                    (regexp-replace* " " name "-")
                                    ""))))
            (call-with-output-file (string-append "content/people/" schemier-name ".ss")
              #:exists 'replace
              (lambda (out)
                (fprintf out "~s~%" 
                         (map* string-cleaning
                               `(module ,(string->symbol schemier-name) scheme
                                  (provide me)
                                  (define me 
                                    '(person ,(cadr person) ;name
                                             (group ,gname)
                                             ,@(cddr person))))))))
            ))
        (cddr group)) ;members
       ))
   people)
  )