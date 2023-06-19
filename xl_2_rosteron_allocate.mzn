  
  
%STAFF COUNT DAY SHIFT
constraint forall(d in mondays   )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  15 , 15     ]  )); %mon
constraint forall(d in tuesdays  )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  16 , 18     ]  )); %tue
constraint forall(d in wednesdays)    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  18 , 10    ]  )); %wed
constraint forall(d in thursdays )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  17 , 10    ]  )); %thu
constraint forall(d in fridays   )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  16 , 14     ]  )); %fri
constraint forall(d in saturdays )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  15 , 17     ]  )); %sat 
constraint forall(d in sundays   )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  15 ,14     ]  )); %sun


%helpers = COUNT === GLOBAL_CARDINALITY
predicate assign_shifts(docs: doc, int: dayname, shifts: shift, int: num) =

          count([roster[doc,d] | d in days where d mod 7 = dayname] ,shift,num);     


predicate assign_shifts(docs: doc, int: dayname, shifts: shift, int: low, int: up) =
          
         global_cardinality_low_up([roster[doc,d] | d in days where d mod 7 = dayname],[shift],[low],[up]);

      
predicate DOC_TABLE(docs:doc,array[int,int]of shifts:doctable) =
          forall (w in weeks)(table([roster[doc,day] | day in w],doctable));
      
predicate DOC_FN_TABLE(docs:doc,array[int,int]of shifts:doctable) =
          forall (fn in fortnights)(table([roster[doc,day] | day in fn],doctable));
                               
 
predicate reg_string(docs: doc , string:rstring) = 
          regular(roster[doc,..],rstring);

          

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%STAFF RULES                                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%constraint regular(roster[RG,..], "( (c c c (p|c) o o o)* (c c c o o a o)*   (l l l l o o o )*  )*");

constraint assign_shifts(RG,saturday,a,2);

%constraint forall (d in thursdays) (roster[RG,d]=  c <-> roster[GM,d-2]=l);

%constraint no_consec_saturdays(RG);
constraint shifts_per_fortnight(RG,8) ;


%%GM
%constraint regular(roster[GM,..] , "( (c (p|c) (o|l) c c o o )* (c p o c o o a)*   (l{4} o{3})* )  *") ;
constraint assign_shifts(GM,sunday,a,2);
%constraint forall (d in tuesdays) (roster[GM,d]=  c <-> roster[RG,d+2]=l);

%constraint no_consec_sundays(GM);
constraint shifts_per_fortnight(GM,8);



%%DB  needed to keep every wednesday off
constraint trace("\nDB...",true);

%constraint reg_string(DB,"( ((a|o) (a|p) o (a|o) (a|o|p)     (o|a|p) (o|a|p))*   (l l l l o  o o)*        )*");

constraint reg_string(DB,"( (a p o a a o o)* (a p o a o a a)*  (a p o a o p p)*  (o a o a p o o )* (l l l l o  o o)*        )*");


%constraint weekday_shift_count(DB,a,2,3);
%constraint weekday_shift_count(DB,p,1,1);

constraint assign_shifts(DB,friday,   p,2);
constraint assign_shifts(DB,saturday, a,1);
constraint assign_shifts(DB,saturday, p,1);
constraint assign_shifts(DB,sunday,   a,1);
constraint assign_shifts(DB,sunday,   p,1);

%constraint no_consec_weekends(DB);
%constraint no_third_weekend(DB);
%constraint no_consec_friday_pms(DB);
constraint shifts_per_fortnight(DB,8);%  /\  no_fri_before_weekend(DB)   /\ 
constraint no_mon_after_sun(DB);
%constraint no_am_after_pm(DB);
constraint no_split_weekend(DB);
constraint trace("\nDB...ok",true);

%%CC
constraint trace("\nCC...",true);

constraint reg_string(CC, "( ((p|o) (a|o) (a|o|p) (a|o)    (a|o|p) (a|o|p) (a|o|p))*   (l l l l o o o )* )*"    );

constraint weekday_shift_count(CC,a,2,3);
constraint weekday_shift_count(CC,p,1,1);

constraint assign_shifts(CC,wednesday,p,0);

constraint assign_shifts(CC,friday,  p,2);
constraint assign_shifts(CC,saturday,a,1);
constraint assign_shifts(CC,saturday,p,1);
constraint assign_shifts(CC,sunday,  a,1);
constraint assign_shifts(CC,sunday,  p,1);


