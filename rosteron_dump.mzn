

int: annual_leave         = 41;
int: conference_leave     = 42;
int: long_service_leave   = 43;
int: pat_leave            = 44;
int: mat_leave            = 45;



array[docs,days] of var shifts: RON;



array[docs,days] of var shifts2: Clin;
array[docs,days] of var shifts2: CST;


constraint forall(doc in docs, day in days)
  
                ( if ssu[doc,day]=1 then RON[doc,day]=s
                
                  elseif incharge[doc,day]=1 then RON[doc,day]=i
                
                 else RON[doc,day] = roster[doc,day]
                 
                 endif);

predicate c_cs(docs:doc,days:day,shifts2:c,shifts2:cs) =
                    Clin[doc,day]=c /\ CST[doc,day]=cs;

predicate ron(docs:doc,days:day,shifts:shift) =
                      RON[doc,day]=shift;

%%LEAVE SHIFTS

/*
function var bool: get_leave(docs:doc, days:d) =

             ((roster[doc,d]=l  /\ REQUESTS[doc,d]=  41   /\  c_cs(doc,d,all,zz ))   \/
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  42   /\  c_cs(doc,d,cll,zz ))   \/
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  43   /\  c_cs(doc,d,lsll,zz))   \/  
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  44   /\  c_cs(doc,d,patll,zz))  \/  
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  45   /\  c_cs(doc,d,matll,zz))  \/
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  46   /\  c_cs(doc,d,LWOPl,zz))  \/  
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  47   /\  c_cs(doc,d,perll,zz))  \/ 
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  48   /\  c_cs(doc,d,SABB,zz))   \/
              (roster[doc,d]=l  /\ REQUESTS[doc,d]=  49   /\  c_cs(doc,d,PHNW,zz ))  \/
              true
             );  
*/






%%RG 

constraint forall(d in days)
           ( if       RON[RG,d] = c then  (Clin[RG,d]=zz   /\ CST[RG,d]=c818)
           
             elseif   RON[RG,d] = s  then (Clin[RG,d]= s818 /\ CST[RG,d]=zz)
             
             elseif   RON[RG,d] = a  then (Clin[RG,d]= a818 /\ CST[RG,d]=zz)
             
             elseif   RON[RG,d] = i  then (Clin[RG,d]= i818 /\ CST[RG,d]=zz)
             
             elseif   RON[RG,d] = p then (Clin[RG,d]=p1624  /\  CST[RG,d]=c1416)  
             
             %elseif   RON[RG,d] = l  then (Clin[RG,d]=al  /\  CST[RG,d]=zz)  


             elseif   (RON[RG,d] = l /\ REQUESTS[RG,d] = 41) then (Clin[RG,d]=all  /\  CST[RG,d]=zz)  

             elseif   (RON[RG,d] = l /\ REQUESTS[RG,d] = 42) then (Clin[RG,d]=cll  /\  CST[RG,d]=zz)  

             elseif   (RON[RG,d] = l /\ REQUESTS[RG,d] = 43) then (Clin[RG,d]=lsll  /\  CST[RG,d]=zz)  


             else     (Clin[RG,d]= zz /\ CST[RG,d]=zz)
             endif);




%%GM
constraint forall(doc = GM,d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624 /\  CST[doc,d]=c1416)  
             
             
             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             %elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = AL) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 47) then (Clin[doc,d]=perll /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 48) then (Clin[doc,d]=SABB /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 49) then (Clin[doc,d]=PHNW /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);

%%DB
constraint forall(doc in {DB},d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=zz)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  
             

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
%CC
constraint forall(doc in {CC},d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=zz)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
             %elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  
             
             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
      
%MC
constraint forall(doc = MC,d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  
             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  


             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
 
                       
%SD
constraint forall(doc in {SD},d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s81730 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a81730 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i81730 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p /\ d mod 7 = thursday then (Clin[doc,d]=p1324  /\  CST[doc,d]=zz)  
             
             elseif   RON[doc,d] = p /\ d mod 7 = saturday then (Clin[doc,d]=p1524  /\  CST[doc,d]=zz)  

%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
                  
%HL
constraint forall(doc in { HL },d in days)
           
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s816 /\ CST[doc,d]=1618)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a816 /\ CST[doc,d]=c1618)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
                  
