;;; basic operations
;;; 1. decisions - cond and if
(cond   (test1    action1)
        (test2    action2)
	     ...
	    (testn   actionn))
(if (test) (true-action1) (false-action2))

;;; 2. loops
(while (condition1) (action1)(action2)(...))

;;; 3. arithmetic: + - * /
;;; c=a+b, d=e/f
(setq c (+ a b))
(setq d (/ e f))

;;; 3.comparison and logical operation
;;; if a=b?
(== a b)
;;; a!=b?
(!= a b)
;;; a>=b?
(>= a B)

;;; 4.strings
;;; concact several strings
(strcat "str1" "str2" "str3")
;;; exchange part of the string (exchange str1 wi)
(vl-string-subst "str2" "str1" "str which contains str1")
;;; integer to string
(setq str1 (itoa num))
;;; string to integer
(setq num1 (atoi str))

;;; 5.connections with CAD
;;; command
(command "shortcut key" "...")
;;; ssget and entget
(ssget [sel-method] [pt1 [pt2]] [pt-list] [filter-list])
(entget (car (entsel))
;;; car & cdr
;;; car: Contents of the Address part of the Register
;;; cdr: Contents of the Decrement part of the Register
