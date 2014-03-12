#lang racket
(provide me)

(define me
  '(person "Mitch Wand"
    (group "Faculty")
    (picture "gallery/Mitch_Wand.jpg")
    (homepage "http://www.ccs.neu.edu/home/wand/")
    (bio (p "Professor Wand focuses on programming-language semantics and their application to compiler correctness.")
         (p "Throughout the 1990s, Professor Wand examined the verification of optimizing compilers, building an understanding of how a program analysis justifies the program transformation based upon it.")
         (p "Professor Wand has also explored the related area of type theory, particularly as applied to object-oriented programming. He has been a leader in the study of continuations, a technique for understanding the control structure of programs. With Daniel P. Friedman and Christopher T. Haynes, he wrote Essentials of Programming Languages, a widely used textbook. He is a Fellow of the Association for Computing Machinery."))))