%ML
constraint forall(doc in { ML },d in days)
           
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=zz)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  /\ d mod 7 = thursday then (Clin[doc,d]= a812 /\ CST[doc,d]=c1218)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1424  /\  CST[doc,d]=zz)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);




%DL

constraint forall(doc in { DL },d in days)
           
             (if      RON[doc,d] = c then  (Clin[doc,d]=zz    /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz  ) 
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1424  /\  CST[doc,d]=zz )  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al     /\  CST[doc,d]=zz )  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  
             

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             
             endif);
                       
%RM
constraint forall(doc in { RM },d in days)
           
             (if      RON[doc,d] = c then  (Clin[doc,d]=zz    /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz  ) 
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416 )  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al     /\  CST[doc,d]=zz )  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=all  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cll  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsll  /\  CST[doc,d]=zz)  
             

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             
             endif);

%GN  from here for annual leave conf leave and lsl 
constraint forall(doc = GN ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
               

             elseif   ron(doc,d,p) /\ d mod 7 = monday                then  c_cs(doc,d,p1624,c1416)  
             elseif   ron(doc,d,p) /\ d mod 7 = wednesday             then  c_cs(doc,d,p1323,c1113)  
             elseif   ron(doc,d,p) /\ d mod 7 = saturday              then  c_cs(doc,d,p1624,zz)  


             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);

%EW
constraint forall(doc = EW ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,c1216) 
               

             elseif   ron(doc,d,p) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,a) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,a818,zz)  

             elseif   ron(doc,d,s) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,s818,zz)  

             elseif   ron(doc,d,i) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,i818,zz)  
                          
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,c1718)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,c1718) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,c1718)
             
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  44  then c_cs(doc,d,patll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);







%LB

constraint forall(doc = LB , d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,c818) 
               
             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
              elseif   ((RON[doc,d] = a) /\ d in wednesdays)  then c_cs(doc,d,a814,c1418) 

             elseif   RON[doc,d] = a  then c_cs(doc,d,a818,zz) 
             
             elseif   RON[doc,d] = i  then c_cs(doc,d,i818,zz)
             
             elseif   RON[doc,d] = p /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,p1624,zz)  

             elseif   RON[doc,d] = p then c_cs(doc,d,p1624,c1416)  
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  48  then c_cs(doc,d,SABB,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);

%%FIX HERE
constraint forall(doc = DH ,d in days)
           
             (if      ron(doc,d,c)    then  c_cs(doc,d,zz,c818)
               
             
             elseif   RON[doc,d] = s  then c_cs(doc,d,s818,zz)
            
             elseif   RON[doc,d] = a  then c_cs(doc,d,a818,zz) 
             
             elseif   RON[doc,d] = i  then c_cs(doc,s,i818,zz)
             
             elseif   ((RON[doc,d] = p) /\ d mod 7 in {saturday,sunday})  then c_cs(doc,d,p1724,zz)  
             
             elseif   RON[doc,d] = p  /\ d mod 7 in {friday, monday} then c_cs(doc,d,p1424,zz)  %monday friday pms if not saturday sunday pm

             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);


%SK
constraint forall(doc = SK ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,c1116) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,zz)
             
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d] =  41  then c_cs(doc,d,all,zz )     %annual
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d] =  42  then c_cs(doc,d,cll,zz )     % conference
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d] =  43  then c_cs(doc,d,lsll,zz )    % LSL
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=   45  then c_cs(doc,d,matll,zz )    % mat leave

             else     c_cs(doc,d,zz,zz)
             
             endif);

