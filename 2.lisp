(require :asdf)
(asdf:load-system :uiop)

(defun read-input () 
  (with-open-file (in "input")
    (read-line in)))

(let ((lst (mapcar 'parse-integer (uiop:split-string (read-input) :separator ","))))
  (loop for i from 0 to (length lst) by 4
       until (= 99 (nth i lst))
       do (print (nth i lst))))
