;;; eg4
(defun C: L2()
  (setq a (getstring "\n enter (x1,y1)：")) ;;; "500,500"
  (setq b (getstring "\n enter (x2,y2)：")) ;;; "3000,3000"
  (command "LINE" a b "")
  )

