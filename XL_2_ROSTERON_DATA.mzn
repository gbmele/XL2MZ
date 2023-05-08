%%  KEY INTS
%%  STAFF   -- getempnum  --getrole
%%  DATES   -- getday


%%%%%%
%%    key integers 
%%%%%%


int: monday     = 1;    
int: tuesday    = 2;
int: wednesday  = 3;
int: thursday   = 4;
int: friday     = 5; 
int: saturday   = 6;  
int: sunday     = 0;  

set of int: mondays    = {d | d in days where d mod 7 = monday   };
set of int: tuesdays   = {d | d in days where d mod 7 = tuesday  };
set of int: wednesdays = {d | d in days where d mod 7 = wednesday};
set of int: thursdays  = {d | d in days where d mod 7 = thursday };
set of int: fridays    = {d | d in days where d mod 7 = friday   };
set of int: saturdays  = {d | d in days where d mod 7 = saturday };
set of int: sundays    = {d | d in days where d mod 7 = sunday   };


set of int: weekdays = {d | d in days where d mod 7 in {monday,tuesday, wednesday, thursday, friday}};
set of int: weekends = {d | d in days where d mod 7 in {saturday, sunday}};


%%%%%%
%%         get_empnum
%%%%%%



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
        elseif doc = TB then 53686  %% Teresa Bridgart
        
        else 8888888
        endif;

    
%%%%%%
%%      GET_ROLE
%%%%%%

 
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

%%%%%%
%%       get_day (dates)  
%%%%%%


function string: get_day(days: d) = 
if     d = 1 then "15/05/2023"
elseif d = 2 then "16/05/2023"
elseif d = 3 then "17/05/2023"
elseif d = 4 then "18/05/2023"
elseif d = 5 then "19/05/2023"
elseif d = 6 then "20/05/2023"
elseif d = 7 then "21/05/2023"
elseif d = 8 then "22/05/2023"
elseif d = 9 then "23/05/2023"
elseif d = 10 then "24/05/2023"
elseif d = 11 then "25/05/2023"
elseif d = 12 then "26/05/2023"
elseif d = 13 then "27/05/2023"
elseif d = 14 then "28/05/2023"
elseif d = 15 then "29/05/2023"
elseif d = 16 then "30/05/2023"
elseif d = 17 then "31/05/2023"
elseif d = 18 then "01/06/2023"
elseif d = 19 then "02/06/2023"
elseif d = 20 then "03/06/2023"
elseif d = 21 then "04/06/2023"
elseif d = 22 then "05/06/2023"
elseif d = 23 then "06/06/2023"
elseif d = 24 then "07/06/2023"
elseif d = 25 then "08/06/2023"
elseif d = 26 then "09/06/2023"
elseif d = 27 then "10/06/2023"
elseif d = 28 then "11/06/2023"
elseif d = 29 then "12/06/2023"
elseif d = 30 then "13/06/2023"
elseif d = 31 then "14/06/2023"
elseif d = 32 then "15/06/2023"
elseif d = 33 then "16/06/2023"
elseif d = 34 then "17/06/2023"
elseif d = 35 then "18/06/2023"
elseif d = 36 then "19/06/2023"
elseif d = 37 then "20/06/2023"
elseif d = 38 then "21/06/2023"
elseif d = 39 then "22/06/2023"
elseif d = 40 then "23/06/2023"
elseif d = 41 then "24/06/2023"
elseif d = 42 then "25/06/2023"
elseif d = 43 then "26/06/2023"
elseif d = 44 then "27/06/2023"
elseif d = 45 then "28/06/2023"
elseif d = 46 then "29/06/2023"
elseif d = 47 then "30/06/2023"
elseif d = 48 then "01/07/2023"
elseif d = 49 then "02/07/2023"
elseif d = 50 then "03/07/2023"
elseif d = 51 then "04/07/2023"
elseif d = 52 then "05/07/2023"
elseif d = 53 then "06/07/2023"
elseif d = 54 then "07/07/2023"
elseif d = 55 then "08/07/2023"
elseif d = 56 then "09/07/2023"
elseif d = 57 then "10/07/2023"
elseif d = 58 then "11/07/2023"
elseif d = 59 then "12/07/2023"
elseif d = 60 then "13/07/2023"
elseif d = 61 then "14/07/2023"
elseif d = 62 then "15/07/2023"
elseif d = 63 then "16/07/2023"
elseif d = 64 then "17/07/2023"
elseif d = 65 then "18/07/2023"
elseif d = 66 then "19/07/2023"
elseif d = 67 then "20/07/2023"
elseif d = 68 then "21/07/2023"
elseif d = 69 then "22/07/2023"
elseif d = 70 then "23/07/2023"
else    "nuffin"
endif; % end of the big if



