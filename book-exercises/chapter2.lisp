;;; 2.18
(defun form-list (n m )
    (cons n m))

;;; executes like: (replace-first-element '(first second third) 'primeiro)
(defun replace-first-element (list new-element)
    (cons new-element (rest list)))

;;; 2.21
(defun create-two (a b c d)
    (list (list a b) (list c d)))

;;; 2.22
(defun duo-cons (elementA elementB list) 
    (cons elementA (cons elementB list)))

;;; 2.23 two deep
(defun two-deep (elem)
    (list (list elem)))