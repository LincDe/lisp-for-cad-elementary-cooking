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