%BL
constraint forall(doc = BL ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   (ron(doc,d,p) /\ p mod 7 = thursday) then c_cs(doc,d,p1624,c1416)  

             elseif   (ron(doc,d,p) /\ p mod 7 = sunday ) then c_cs(doc,d,p1624,zz)  %sunday pms 

             elseif   (ron(doc,d,p) /\ p mod 7 = friday ) then c_cs(doc,d,p1624,zz)  %sunday pms 

                          elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);

%RP
%RP
constraint forall(doc = RP ,d in days)
           
             (if      ron(doc,d,c) /\ d mod 7 = friday then  c_cs(doc,d,zz,c1216) 
             
             elseif   ron(doc,d,p) /\ d mod  7 = thursday then c_cs(doc,d,p1624,c1215)  

             elseif   ron(doc,d,p) /\ d mod  7 = sunday then c_cs(doc,d,p1624,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                  
                                    
                                                                        
constraint forall(doc = AR ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                                      
                                                                                                      
constraint forall(doc = LS ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s816,c1618)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a816,c1618) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i816,c1618)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                                 
                                                
constraint forall(doc = AV ,d in days)
           
             (if      ron(doc,d,c) /\ d mod 7 = wednesday  then  c_cs(doc,d,zz,c818) 
             
             elseif   ron(doc,d,c) /\ d mod 7 != wednesday  then c_cs(doc,d,zz,c1215)  

             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  


             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,c1718)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,c1718) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,c1718)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                                 

