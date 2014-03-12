#lang scheme
(provide me)
(define me
  '(person "Richard Cobbe"
           (group "Alumni")
           (picture "gallery/cobbe.jpg")
           (homepage "http://www.ccs.neu.edu/home/cobbe/")
           (thesis "http://www.ccs.neu.edu/scheme/pubs/dissertation-cobbe.pdf")
           (graduated 2009)
           (bio "I received my PhD in January, 2009.  My thesis research proposed two changes to Java that remove the need for its \"null\" value by providing safer alternatives.  Specifically, Java programs use null in two primary ways: to indicate that a field is uninitialized, and as a rough encoding of the ML OPTION type.  My changes include a new object initialization mechanism that guarantees that all fields are initialized before their use and a safer two-way disjoint union to represent OPTION.")))
