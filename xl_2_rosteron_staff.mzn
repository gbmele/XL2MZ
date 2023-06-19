
function int: get_empnum(docs: doc) =
        if     doc = RG then 40168
        elseif doc = GM then 11148
        elseif doc = DB then 16429 
        elseif doc = CC then 11439
        elseif doc = MC then 12051
        elseif doc = SD then 25847
        elseif doc = HL then 26265
        elseif doc = ML then 11981
        elseif doc = DL then 42837
        elseif doc = RM then 24402
        elseif doc = GN then 17997
        elseif doc = EW then 50248
        %PT
        elseif doc = LB then 22958
        elseif doc = DH then 46478
        elseif doc = SK then 40421
        elseif doc = BL then 54032
        elseif doc = CP then 10446
        elseif doc = AR then 27323
        elseif doc = RP then 21703
        elseif doc = LS then 60339
        elseif doc = AV then 55369
        elseif doc = LC then 47088
        elseif doc = KM then 46794
        elseif doc = DZ then 53765
        elseif doc = BB then 60403
        elseif doc = JD then 62948
        elseif doc = CK then 27601
        elseif doc = NM then 56981  %% Nele Manzanares
        elseif doc = TB then 77777  %% Teresa Bridgart
        
        else 8888888
        endif;
  

 
function string: get_role(docs: doc) =
        if     doc = RG then rg_role 
        elseif doc = GM then gm_role
        elseif doc = DB then FT_role 
        elseif doc = CC then FT_role
        elseif doc = MC then FT_role
        elseif doc = SD then FT_role
        elseif doc = HL then FT_role
        elseif doc = ML then PT_role
        elseif doc = DL then FT_role
        elseif doc = RM then FT_role
        elseif doc = GN then FT_role
        elseif doc = EW then FT_role
        %PT
        elseif doc = LB then PT_role
        elseif doc = DH then PT_role
        elseif doc = SK then PT_role
        elseif doc = BL then PT_role
        elseif doc = CP then PT_role
        elseif doc = AR then PT_role
        elseif doc = RP then PT_role
        elseif doc = LS then PT_role
        elseif doc = AV then PT_role
        elseif doc = LC then PT_role
        elseif doc = KM then sess_role
        elseif doc = DZ then sess_role
        elseif doc = KM then sess_role
        elseif doc = BB then PT_role
        elseif doc = JD then sess_role
        elseif doc = CK then sess_role
        elseif doc = NM then sess_role
        elseif doc = TB then sess_role
        
        else "nuffin"
        endif;