constraint no_split_weekend(CC) /\ no_consec_weekends(CC)     /\ 
           no_third_weekend(CC) /\ no_consec_friday_pms(CC)   /\ 
           no_mon_after_sun(CC)  /\ shifts_per_fortnight(CC,8); 
constraint no_am_after_pm(CC);
constraint no_fri_before_weekend(CC);

constraint trace("\nCC...ok",true);


%var int: fri_b4_sat_count;
%fri_b4_sat_count = sum (d in fridays) (bool2int(on_shift(CC,d+1)));


%%MC
constraint trace("\nMC...",true);

%constraint reg_string(MC,"(   ((a|o) a p c (o|a)   o o )* ((a|o) (o|a) a c p  o o)*  (o a p c o   a o)*   (o (a|o) p c (o|a)    p o)*   (o (a|o) p c (o|a)   o a)* ((a|o) (o|a) p c (o|a)   o p)*    (l{4} o{3})*      )*   "        ); 

%constraint reg_string(MC,"(   ((o|a) (o|a) p c (o|a) (a|o|p) (a|o|p) )*     ((o|a) (o|a)  a c p  o o )*   (l{4} o{3})*      )*   "        ); 

array[int,int] of     shifts: mc_table =
                             [| a,a,p,c,o, o,o
                              | o,a,p,c,a, o,o
                              | o,o,p,c,a, a,o
                              | a,o,p,c,o, a,o
                              | o,o,p,c,a, a,o
                              | o,o,p,c,a, p,o
                              | a,o,p,c,o, p,o
                              | o,o,p,c,a, p,o
                              | o,o,p,c,a, o,p
                              | a,o,p,c,o, o,p
                              | o,a,p,c,o, o,p
                              | o,o,p,c,a, o,a
                              | a,o,p,c,o, o,a
                              | o,a,p,c,o, o,a
                              | o,a,a,c,p, o,o
                              | a,o,a,c,p, o,o
                              | a,a,o,c,p, o,o
                              | l,l,l,l,o, o,o  
                              |];

constraint DOC_TABLE(MC,mc_table);

constraint assign_shifts(MC,monday,  a,2,6);
constraint assign_shifts(MC,friday,  a,2,6);
constraint assign_shifts(MC,friday,  p,2);
constraint assign_shifts(MC,saturday,a,1);
constraint assign_shifts(MC,saturday,p,1);
constraint assign_shifts(MC,sunday,  a,1);
constraint assign_shifts(MC,sunday,  p,1);
constraint no_mon_after_sun(MC) /\ shifts_per_week(MC,4);%  /\ split_weekends(MC);

constraint trace("\nMC...ok",true);

predicate split_weekends(docs:doc) =
          forall (d in saturdays) (if on_shift(doc,d) then off_shift(doc,d+1) 
                                   elseif on_shift(doc,d+1) then off_shift(doc,d) 
                                   else (off_shift(doc,d) /\ off_shift(doc,d+1))
                                   endif);



%%SD
constraint trace("\nSD...",true);
constraint DOC_TABLE(SD,[| c,a,a,p,o, o,o
                         | a,c,a,p,o ,o,o
                         | o,c,a,p,o ,p,o
                         | o,c,a,p,o ,o,a
                         | a,c,a,o,p ,o,o 
                         | o,c,a,a,p ,o,o 
                         | c,a,a,o,p, o,o 
                         | l,l,l,l,o, o,o  
                        |]);
                        
constraint assign_shifts(SD,monday,  a,2,10);
constraint assign_shifts(SD,friday,  p,2);
constraint assign_shifts(SD,saturday,a,0);
constraint assign_shifts(SD,saturday,p,2);
constraint assign_shifts(SD,sunday,a,2);
constraint assign_shifts(SD,sunday,p,0);

constraint no_consec_friday_pms(SD) /\ no_consec_weekends(SD) /\ no_mon_after_sun(SD);



%%HL
constraint trace("\nHL..ok",true);

constraint reg_string(HL,"( ((o|a|p) (o|a) c (o|a|p) (o|a|p)    (o|a|p) (o|a|p))*     (l l l l o o o)*             )*");


