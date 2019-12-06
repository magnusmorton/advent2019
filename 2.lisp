(require :asdf)
(asdf:load-system :uiop)

(defun read-input () 
  (with-open-file (in "input")
    (read-line in)))

(let ((lst (mapcar 'parse-integer (uiop:split-string (read-input) :separator ","))))
  (loop for i from 0 to (length lst) by 4
       until (= 99 (nth i lst))
     do
       (let* ((val (nth i lst))
             (pos1 (nth (+ i 1) lst))
             (pos2 (nth (+ i 2) lst))
             (pos3 (nth (+ i 3) lst))
             (arg1 (nth pos1 lst))
             (arg2 (nth pos2 lst)))
         (cond ((= 1 val) (setf (nth pos3 lst) (+ arg1 arg2)))
               ((= 2 val) (setf (nth pos3 lst) (* arg1 arg2))))))
  lst)

