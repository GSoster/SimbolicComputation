(defun hello ()
  (write-line "What is your name?")
  (let ((name (read-line)))
    (format t "Hello, ~A.~%" name)))


  ;;; 3.22.c
  (defun my-func (symA symB)
    (list (list symA) symB))

  ;;; 3.22.d
  (defun firstp (sym list)
    (EQUAL sym (first list)))

;;; 3.22.e


(defun my-cond (x)
  ( COND (symp x) 'symbol))
