# Create a dialog box
It is convenient to use a dialog box if a bunch of parameters need to be decided before we can run the program. To start a dialog box, first a dcl file should be created in Visual Lisp Compiler.  
Form to start a dialog:
```
NAME:dialog{
  label="title of the dialog"
  
}
```
You can add boxed_row, boxed_columns, text, button to the dialog, for example:
```
:boxed_row{label="name"; key="key"
}
:text{label="text"}
:edit_box{label="label";key="key"}
```
A dialog will be like this:
```
NS:dialog{
  label="NewSerie";
  
  :radio_row{label="I'd like to create a ... Serie"; key="ftp";
  :radio_button{label="Folder";key="fd";}
  :radio_button{label="Dwg";key="dwg";}
  }
  
  :row{label="";}
  
  :boxed_row{label="Set FileName:";
  :edit_box{label="Affix";key="fafx";}
  :text{label="    ----  ";}
  :edit_box{label="Number";key="fnmb";}
  :text{label="    ----  ";}
  :edit_box{label="BodyPart";key="fbp";}

  }
  :edit_box{label="SeriePath:"; key="fpth";}

  :text{label="Eg1: Folder Serie from \"H01\" to \"H13\".( Affix \"H\", Number \"13\", BodyPart \"\".)";}
  :text{label="Eg2: Dwg Serie from \"H01-FORM-P.dwg\" to \"H13-FORM-P.dwg\". ( Affix \"H\", Number \"13\", BodyPart \"FORM\".)";}
  :text{label="Attention: If you wish to create a New DWG Serie, please make sure that a new dwg file is created as opration-file.";}
  
  : boxed_row { :spacer{width=10;}
              : button {
                key = "accept";
                label = " Okay ";
                is_default = true;
              }
              :spacer{width=10;}
              : button {
                key = "cancel";
                label = " Cancel ";
                is_default = false;
                is_cancel = true;
              }
              :spacer{width=10;}
            }
}
```
  
# Corresponding Change in the lsp File
In lsp file we should add several lines to connect lsp file and corresponded dcl file.
```
  ;;;--- Load the dcl file
  (setq dcl_id (load_dialog "dcl-filename.DCL"))
  ;;;--- Load the dialog definition if it is not already loaded
  (if (not (new_dialog "dialog-name" dcl_id) ) (exit))
  ;;;--- Display the dialog box
  (start_dialog)
  ;;;--- Unload the dialog box
  (unload_dialog dcl_id)
```
action_tile and get_tile mean that once some actions occured in the box, the newest value will be returned and saved.
```
  (action_tile "x" "(setq *x* (get_tile \"x\"))")
```
*x* is just a way to distinguish key x in the dcl file and it has no other special meanings.
Note that the whole get_tile sentence is put in "".  
Example of a complete lsp programme:
```
(defun c:NS() 
  ;;;--- Load the dcl file
  (setq dcl_id (load_dialog "ns.DCL"))
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
  ```
  # Launch a wizard
 
  If your program contains dcl files or anykind of files other then lsp file, choose professional mode.  
  You can add several lsp files and dcl files following the prompts to create a vlx file, which means you can pack several plug-in modules together.
