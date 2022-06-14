IWS:dialog{
	label="InterWorkSpace";
	:text{label="ATTENTION: 1. Please make sure a new/blank dwg is created as operation-file.";}
	:row{
	:spacer{width=9;}
	:text{label=" 2. Check if target folder is contained in a folder other then WORK etc.(eg, UNIT, PH...)";}

	}
	:row{
	:radio_column{label="PRO AREA"; key="PAREA";
		:radio_button{label="STRU"; key="STRU";}
		:radio_button{label="ARCH"; key="ARCH";}
		:radio_button{label="ELEC"; key="ELEC";}
		:radio_button{label="MECH"; key="MECH";}
		:radio_button{label="PLUM"; key="PLUM";}
		:radio_button{label="TELE"; key="TELE";}
		}
	:radio_column{label="TARGET SPACE";key="TSPACE";
		:radio_button{label="INTF"; key="intf";}	
		:radio_button{label="CHCK - from work"; key="cfw";}
		:radio_button{label="CHCK - from plot";key="cfp";}
		:radio_button{label="PLOT";key="plot";}
		:text{label="";}

		}
	}
		
	:row{:edit_box{label="FolderPath:";key="path";width=60;}
		:edit_box{label="Filter:";key="filter";width=3;}}
	
		
		
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
//how to create multilayer choice?
// a filter might be added
// create new dwgs for PH. set affix and body part, select num(from 1 to n)

NS:dialog{
  label="NewSerie";
  
  :row{label="I'd like to create a ... Serie";
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
