%% teresa empl number and area and role

%% will have to do public holiday not worked

%% ssu oncall incharge shoulbe be able to be calculated

include "globals.mzn";
include "xl_2_rosteron.dzn";

include "xl_2_rosteron_staff.mzn";


include "roster_on_output.mzn";
include "rosteron_dump.mzn";

%include "xl_2_rosteron_ssu_oncall.mzn";

array[docs,days] of var shifts: roster;



%DISPATCH  REQUESTS ints -> ROSTER shifts

constraint forall(doc in docs  , day in 1..DAYS)
   (     if REQUESTS[ doc, day]  = 0   then roster[ doc, day]     = o
     elseif REQUESTS[ doc, day ] = 1   then roster[ doc, day ]    =  a
     elseif REQUESTS[ doc, day ] = 2   then roster[ doc, day ]    =  p
     elseif REQUESTS[ doc, day ] = 4   then roster[ doc, day ]    =  c
     elseif REQUESTS[ doc, day ] = 41  then roster[ doc, day ]    =  l % AL
     elseif REQUESTS[ doc, day ] = 42   then roster[ doc, day ]   =  l % CONF
     elseif REQUESTS[ doc, day ] = 43   then roster[ doc, day ]   =  l % LSL
     elseif REQUESTS[ doc, day ] = 44   then roster[ doc, day ]   =  l % PAT
     elseif REQUESTS[ doc, day ] = 45   then roster[ doc, day ]   =  l % MAT
     elseif REQUESTS[ doc, day ] = 46   then roster[ doc, day ]   =  l % MAT
     elseif REQUESTS[ doc, day ] = 47   then roster[ doc, day ]   =  l % MAT
     elseif REQUESTS[ doc, day ] = 77   then roster[ doc, day ]   =  o % testing array structure
     elseif REQUESTS[ doc, day ] = 99   then roster[ doc, day ]   =  o % day off
    else true
     endif
   );  

%TEST
constraint forall (doc = JD) (REQUESTS[JD,1]  = 77);
constraint forall (doc = JD) (REQUESTS[JD,70] = 77);
constraint forall (doc = BB) (REQUESTS[BB,1]  = 77 /\ REQUESTS[BB,70]=77);






output["\n"];
output["\n"];
output["\n"];
output ["wk 1          |wk 2          |  wk 3        |   wk 4       |    wk 5      |   wk 6       |    wk 7      |   wk 8       |     wk 9     |   wk 10      \n"];
output ["M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S \n"];
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output[ show(roster[doc,day]) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then show(doc) ++  " " ++ 
                                                                                                           show(get_empnum(doc)) ++ " \n" else "" endif 
      | doc in docs, day in days];
      
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output [show(count([roster[doc,day]|doc in docs],a)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "am" else "" endif | day in days] ;output["\n"];
output [show(count(roster[..,day],p)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "pm" else "" endif| day in days] ;output["\n"];
output [show(count(roster[..,day],i)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "II" else "" endif| day in days] ;output["\n"];
%output [show(count(roster[..,day],c)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "cs" else "" endif| day in days] ;output["\n"];
%output [show(count(roster[..,day],l)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "leave" else "" endif| day in days] ;output["\n"];

%output [show(count(ssu[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "SSU" else "" endif| day in days] ;output["\n"];
%output [show(count(oncall[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "call" else "" endif| day in days] ;output["\n"];
%output [show(display_oncall[day]) ++ "" ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "call" else "" endif| day in days] ;output["\n"];


output["\n"];
output[show(length(roster))];





