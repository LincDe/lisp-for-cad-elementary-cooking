(defun c:IWS()

  ;;;--- Load the dcl file
  (setq dcl_id (load_dialog "iws.DCL"))
  ;;;--- Load the dialog definition if it is not already loaded
  (if (not (new_dialog "IWS" dcl_id) ) (exit))
  (if (= *parea* nil) (setq *parea* "STRU"))
  (if (= *tspace* nil)(setq *tspace* "INTF"))
  (if (or (= *path* "")(= *path* nil))
    (setq *path* "Enter folder path here."))
  (if (or (= *filter* "") (= *filter* nil))
    (setq *filter* ""))
  ; set init value
  (set_tile "PAREA" *parea* )
  (set_tile "TSPACE" *tspace*)
  (set_tile "path" *path*)
  (set_tile "filter" *filter*)
  ;;;--- If an action event occurs, do this function
  (action_tile "PAREA" "(setq *parea* (get_tile \"PAREA\"))")
  (action_tile "TSPACE" "(setq *tspace* (get_tile \"TSPACE\"))")
  (action_tile "path" "(setq *path* (get_tile \"path\"))")
  (action_tile "filter" "(setq *filter* (get_tile \"filter\"))")
  (action_tile "accept" "(done_dialog)") 
  (action_tile "cancel" "(done_dialog)")
;;;"""""PROBLEM1"""""
;;;  (if (= (action_tile "sh"  "(getpath)") T)
;;;    (setq *path* result)
;;;    (set "path" *path*)
;;;	 )
;;;  """"
  ;;;--- Display the dialog box
  (start_dialog)
  ;;;--- Unload the dialog box
  (unload_dialog dcl_id)

  ;;;SET VARIANTS FOR EXCHANGE PART OF PATHS AND FILE-NAMES 
  (cond
    ((= *tspace* "intf") (setq ofder "WORK")(setq nfder "INTF")(setq affix (strcat *parea* "-"))  )
    ((= *tspace* "cfw") (setq ofder "WORK")(setq nfder "CHCK\\AUDIT")(setq affix "CHCK-") )
    ((= *tspace* "cfp") (setq ofder "PLOT")(setq nfder "CHCK\\AUDIT")(setq affix "CHCK-") )
    ((= *tspace* "plot") (setq ofder "WORK")(setq nfder "PLOT")(setq affix "PLOT-") )
    )

  ;;;START LOOP FOR XA AND DE-XA
  (setq npath (vl-string-subst nfder ofder *path*))
  (if (= (findfile npath) nil)
	  (vl-mkdir npath))
  ;create new folder in target space if not exists
  
  (setq wkfiles (vl-directory-files *path* (strcat "*" *filter* "*.dwg")))
  ;***select dwg files *** a filter will be add to it !
  (setq i 0)
  (setq endi  (length wkfiles))	  
  (while (< i endi)
	  (setq wkpath (strcat *path* "\\" (nth i wkfiles)))
	  (command "-XREF")
	  (command "A" )
	  (command wkpath)
	  (command "0,0,0");插入点0,0,0
	  (command "1");x比例1
   	  (command "1");y比例1
  	  (command "0");
	  (setq nfname  (nth i wkfiles))
          (if (= *tspace* "cfp")
	    (setq nfname (vl-string-subst "" "PLOT-" nfname))
	    )
;;;    	  (if (= (findfile (strcat npath "\\" affix (nth i wkfiles))) T)
;;;	    (alert "already exist!"))
	  (command "SAVEAS" "2013" (strcat npath "\\" affix (nth i wkfiles)) )


	  (command "-XREF")
	  (command "D")
	  (command (vl-string-subst "" ".dwg" (nth i wkfiles)))
	       ;逐一参照进temp文件并另存,另存后拆离该文件进行下一次参照。"
	  (setq i (+ i 1))
	  (if (= i endi)
	    (print (strcat  affix "ed! We appreciate your effort."))
	    )
	  )


 )


  

;;;"don't forget to add folder browser and filter feature."
;;;(defun getpath()
;;;  (vl-load-com)
;;;  (command "cmdecho" 0)
;;;  (setq sh (vla-getInterfaceObject (vlax-get-acad-object) "Shell.Application" ))
;;;  (setq folder (vlax-invoke-method sh 'BrowseForFolder 0 "" 0 ))
;;;  (vlax-release-object sh)
;;;  (setq folderobject (vlax-get-property folder 'Self))
;;;  (setq result (vlax-get-property FolderObject 'Path))
;;;  )
