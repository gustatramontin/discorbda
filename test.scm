(load "main.scm")
(load "token.scm")

(import discorbda)
(import token)

(define +token+ bot-token)

(display (users/get-me))
