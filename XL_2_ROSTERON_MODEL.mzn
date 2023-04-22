%%GET SABB CODE
%%GET PHNW CODE 
%% teresa employee number abd area

include "globals.mzn";
include "xl_2_rosteron.dzn";
include "this_month.dzn";             %exported from excel    %% here can do this_month_requests_off_leave_then_assign_weekends...
include "xl_2_rosteron_staff.mzn";
include "roster_on_output.mzn";
include "rosteron_dump.mzn";
include "xl_2_rosteron_ssu_oncall.mzn";

set of int: days  = 1..70; 
int:        DAYS  =    70;

array[docs,days] of var shifts: roster;

enum shifts = {o,a,p,c,l,s,i,dummy_shift};

enum docs = {RG,GM,DB,CC,MC,SD,ML,HL,DL,RM,GN,EW,LB,DH,SK,BL,CP,RP,AR,LS,AV,LC,KM,DZ,BB,JD,CK,NM,TB};

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





%%    ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  
/*
function var bool: on_ssu(docs:doc, days:d) =
               if display_ssu[d]=doc then true else false endif;

function var bool: in_charge(docs:doc, days:d) =
               if display_incharge[d]=doc then true else false endif;

function var bool: on_am(docs:doc, days:d)=
               if roster[doc,d]=a then true else false endif; 

function var bool: on_pm(docs:doc, days:d)=
               if roster[doc,d]=p then true else false endif; 

function var bool: on_cs(docs:doc, days:d)=
               if roster[doc,d]=c then true else false endif; 
               
function var bool: on_al(docs:doc, days:d) =
               if roster[doc,d]=l /\ REQUESTS[doc,d]=  41 then true else false endif;

function var bool: on_cl(docs:doc, days:d) =
               if roster[doc,d]=l /\ REQUESTS[doc,d]=  42 then true else false endif;

function var bool: on_lsl(docs:doc, days:d) =
               if roster[doc,d]=l /\ REQUESTS[doc,d]=  43 then true else false endif;

function var bool: on_patl(docs:doc, days:d) =
               if roster[doc,d]=l /\ REQUESTS[doc,d]=  44 then true else false endif;

function var bool: on_matl(docs:doc, days:d) =
               if roster[doc,d]=l /\ REQUESTS[doc,d]=  45 then true else false endif;

function var bool: on_perl(docs:doc, days:d) =
               if roster[doc,d]=l /\ REQUESTS[doc,d]=  46 then true else false endif;

constraint forall (doc = RG,d in days)
   (if       on_ssu(doc,d)            then c_cs(doc,d,s818,zz)
   elseif in_charge(doc,d)            then c_cs(doc,d,i818,zz) 
   elseif     on_am(doc,d)            then c_cs(doc,d,a818,zz)
   elseif     on_cs(doc,d)            then c_cs(doc,d,zz,c818)
   elseif     on_pm(doc,d)            then c_cs(doc,d,p1624,c1416)
   elseif     on_al(doc,d)            then c_cs(doc,d,al,zz )  
   elseif     on_cl(doc,d)            then c_cs(doc,d,cl,zz )  
   elseif    on_lsl(doc,d)            then c_cs(doc,d,lsl,zz)  
   elseif    on_patl(doc,d)            then c_cs(doc,d,lsl,zz)  
   elseif    on_matl(doc,d)            then c_cs(doc,d,lsl,zz)  
   elseif    on_perl(doc,d)            then c_cs(doc,d,lsl,zz)  
   else                                    c_cs(doc,d,zz,zz )
   endif
   ); 
*/


%%ONE WEEK AT TIME  ONCALL AT TOP   WITH CLINICAL THEN CLINICAL SUPPORT 
