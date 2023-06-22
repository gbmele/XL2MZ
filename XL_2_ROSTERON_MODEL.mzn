%%GET SABB CODE
%%GET PHNW CODE 
%% teresa employee number abd area

%include "minimizers.mzn";

include "global_calendar.mzn";
include "globals.mzn";
include "xl_2_ROSTERON_DATA.mzn";
include "this_month2.mzn";             %exported from excel    %% here can do this_month_requests_off_leave_then_assign_weekends...
include "roster_on_output.mzn";
%include "rosteron_dump.mzn";
include "XL_2_ROSTERON_ssu_oncall_incharge.mzn";

%include "xl_2_rosteron_allocate.mzn";

set of int: days  = 1..70; 
int:        DAYS  =    70;

array[docs,days] of var shifts: roster;

enum shifts = {o,a,p,c,l,s,i,x};

enum docs =             {RG,GM,DB,CC,MC,SD,ML,HL,DL,RM,GN,EW,LB,DH,SK,BL,CP,RP,AR,LS,AV,LC,KM,DZ,BB,JD,CK,NM,TB};
set of docs: doccount = {RG,GM,DB,CC,MC,SD,ML,HL,DL,RM,GN,EW,LB,DH,SK,BL,   RP,AR,LS,AV,LC,KM,         CK,NM,TB};

array [docs] of var int: doc_num = 

 array1d(docs,[1011,222,333,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]);


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
               elseif n =     3           then o   %% any shift -- this will be dynamically code to be a or p
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
               elseif n in { 91, %% not am      constraint will be dynamically made
                             92, %% not pm      constraint will be dynamically made
                               }          then o                   
               elseif n =     8           then o
               else                       o
               endif);
            
%TEST
constraint assert(length(roster)= DAYS * length(docs),"testing roster dimensions = DAYS by DOCS");
%constraint forall (doc = JD) (REQUESTS[JD,1]  = 77);
%constraint forall (doc = JD) (REQUESTS[JD,70] = 77);
%constraint forall (doc = BB) (REQUESTS[BB,1]  = 77 /\ REQUESTS[BB,70]=77);



%% SSU IN ONCALL IS DONE IN BACKGROUND
%% ALLOCATE WEEKENDS
%% ALLOCATE FRIDAYS



array[docs,days] of var shifts: RON;
array[docs,days] of var shifts2: RON2;



array[docs,days] of var shifts2: Clin;
array[docs,days] of var shifts2: CST;


constraint forall(doc in docs, day in days)
  
                ( if ssu[doc,day]=1 then RON[doc,day]=s
                
                  elseif incharge[doc,day]=1 then RON[doc,day]=i
                
                 else RON[doc,day] = roster[doc,day]
                 
                 endif);
%%RON2
constraint forall(doc in docs, day in days)(
  
                
                 if   (roster[doc,day] =l /\ REQUESTS[doc,day] = 41) then RON2[doc,day]=all  

             elseif   (roster[doc,day] =l /\ REQUESTS[doc,day] = 42) then RON2[doc,day]=cll  

             elseif   (roster[doc,day] =l /\ REQUESTS[doc,day] = 43) then RON2[doc,day]=lsll  

             elseif   (roster[doc,day] =l /\ REQUESTS[doc,day] = 45) then RON2[doc,day]=matll 

             elseif   (roster[doc,day] =l /\ REQUESTS[doc,day] = 47) then RON2[doc,day]=perll

             elseif   (roster[doc,day] =l /\ REQUESTS[doc,day] = 48) then RON2[doc,day]=SABB

             elseif   (roster[doc,day] =l /\ REQUESTS[doc,day] = 49) then RON2[doc,day]=PHNW

             
             else RON2[doc,day]=zz
             endif);







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




%output[show(shifts)];

%output[show(doc)++","++show(day)++","++show(RON[doc,day]) ++"\n"| doc in docs, day in days];
output["oncall \n\n\n\n"];

output[show(day) ++ "," ++ show(display_oncall[day]) ++ "\n" | day in days];

output["\n\n\n\n"];


output[show(doc)++","++show(day)++","++show(RON[doc,day]) ++ "," ++ show(RON2[doc,day]) ++ "\n"| doc in docs, day in days];

