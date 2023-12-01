#!/bin/sbcl --script

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

(defun get_show_name (file)
  (if (string-equal (namestring file) (namestring (uiop:resolve-symlinks file))) (return-from get_show_name (namestring file)) )
		(return-from get_show_name
  		(concatenate 'string (namestring file) " --> " (namestring (uiop:resolve-symlinks file)))
		) 
)




(defun tryrev (filename)
(if
(member "-rev" (uiop:command-line-arguments) :test #'string-equal)
(return-from tryrev (reverse filename))
)
(return-from tryrev filename)
)

(defun prettyprint (file)
  (format t (tryrev (namestring (get_show_name file))))
  (fresh-line)
)

(defvar path (uiop/os:getcwd))

(defvar files 
  (uiop:directory-files path)
)

(mapcar #'prettyprint files)


(quit)