constraint weekday_shift_count(HL,c,1,1);
constraint weekday_shift_count(HL,a,1,2);
constraint weekday_shift_count(HL,p,1,1);

constraint assign_shifts(HL,monday,  a,1,9);
constraint assign_shifts(HL,friday,  a,1,8);
constraint assign_shifts(HL,friday,  p,2);
constraint assign_shifts(HL,saturday,a,1);
constraint assign_shifts(HL,saturday,p,1);
constraint assign_shifts(HL,sunday,  a,1);
constraint assign_shifts(HL,sunday,  p,1);
constraint no_mon_and_no_tue_after_sun(HL);
constraint no_am_after_pm(HL);
constraint no_fri_pm_before_weekend(HL);
constraint shifts_per_fortnight(HL,8);
%constraint no_consec_weekends(HL);
constraint no_split_weekend(HL);
constraint trace("\nHL..ok",true);




%DL
constraint trace("\nDL..ok",true);
%constraint reg_string(DL, "( o o o o o o o )*");

%constraint reg_string(DL,"( ((a|o) p c o a  o o)* ((o|a) p c o (a|o)   a a)*   ((o|a) p c o (a|o)   p p)*  ((a|o) a c o p   o o)*     (l{4} o{3})*        )*") ;%(o p c a a o o)*

array[int,int] of shifts: dl_table = 
                        [| a,p,c,o,a,  o,o
                         | o,p,c,o,a,  a,a
                         | a,p,c,o,o,  a,a
                         | o,p,c,o,a,  p,p
                         | o,a,c,o,p,  o,o
                         | a,a,c,o,p,  o,o
                         | l,l,l,l,o,  o,o  
                         %| a,p,c,a,o,  o,o   %temp
                         %| o,p,c,a,a,  o,o   %temp
                        |];


constraint DOC_TABLE(DL,dl_table);


constraint assign_shifts(DL,friday,p, 2);
constraint assign_shifts(DL,saturday,a,1);
constraint assign_shifts(DL,saturday,p,1);
constraint assign_shifts(DL,sunday, a,1);
constraint assign_shifts(DL,sunday, p,1);
constraint no_consec_friday_pms(DL)   /\ no_consec_weekends(DL)  /\ no_third_weekend(DL)   /\ no_mon_after_sun(DL)  /\ shifts_per_fortnight(DL,8);
%constraint no_fri_before_sat(DL);
constraint trace("\nDL..ok",true);


constraint trace("\nML...",true);
constraint reg_string(ML, "(   (o o a a o o a)*  (o o a a o o p)*         (o o l a o    o p)*   (o o l a o    o a)*               )*");
constraint assign_shifts(ML,saturday,a,0);
constraint assign_shifts(ML,saturday,p,0);
constraint assign_shifts(ML,sunday,  a,1,10);
constraint assign_shifts(ML,sunday,  p,1,10) /\ trace("ML shifts 6 OK..",        shifts_per_week(ML,3));

constraint trace("ML...ok",true);


%RM
constraint trace("\nRM...",true);
constraint reg_string(RM,"( (a p c (o|a) (a|o) o o)* ((o|a) p c (o|a) o   a a)*  (a p c o a o o)*  (o a c a p   o o)*   (l l o o o a a)*  (l{4} o{3})*       )*");

constraint weekday_shift_count(RM,a,1,2);
constraint weekday_shift_count(RM,p,1,1);

constraint assign_shifts(RM,friday,a, 1,8);
constraint assign_shifts(RM,friday,p, 2,2);
constraint assign_shifts(RM,saturday, a,2);
constraint assign_shifts(RM,saturday, p,0);
constraint assign_shifts(RM,sunday,   a,2);
constraint assign_shifts(RM,sunday,   p,0);
constraint no_consec_friday_pms(RM) /\ no_consec_weekends(RM) /\ no_third_weekend(RM) /\ no_mon_after_sun(RM) /\ shifts_per_fortnight(RM,8);
constraint no_fri_before_weekend(RM);




constraint trace("\nGN",true);

array[int,int] of shifts:gn_table =   [| p,o,p,c,o,p,o
                                       | l,o,l,l,o,l,o
                                       |];
constraint DOC_TABLE(GN,gn_table);                         
constraint shifts_per_fortnight(GN,8);
constraint trace("...GN..ok",true);



