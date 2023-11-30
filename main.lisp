#!/usr/bin/sbcl --script

(require :asdf)

(asdf:load-system :uiop)

(defun help ()
    (format t "Usage: ./main.lisp [options] [file ...]")
    (fresh-line)
    (format t "Options:")
    (fresh-line)
    (format t "  -h  --help  Display this information")
    (fresh-line)
    (format t "  -rev  Reverse the files names")
    (fresh-line)
    (quit)
)

(if
(member "-h" (uiop:command-line-arguments) :test #'string-equal)
(help)
)

(defun prettyprint (file)
  (setf file (pathname-name file))
  (if
    (member "-rev" (uiop:command-line-arguments) :test #'string-equal)
    (setf file (reverse file))
  )
  (format t file)
  (fresh-line)
)


(defvar path (uiop/os:getcwd))

(defvar files 
  (uiop:directory-files path)
)

(mapcar #'prettyprint files)


(quit)
