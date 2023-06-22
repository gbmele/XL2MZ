% SSU 

array[docs,days] of var 0..1: ssu;         %% am ->ssu      - as per oncall above  

constraint forall (d in days, doc in docs) ((roster[doc,d]= a <- ssu[doc,d]==1)); % \/ (roster[doc,d] !=a -> ssu[doc,d]==0)     );



constraint forall(d in days) (count(ssu[..,d],1,1));

constraint forall(d in {GN,SK,DZ,BB,JD,CP}) (count(ssu[d,..],1,0));

constraint forall(d in docs) (global_cardinality_low_up(ssu[d,..],[1],[0],[10]));

constraint forall(d in docs) (global_cardinality_low_up(ssu[d, 1..14],[1],[0],[6]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,15..28],[1],[0],[6]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,29..42],[1],[0],[6]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,43..56],[1],[0],[6]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,57..70],[1],[0],[6]));


constraint global_cardinality_low_up(ssu[LB,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[SD,..],[1],[2],[16]);
constraint global_cardinality_low_up(ssu[SK,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[KM,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[NM,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[AV,..],[1],[0],[15]);
constraint global_cardinality_low_up(ssu[CK,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[EW,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[DL,..],[1],[2],[16]);
constraint global_cardinality_low_up(ssu[RM,..],[1],[2],[16]);
constraint global_cardinality_low_up(ssu[GN,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[DH,..],[1],[0],[15]);
constraint global_cardinality_low_up(ssu[AR,..],[1],[0],[10]);
constraint global_cardinality_low_up(ssu[LS,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[AV,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[LC,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[TB,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[LB,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[ML,..],[1],[0],[16]);
constraint global_cardinality_low_up(ssu[MC,..],[1],[2],[16]);
constraint global_cardinality_low_up(ssu[CC,..],[1],[2],[16]);

%%not sat and sun ssu in same weekend


%constraint forall(doc in docs,day in saturdays)
%                (if     ssu[doc,day] = 1 then ssu[doc,day+1]= 0
%                 elseif ssu[doc,day+1]=1 then ssu[doc,day]  = 0
%                 else true
%                endif);



%array[days] of var docs: display_ssu;
%constraint forall (day in days, doc in docs) (ssu[doc,day]=1 <- display_ssu[day]=doc);



%  INCHARGE

array[docs,days] of var 0..1: incharge;         %% am ->ssu      - as per oncall above  

constraint forall (d in days, doc in docs) ((roster[doc,d]= a /\ ssu[doc,d] != 1)  <- (incharge[doc,d]==1)); % \/ (roster[doc,d] !=a -> ssu[doc,d]==0)     );

constraint forall(d in days) (trace("doing incharge counting \(d) \n", count(incharge[..,d],1,1)));



constraint forall(d in docs) (global_cardinality_low_up(incharge[d,..],[1],[0],[8]));

constraint forall(d in docs) (global_cardinality_low_up(incharge[d, 1..14],[1],[0],[7]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,15..28],[1],[0],[7]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,29..42],[1],[0],[7]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,43..56],[1],[0],[7]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,57..70],[1],[0],[7]));


int: inc_hi=8;
int: inc_lo=0;
constraint global_cardinality_low_up(incharge[RG,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[GM,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[DB,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[CC,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[MC,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[SD,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[ML,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[DL,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[RM,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[GN,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[EW,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[LB,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[DH,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[HL,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[SK,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[BL,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[CP,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[RP,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[AR,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[LS,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[AV,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[LC,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[KM,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[DZ,..],[1],[0],[0]);
constraint global_cardinality_low_up(incharge[BB,..],[1],[0],[0]);
constraint global_cardinality_low_up(incharge[JD,..],[1],[0],[0]);
constraint global_cardinality_low_up(incharge[CK,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[NM,..],[1],[0],[inc_hi]);
constraint global_cardinality_low_up(incharge[TB,..],[1],[0],[inc_hi]);







%array[days] of var docs: display_incharge;
%constraint forall (day in days, doc in docs) (incharge[doc,day]=1 <- display_incharge[day]=doc);

%constraint forall(doc in docs,day in saturdays)
%                (if     incharge[doc,doc] = 1 then incharge[doc,day+1]= 0
%                 elseif incharge[doc,day+1]=1 then incharge[doc,day]  = 0
%                 else true
%                 endif);


%%martin

%constraint forall (day in thursdays) (incharge[ML,day]=0 /\ ssu[ML,day]=0);
%%FOR LINDSAY
%constraint forall (day in wednesdays) (incharge[LB,day]=0 /\ ssu[LB,day]=0);




% ONCALL


int: offcall = 0;

array[docs,days] of var 0..1: oncall;       

    %% am ->ssu      - as per oncall above  

constraint forall (d in days, doc in docs) ((roster[doc,d]= p <- oncall[doc,d]==1));

constraint forall(d in days) (count(oncall[..,d],1,1));  %%only 1 person on call per day

%%this just temp for DAMIEIN
%constraint count([oncall[DH,d] | d in days where d mod 7 = saturday],1,1)  /\ count([oncall[DH,d] | d in days where d in {monday,tuesday,wednesday,thursday,friday,sunday}],1,0);
%constraint count(oncall[LS,..],1,ls_oncall);
%constraint count([oncall[DH,day] | day in sundays],1,0);


constraint global_cardinality_low_up(oncall[RG,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[GM,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[DB,..],[1],[0],[8]);
constraint global_cardinality_low_up(oncall[CC,..],[1],[0],[8]);
constraint global_cardinality_low_up(oncall[MC,..],[1],[0],[8]);
constraint global_cardinality_low_up(oncall[SD,..],[1],[0],[8]);
constraint global_cardinality_low_up(oncall[ML,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[HL,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[DL,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[RM,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[GN,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[EW,..],[1],[0],[6]);
constraint global_cardinality_low_up(oncall[LB,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[DH,..],[1],[0],[3]);
constraint global_cardinality_low_up(oncall[SK,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[BL,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[CP,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[RP,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[AR,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[LS,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[AV,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[LC,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[KM,..],[1],[0],[2]);

constraint global_cardinality_low_up(oncall[DZ,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[BB,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[JD,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[CK,..],[1],[0],[9]);
constraint global_cardinality_low_up(oncall[NM,..],[1],[0],[3]);
constraint global_cardinality_low_up(oncall[TB,..],[1],[0],[3]);


constraint forall(d in docs) (global_cardinality_low_up(oncall[d,..],[1],[0],[8]));        %% 5 oncall max per 10 weeks


constraint forall(d in docs) (global_cardinality_low_up(oncall[d, 1..14],[1],[0],[6]));    %%once per fortnight if possible!!!!!
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,15..28],[1],[0],[6]));
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,29..42],[1],[0],[6]));
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,43..56],[1],[0],[6]));
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,57..70],[1],[0],[6]));

array[days] of var docs: display_oncall;
constraint forall (day in days, doc in docs) (oncall[doc,day]=1 <- display_oncall[day]=doc);

%%%%%



output[show(doc)   ++ 
			" we am: " ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {saturday,sunday}],a)))         ++

                   " we pm  "  ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {saturday,sunday}],p)))         ++

	           " fri pm  "  ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {friday}],p)))         ++
                    
                    
                    " oncall:" ++ show(fix(count(oncall[doc,..],1)))  ++ 
                    
                    "  ssu count: " ++ show(count(ssu[doc,..],1))          ++  
                    
                    "  INCHARGE COUNT: " ++  show(count(incharge[doc,..],1))  ++   "\n"
                    
                    | doc in docs];

output[ show(roster[display_oncall[day],day])  ++ " " ++ "dr is " ++ show(display_oncall[day]) ++ "  " ++ show(get_empnum((fix(display_oncall[day])))) ++ " "  ++ get_day(day) ++ "\n" | day in days];