%EW
constraint trace("\nEW",true);
constraint reg_string(EW, "(  (o (o|a|c) (a|p|c) (o|a|c) (o|a|p|c)   (o|a|p) (o|a|p))* (l l l l  o o o)*    )");

%constraint forall(wwk in weekday_weeks, doc = EW)
%                 (global_cardinality_low_up       (roster[doc,wwk],[a , p , o , c ],
%                                                                   [0 , 1 , 1 , 1 ],
%                                                                   [2 , 1 , 3 , 1 ]) \/ global_cardinality_low_up(roster[doc,wwk],[l],[0],[10])   );

constraint weekday_shift_count(EW,a,0,2);
constraint weekday_shift_count(EW,p,1,1);
constraint weekday_shift_count(EW,o,1,3);
constraint weekday_shift_count(EW,c,1,1);

constraint assign_shifts(EW,friday,p,2,3);
constraint assign_shifts(EW,wednesday,p,1,10);
constraint assign_shifts(EW,saturday,a,1);
constraint assign_shifts(EW,saturday,p,1);
constraint assign_shifts(EW,sunday, a,1);
constraint assign_shifts(EW,sunday, p,1);
constraint no_split_weekend(EW) /\ no_am_after_pm(EW) /\ no_fri_pm_before_weekend(EW);

%constraint no_consec_friday_pms(EW) /\ no_consec_weekends(EW) /\ no_mon_after_sun(EW) /\ no_consec_weekends(EW)/\
constraint shifts_per_fortnight(EW,8);

constraint trace("...EW..ok",true);



%LB
constraint trace("\nLB",true);

constraint reg_string(LB,"( (p o a o a o o )* (p o a o a a a)*  (p o a o a   p p)*  (o o a o p   o o)*    (l{3} o{4})* (l o l o l o o)*  (p o l o l o o)*   (l o a o p o o)*   (o o l o l o o)*    (p o a o c o o)*           )*") ;
constraint assign_shifts(LB,friday,p,2);
constraint assign_shifts(LB,saturday,a,1);
constraint assign_shifts(LB,saturday,p,1);
constraint assign_shifts(LB,sunday, a,1);
constraint assign_shifts(LB,sunday, p,1);
constraint no_consec_friday_pms(LB) /\  no_consec_weekends(LB) /\  no_mon_after_sun(LB);%  /\ no_third_weekend(LB);
constraint force_mon(LB,p);
constraint trace("...LB..ok",true);


%DH
constraint trace("\nDH",true);
%constraint reg_string(DH,"( (p o c o a o o)*   (p o c o a   p p)*   (o o c o p   o o)*  (o o c o a o o)* (p o c o l o o )*  (l o l o l o o)*   (l{3} o{4})*  )*") ;

constraint DOC_TABLE(DH,[| p,o,c,o,a, o,o
                         | p,o,c,o,a, p,p
                         | o,o,c,o,p, o,o
                         | l,l,l,o,o, o,o
                         | l,o,l,o,l, o,o
                         |]);


constraint assign_shifts(DH,friday,  p,1,3)   /\
           
           assign_shifts(DH,saturday,p,1,3)  /\
           
           assign_shifts(DH,sunday,  p,1,3);
           
constraint force_mon(DH,p);

constraint no_consec_friday_pms(DH) /\ no_consec_weekends(DH)  /\ no_mon_after_sun(DH);

constraint trace("...DH..ok",true);



constraint trace("\nSK",true);
%constraint reg_string(SK,"( (a c p o o   o o)* (a c p o o a a)* (a c p o o p p)* (o c p o o  o o)*  (o c p o o  a a)* (l o l o o  o o)*    )*") ;

constraint DOC_TABLE(SK,[| a,o,p,o,o, o,o
                         | a,c,p,o,o, o,o
                         | a,c,p,o,o, a,a
                         | o,c,p,o,o, o,o
                         | a,o,p,o,o, a,a  
                         | l,l,l,o,o, o,o  
                         |]);

constraint assign_shifts(SK,saturday,a,0,1);
constraint assign_shifts(SK,saturday,p,0);  %temp
constraint assign_shifts(SK,sunday,  a,0,1);
constraint assign_shifts(SK,sunday,  p,0);  %temp
%constraint no_consec_weekends(SK) /\ no_mon_after_sun(SK) /\ no_third_weekend(SK);

%constraint force_mon(SK,a);            