constraint forall(doc = LC ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                    
constraint forall(doc = KM ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s816,c1618)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,s816,c1618) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i816,c1618)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  44  then c_cs(doc,d,patll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  45  then c_cs(doc,d,matll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  46  then c_cs(doc,d,LWOPl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  47  then c_cs(doc,d,perll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  48  then c_cs(doc,d,SABB,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  49  then c_cs(doc,d,PHNW,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                      
                                                                                                                                                            

constraint forall(doc = DZ ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a81730,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
constraint forall(doc = BB ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a1020,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
constraint forall(doc = CP ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a1217,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  44  then c_cs(doc,d,patll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  45  then c_cs(doc,d,matll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  46  then c_cs(doc,d,LWOPl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  47  then c_cs(doc,d,perll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  48  then c_cs(doc,d,SABB,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  49  then c_cs(doc,d,PHNW,zz )  

             
             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          
             
constraint forall(doc = JD ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a918,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          

constraint forall(doc = CK ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   (ron(doc,d,p) /\ d mod 7 = friday) then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,p) then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          

constraint forall(doc = NM ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s816,c1618)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a816,c1618) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i816,c1618)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          

constraint forall(doc = TB ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s816,c1618)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a816,c1618) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i816,c1618)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,all,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cll,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsll,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                      
output["\n"];
output["\n"];

                                                      
%%%% empnum date area shift role start finish hours oncall1 oncall2 RNspace11N                                                                                                            
                                                                                                                                                                  
                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                                                                                                                          



output["\n"];
output["\n"];
output["\n"];

/*
output [if fix(Clin[doc,day] != zz) then show(emp_num[doc]) ++ " " ++ show(day) ++ " " ++ show(doc) ++ " " ++ show(area) ++ " " ++ show(Clin[doc,day]) ++ " " ++ show(CST[doc,day]) ++ "\n" else "" endif

        |doc in {RG,GM,DB,SD,RM,EW,LB}, day in days];

*/


%%THIS WORKS TO DUMP ONCALL 

output["\n"];


output["\n"];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% empnum date area shift role start finish hours oncall1 oncall2 RNspace11N                                                                                                            


output["FINALISED ROSTERON OUTPUT GM FT PT ONCALL\n\n\n"];


%%RG separate area unfortunately
                                     
                                                                         
output [if fix(Clin[doc,day]) != zz then 
                                   show(fix(get_empnum(doc)))       ++ sep ++ 
                                   show(get_day(day))               ++ sep ++ 
                                   get_area(doc)                    ++ sep ++

                                   get_desc (fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_role(doc)                    ++ sep  ++ 
                                   get_start(fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_fin(  fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_hrs(  fix(Clin[doc,day]))    ++ sep  ++ 
                                   
                                     dag_end ++ "\n" 

       else "" endif |doc in docs, day in days];

output [if fix(CST[doc,day]) != zz then show(fix(get_empnum(doc))) ++ sep 
                                ++ show(get_day(day)) ++ sep ++
                                get_area(doc) ++ sep  ++

                                get_desc (fix(CST[doc,day]))   ++ sep ++ get_role(doc) ++ sep ++ 
                                get_start(fix(CST[doc,day]))   ++ sep ++ 
                                get_fin  (fix(CST[doc,day]))   ++ sep ++ 
                                get_hrs( fix(CST[doc,day]))    ++ sep ++ 
                               
                                dag_end ++ "\n" 

       else "" endif |doc in docs, day in days];

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            %%ONCALL 
%output[show(emp_num[docs[display_oncall[day]]]) ++ " " ++ show(day) ++ " " ++ show(docs[display_oncall[day]]) ++ " " ++ show(area) ++ "\n" | day in days]; 

%%oncall using doc_get_empnum

output[show(get_empnum(fix(display_oncall[day])))     ++ sep ++ 
            get_day(day)                              ++ sep ++ 
            area                                      ++ sep ++ 
            oncall_shift                              ++ sep ++ 
            show(get_role(fix(display_oncall[day])))  ++ sep ++  
            "00:00"                                   ++ sep ++ 
            "00:00"                                   ++ sep ++ 
            "00:00"                                   ++ sep ++ 
            on_call_dag_end ++ "\n" 
            
            | day in days]; 


                        
%%ONE WEEK AT TIME  ONCALL AT TOP   WITH CLINICAL THEN CLINICAL SUPPORT 

output[ show(roster[display_oncall[day],day])  ++ " " ++ "dr is " ++ show(display_oncall[day]) ++ "  " ++ show(get_empnum((fix(display_oncall[day])))) ++ " "  ++ get_day(day) ++ "\n" | day in days];




output["\n\nWEEK 1\n"];
output["     "];output[get_day(day) ++ "      \t    " | day in 1..7];output["\n"];
output["=================================================================================================================================================================\n"];
output["\t"];output[show(display_oncall[day])   ++ "\t||\t" | day in 1..7  ];output["ONCALL-SMSPT->OC cat 2 \n"];
output["=================================================================================================================================================================\n"];
output[" \tMo\t||\t Tu\t||\t We\t||\t Th\t||\t Fr\t||\t Sa\t||\t Su\t||\t\n"];
output["==================================================================================================================================================================\n"];
output[show(Clin[doc,day]) ++ "\t|" ++ show(CST[doc,day]) ++ "\t||" ++ if day mod 7 = sunday then show(doc) ++ " " ++ get_role(doc) ++ "\n" else "" endif | doc in docs, day in 1..7 ];
output["==================================================================================================================================================================\n"];


output["\n\nWEEK 2\n"];
output["     "];output[get_day(day) ++ "       \t    " | day in 8..14];output["\n"];
output["=================================================================================================================================================================\n"];
output["\t"];output[show(display_oncall[day])   ++ "\t||\t" | day in 8..14  ];output["ONCALL-SMSPT->OC cat 2 \n"];
output["=================================================================================================================================================================\n"];
output[" \tMo\t||\t Tu\t||\t We\t||\t Th\t||\t Fr\t||\t Sa\t||\t Su\t||\t\n"];
output["==================================================================================================================================================================\n"];
output[show(Clin[doc,day]) ++ "\t|" ++ show(CST[doc,day]) ++ "\t||" ++ if day mod 7 = sunday then show(doc) ++ " " ++ get_role(doc) ++ "\n" else "" endif | doc in docs, day in 8..14 ];
output["==================================================================================================================================================================\n"];

output[if shift !=zz then show(shift) ++ "\t" ++ get_desc(shift) ++ "\t" ++ get_start(shift) ++ " \t" ++ get_fin(shift) ++ " \t" ++ get_hrs(shift) ++ "\n"  else "" endif | shift in shifts2];
