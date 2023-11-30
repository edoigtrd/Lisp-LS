#!/usr/bin/sbcl --script

(require :asdf)

(asdf:load-system :uiop)

(defun help ()
    (format t "Usage: ./main.lisp [options] [file ...]")
    (fresh-line)
    (quit)
)

(if
(member "-h" (uiop:command-line-arguments) :test #'string-equal)
(help)
)

(defun prettyprint (file)
  (format t (namestring file))
  (fresh-line)
)


(defvar path (uiop/os:getcwd))

(defvar files 
  (uiop:directory-files path)
)

(mapcar #'prettyprint files)


(quit)
