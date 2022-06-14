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


