
;;;; Exercises for chapter 1

;;; 1.4
(defun sub2 (n)
    (- n 2))

;;; 1.5
(defun twop (n)
    (equal n 2))

;;; 1.6
(defun half (n)
    (/ n 2))

(defun half2 (n)
    (* n 0.5))

;;; 1.7
(defun multi-digit-p (n)
    (> n 9))

;;; 1.9
(defun add2 (n)
    (+ 2 n))

(defun twomorep (n m)
    (equal (add2 n) m))

;;; 1.10
(defun twomorep2 (n m)
    (equal n (sub2 m)))

;;; 1.11 average of two numbers is half their sum
(defun average (n m)
    (/ (+ n m) 2))

;;; 1.12
(defun more-than-half-p (n m)
    (> n (/ m 2)))

;;; 1.15
(defun not-onep (n)
    (not (equal n 1)))

;;; 1.16
(defun not-plusp (n)
    (< n 0))

;;; 1.17
(defun my-evenp (n)
    (not (oddp n)))

;;; 1.20
(defun xor (n m)
    (not (equal n m)))
