
include "globals.mzn";                      %% global_cardinality 

include "XL_2_ROSTERON_DATA.mzn";


include "this_month.dzn";             %exported from excel   


%% assign weekends
%% assign fridays
%% assign other days

include "roster_on_output.mzn";
include "rosteron_dump.mzn";


include "XL_2_ROSTERON_ssu_oncall_incharge.mzn";



set of int: days  = 1..70; 
int:        DAYS  =    70;

array[docs,days] of var shifts: roster;

enum shifts = {o,a,p,c,l,s,i,dummy_shift};

enum docs = {RG,GM,DB,CC,MC,SD,ML,HL,DL,RM,GN,EW,LB,DH,SK,BL,CP,RP,AR,LS,AV,LC,KM,DZ,BB,JD,CK,NM,TB};



%USE CASE
  %1% REQUESTS --> ROSTER       LOAD REQUESTS INTO ROSTER (NEXT TIME JUST LOAD SHIFTS AND NOT INTEGERS
  
  %2% ASSIGN WEEKENDS
  %3% ASSIGN FRIDAY PMS
  %4% ASSIGN REST OF WEEK
  %5% ASSIGN SSU 
  %6% ASSIGN INCHARGE
  %6% ASSIGN ONCALL
  
 
%DISPATCH  REQUESTS ints -> ROSTER shifts 

constraint forall(doc in docs, day in 1..DAYS)   
                 (roster[doc,day]=get_shift(REQUESTS[doc,day]));

function var shifts: get_shift(var int:n) =
               (if    n =     0           then o
               elseif n =     1           then a
               elseif n =     2           then p
               elseif n =     4           then c
               elseif n in { 41, %AL
                             42, %CONF
                             43, %LSL
                             44, %PAT
                             45, %MAT
                             46, %LWOP
                             47, %PERL
                             48, %SABB
                             49, %PHNW
                               }          then l
               elseif n in { 77, %%test
                             99, %%day off
                               }          then o 
               else                       dummy_shift
               endif);
            
%TEST
constraint assert(length(roster)= DAYS * length(docs),"testing roster dimensions = DAYS by DOCS");
constraint forall (doc = JD) (REQUESTS[JD,1]  = 77);
constraint forall (doc = JD) (REQUESTS[JD,70] = 77);
constraint forall (doc = BB) (REQUESTS[BB,1]  = 77 /\ REQUESTS[BB,70]=77);



%% SSU IN ONCALL IS DONE IN BACKGROUND
%% ALLOCATE WEEKENDS
%% ALLOCATE FRIDAYS


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




output[show(shifts)];


