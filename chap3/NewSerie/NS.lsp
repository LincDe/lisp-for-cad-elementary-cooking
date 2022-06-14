;create new folders. naming-rule: affix + number. path: entered by user
(defun folderserie(affix number path)
  (setq i 1)
  (setq a "0")
  (while (<= i number)
    (if (= i 10)(setq a ""))
    (setq direc (strcat path "\\" affix a (itoa i)))
    (vl-mkdir direc)
    (setq i (+ i 1))
    )
  )
;create new dwgs. naming-rule: affix + number + body part. path: entered by user

(defun dwgserie(affix number bodypart path)
  (setq i 1)
  (setq a "0")
  (while (<= i number)
    (if (= i 10) (setq a ""))
    (setq direc (strcat path "\\" affix  a (itoa i) "-" bodypart "-P.dwg"))
    (command "SAVEAS" "2013" direc)
    (setq i (+ i 1))
    )
 )
;(dwgserie "h" 3 "form" "F:\\Z\\DUMMY-50-11\\00_Workshop\\04_CD\\STRU\\WORK\\FORM")


(defun c:NS() 
  ;;;--- Load the dcl file
  (setq dcl_id (load_dialog "E:\\vlapp\\LINC\\ns.DCL"))
  ;;;--- Load the dialog definition if it is not already loaded
  (if (not (new_dialog "NS" dcl_id) ) (exit))
  (action_tile "ftp" "(setq *ftp* (get_tile \"ftp\"))")
  (action_tile "fafx" "(setq *fafx* (get_tile \"fafx\"))")
  (action_tile "fnmb" "(setq *fnmb* (get_tile \"fnmb\"))")
  (action_tile "fbp" "(setq *fbp* (get_tile \"fbp\"))")
  (action_tile "fpth" "(setq *fpth* (get_tile \"fpth\"))")
  ;;;--- Display the dialog box
  (start_dialog)
  ;;;--- Unload the dialog box
  (unload_dialog dcl_id)

  (setq *fnmb* (atoi *fnmb*))
  (cond
    ((= *ftp* "fd") (print "create folders")(folderserie *fafx* *fnmb* *fpth*))
    ((= *ftp* "dwg") (print "create dwgs")(dwgserie *fafx* *fnmb* *fbp* *fpth*))
    )

  
  )

