#!/usr/bin/sbcl --script

(require :asdf)

(asdf:load-system :uiop)


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