constraint trace("...SK..ok",true) ;

constraint trace("\nBL",true);

%constraint reg_string(BL,"( (o o (c|o) (a|o|p) (o|p)  o (o|p) )*    (o o l l o  o o)*      ) *") ;

constraint reg_string(BL,"( (o|a|p|c)*     ) *") ;

                    %          m t w t f s s   m t w t f s s 
%constraint DOC_FN_TABLE(BL, [| o,o,o,p,o, o,o,  o,o,o,a,o, o,o
%                             | o,o,o,p,o, o,p,  o,o,o,a,o, o,o
%                             | o,o,o,p,o, o,o,  o,o,o,o,o, o,p
%                             | c,c,c,c,o, o,o,  c,c,c,c,o, o,o
%                            |]);



constraint reg_string(CP,"( (o o a o o o o)*) *") ;
constraint count(ssu[CP,..],1) = 0 /\ count(incharge[CP,..],1) = 0;


%constraint reg_string(RP,"( (o a o p o  o p)* (l{3} o{4})* (o l o p o o p)*   (o l o l o o p )*    (o a o p o o l)*      (o a o a o  o p)*               )*") ;
%constraint shifts_per_week(RP,3);

constraint DOC_FN_TABLE(RP,[| o,a,o,p,o,  o,p,   o,a,o,p,c,  o,p
                            | o,a,o,p,o,  o,p,   p,o,o,o,c,  o,l
                            | o,l,o,l,o,  o,p,   o,a,o,p,c,  o,p  % temp
                            |]);


%AR
constraint trace("\nAR",true);

%constraint reg_string(AR, "(  (o o a (o|a) o  (o|a) o)*   ( o o l l o  o o)*  )*" );


constraint DOC_TABLE(AR,[| o,o,a,a,o, o,o
                         | o,o,a,o,o, a,o  
                         | o,o,l,l,o, o,o  
                         |]);


%%AV
%                                 M        T    W     Th       FR         S         S      this is fri pm then no sat pm
%constraint reg_string(AV,"( ( (o|a|p|c) (o|c) c (a|o|p|c) (a|o|p|c)   (o|a|p) (o|a|p) )*    (l l l l o o o)* )*") ;

constraint reg_string(AV,"(  (o|a|p|c|l)*    )*");


/*
constraint weekday_shift_count(AV,p,1,1);
constraint weekday_shift_count(AV,c,1,2);
constraint weekday_shift_count(AV,o,0,2);
constraint weekday_shift_count(AV,a,1,1);


constraint assign_shifts(AV,monday,a,2,7);
constraint assign_shifts(AV,tuesday,a,1,10);
constraint assign_shifts(AV,tuesday,p,0,0);
constraint assign_shifts(AV,wednesday,c,0,10);

constraint assign_shifts(AV,friday,a,2,10);
constraint assign_shifts(AV,friday,p,2,4);
constraint assign_shifts(AV,saturday,a,1);
constraint assign_shifts(AV,sunday,  a,1);
constraint assign_shifts(AV,saturday,p,1);
constraint assign_shifts(AV,sunday,  p,1);

constraint shifts_per_fortnight(AV,8);
constraint no_consec_weekends(AV) /\ no_split_weekend(AV);
constraint no_mon_after_sun(AV);
constraint no_am_after_pm(AV);
constraint no_fri_pm_before_weekend(AV);
*/



%%forall 
%LC

constraint regular(roster[LC,..],"( (o p o (a|p) o   o o)*    (o p o (a|p) o    (a|p)(a|p))*    (o l o l o  o o)* )*" );

/*
constraint DOC_TABLE(LC,[| o,p,o,p,o, o,o
                         | o,p,o,a,o, o,o
                         | o,p,o,a,o, a,a
                         | o,p,o,p,o, a,a
                         | o,p,o,a,o, p,p
                         | o,p,o,p,o, p,p
                         | o,l,o,l,o, o,o   %%temp temp
                         | o,l,o,l,o, o,o
                         |]);

*/


constraint assign_shifts(LC,thursday,a,3,7);
constraint assign_shifts(LC,saturday,a,1);
constraint assign_shifts(LC,saturday,p,1);
constraint assign_shifts(LC,sunday,  a,1);
constraint assign_shifts(LC,sunday,  p,1) /\ no_consec_weekends(LC) /\ no_split_weekend(LC); % /\ shifts_per_week(LC,8);



