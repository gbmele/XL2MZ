var int: min_mon_am;
var int: min_tue_am;
var int: min_wed_am;
var int: min_thu_am;
var int: min_fri_am;
var int: min_sat_am;
var int: min_sun_am;

var int: sue_tue_am;
%var int: AR_IC_am;
var int: db_ssu;

var int: erin_wed_am_count;

var int: tue_pm;
%var int: HL_tue_pm = sum (day in tuesdays)(roster[HL,day]=p);
%var int: HL_thu_pm = sum (day in thursdays)(roster[HL,day]=p);
var int: lewis_thu_pm;


%constraint forall( d in 1..DAYS)
        %(if (roster[AV,d] = roster[HL,d]) /\ roster[AV,d] in {a,p} then HL_AV[d]= 1 else HL_AV[d] = 0 endif);
        
%        (HL_AV[d]=bool2int( roster[HL,d] = roster[AV,d] /\ roster[HL,d] in {a,p}));
        
%constraint forall(d in days where d mod 7 in {saturday,sunday}) (if on_shift(HL,d) then off_shift(AV,d) else true endif);        

%constraint forall(day in days)
 %                 (if roster[HL,day] =a /\ roster[AV,day] = a then (ssu[HL,day]=1 \/ ssu[AV,day]=1) else true endif);    
                      
%constraint forall(day in days)(if roster[HL,day] = p then roster[AV,day]!=p else true endif);

%constraint forall(day in days)(roster[HL,day] = p -> roster[AV,day] != p);
%constraint forall(day in days)(roster[AV,day] = p -> roster[HL,day] != p);
                                                


constraint sue_tue_am=count([roster[SD,d] |d in days where d mod 7 = tuesday],a);

constraint lewis_thu_pm = count([roster[LC,d] | d in thursdays],p);
%constraint erin_wed_am_count = count([roster[EW,d] | d in wednesdays],a);

%constraint AR_IC_am = count(incharge[AR,..],1);

constraint min_mon_am = sum (doc in docs)     (sum(day in days where day mod 7 =  monday)       ( roster[ doc ,day ] = a));
constraint min_tue_am = sum (doc in doccount) (sum (day in days where day mod 7 = tuesday)   ( roster[ doc ,day ] = a));
constraint min_wed_am = sum (doc in doccount) (sum (day in days where day mod 7 = wednesday) ( roster[ doc ,day ] = a));
constraint min_thu_am = sum (doc in docs)     (sum (day in days where day mod 7 = thursday)  ( roster[ doc ,day ] = a));
constraint min_fri_am = sum (doc in doccount) (sum (day in days where day mod 7 = friday )   ( roster[ doc ,day ] = a));
constraint min_sat_am = sum (doc in doccount) (sum (day in days where day mod 7 = saturday )   ( roster[ doc ,day ] = a));
constraint min_sun_am = sum (doc in doccount) (sum (day in days where day mod 7 = sunday )   ( roster[ doc ,day ] = a));

constraint tue_pm = sum (doc in doccount) (sum (day in tuesdays)   ( roster[ doc ,day ] = p));

constraint db_ssu = count(ssu[DB,..],1);
                                       
solve minimize abs(55 -min_fri_am) + abs(55-min_tue_am) + abs(55 - min_thu_am)+ abs(55 - min_mon_am)+ abs(52 - min_wed_am) + db_ssu + (lewis_thu_pm - 5) + abs(55-min_sat_am);