constraint regular(roster[KM,..],"( (a|o|p|l) o o o o    o (o|a|p|l)* )*" );

/*
constraint forall (w in weeks)      %          m t w t f s s  
        (table ([roster[KM,day]| day in w], [| a,o,o,o,o,o,o
                                             | l,o,l,o,o,o,o
                                             | p,o,o,o,o,o,o
                                             | o,o,o,o,o,o,p
                                             | o,o,o,o,o,o,a
                                             | p,o,o,o,o,o,o
                                             | p,o,o,o,o,o,o
                                             | o,o,o,o,o,o,o
                                             | a,o,o,o,o,o,a
                                             | l,o,o,o,o,o,o
                                             | a,o,o,o,o,o,p
                                             | l,o,o,o,o,o,p
                                             
                                             |]));

*/
%DZHANG
constraint reg_string(DZ,"( (o o o o o   o o    o o o o o   o a)*  (l o{6})* )*") ;
constraint count(ssu[DZ,..],1) = 0 /\ count(incharge[DZ,..],1) = 0;


%BALABALABALA
%%WORKS 1000-2000 TUESDAYS AND WEDNESDAYS
constraint reg_string(BB,"( (o a a o o   o o)*    (o l l o o    o o)*    )*") ;
constraint count(ssu[BB,..],1) = 0 /\ count(incharge[BB,..],1) = 0;




constraint reg_string(JD,"( (o  o a o o   o o)*   (o o l o o o o)*   )*") ;
constraint count(ssu[JD,..],1) = 0 /\ count(incharge[JD,..],1) = 0;



constraint regular(roster[CK,..], "((o|a|p|l)*)" );

/*
constraint DOC_TABLE(CK,[| o,o,a,a,o, a,a
                         | o,o,a,o,o, p,p  
                         | o,o,a,a,o, o,o  
                         | o,o,o,o,o, o,o  
                         | a,a,a,a,a, a,a  
                         | p,o,o,a,a, p,p  
                         |]);
*/


%constraint reg_string(CK,"(    (o o o o o o o)*   )*") ;


%constraint no_split_weekend(CK) /\ no_consec_weekends(CK);
%constraint assign_shifts(CK,saturday,a,2);
%constraint assign_shifts(CK,saturday,p,2);
%constraint assign_shifts(CK,sunday,a,2);
%onstraint assign_shifts(CK,sunday,p,2);



constraint reg_string(NM,"(     ( a|o|p|l )*   )*") ;

%constraint DOC_TABLE(NM,[| o,a,a,p,p, o,o
%                         | o,o,o,a,a, a,a
%                         | o,o,o,a,a, p,p
%                         |]);





constraint trace("\nsolving......\n",true);




output["\n\n"];

output ["wk 1          |wk 2          |  wk 3        |   wk 4       |    wk 5      |   wk 6       |    wk 7      |   wk 8       |     wk 9     |   wk 10      \n"];
output ["M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S \n"];
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output[ show(roster[doc,day]) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then show(doc) ++ "\n" else "" endif | doc in docs, day in days];
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output [show(count(roster[..,day],a)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "am" else "" endif | day in days] ;output["\n"];
output [show(count(roster[..,day],p)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "pm" else "" endif| day in days] ;output["\n"];
output [show(count(roster[..,day],c)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "cs" else "" endif| day in days] ;output["\n"];
output [show(count(roster[..,day],l)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "leave" else "" endif| day in days] ;output["\n"];

output [show(count(ssu[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "SSU" else "" endif| day in days] ;output["\n"];
output [show(count(oncall[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "call" else "" endif| day in days] ;output["\n"];




output["WEEKENDS\n\n"];
output[ show(roster[doc,day]) ++ "." ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then show(doc) ++ "\n" else "" endif | doc in docs, day in days where day mod 7 in {saturday,sunday}];
output["----------------------------------------------------\n"];
output[ show(count(roster[..,day],a)) ++ "." ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then "am" ++"\n" else "" endif | day in days where day mod 7 in {saturday,sunday}];
output["----------------------------------------------------\n"];
output[ show(count(roster[..,day],p)) ++ "." ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then "pm" else "" endif | day in days where day mod 7 in {saturday,sunday}];

output["\n\n\n"];



output["\n\n\n"];

