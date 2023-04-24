%%strings and functions build shift strings.


string: area = "12240-B0006-01" ;
string: sep  = "*";


string: rg_area = area;


function string: get_area(docs:doc) = 
      (if doc = RG then rg_area 
      else area
      endif);



string: rg_role = "12240-B0006-01-HOU";

string: gm_role = "12240-B0006-01-DIR";

string: FT_role = "12240-B0006-01-SMSFT";

string: PT_role = "12240-B0006-01-SMSPT";

string: sess_role = "12240-B0006-01-Ses";


string: from = "00:00";
string: to   = "00:00";
string: dag_end = join(sep,[from,to,"R","N"," "," "," ","N","N","N","N","N","N","N","N","N","N","N"]);

string: on_call_dag_end = join(sep,["23:59","07:59","R","N"," "," "," ","N","N","N","N","N","N","N","N","N","N","N"]);   %% dont know why the custom flag is "Y" three from the end but whatever!!!!!





%%annual leave code 10
%% conference leave =is    
%% Long Service Leave is ------

string: SABB_shift  = "0638";
string: SABB_shift_start  = "08:00";
string: SABB_shift_finish = "18:00";
string: SABB_shift_hours  = "10.00";

string: PHNW_shift  = "0911";
string: PHNW_shift_start  = "08:00";
string: PHNW_shift_finish = "18:00";
string: PHNW_shift_hours  = "10.00";




string: LWOP_shift  = "0605";
string: LWOP_shift_start  = "08:00";
string: LWOP_shift_finish = "18:00";
string: LWOP_shift_hours  = "10.00";




string: leave_shift  = "10";
string: leave_start  = "08:00";
string: leave_finish = "18:00";
string: leave_hours  = "10.00";  %%%FIX THIS 10:00 get translated to 0.416!!!! needs to be 10.00

string: cleave_shift  = "0634";
string: cleave_start  = "08:00";
string: cleave_finish = "18:00";
string: cleave_hours  = "10.00";  

string: lsleave_shift  = "LPPA";
string: lsleave_start  = "08:00";
string: lsleave_finish = "18:00";
string: lsleave_hours  = "10.00"; 

string: patleave_shift  = "0657";
string: patleave_start  = "08:00";
string: patleave_finish = "18:00";
string: patleave_hours  = "10.00"; 

string: matleave_shift  = "0667";
string: matleave_start  = "08:00";
string: matleave_finish = "18:00";
string: matleave_hours  = "10.00";  %%%FIX THIS 10:00 get translated to 0.416!!!! needs to be 10.00

string: personal_leave_shift  = "25";
string: personal_leave_start  = "08:00";
string: personal_leave_finish = "18:00";
string: personal_leave_hours  = "10.00";  %%%FIX THIS 10:00 get translated to 0.416!!!! needs to be 10.00


%%OnCall-12240-B0006-01

string: oncall_shift   = "OnCall-12240-B0006-01";
string: soncall_start  = "00:00";
string: soncall_finish = "00:00";
string: soncall_from   = "23:59";
string: soncall_to     = "07:59";
string: soncall_hrs    = "08.00";


string: c816_shift   =  "CST 0800-1600-12240-B0006-01";
string: c816_start   =  "08:00";
string: c816_finish  =  "16:00";
string: c816_hours   =  "8.00";


string: c817_shift   =  "CST 0800-1700-12240-B0006-01";
string: c817_start   =  "08:00";
string: c817_finish  =  "17:00";
string: c817_hours   =  "9.00";


string: c818_shift   =  "CST 0800-1800-12240-B0006-01";
string: c818_start   =  "08:00";
string: c818_finish  =  "18:00";
string: c818_hours   =  "10.00";

string: c819_shift   =  "CST 0800-1900-12240-B0006-01";
string: c819_start   =  "08:00";
string: c819_finish  =  "19:00";
string: c819_hours   =  "11.00";


string: c1416_shift   =  "CST 1400-1600-12240-B0006-01";
string: c1416_start   =  "14:00";
string: c1416_finish  =  "16:00";
string: c1416_hours   =  "2.00";

string: c1418_shift   =  "CST 1400-1800-12240-B0006-01";
string: c1418_start   =  "14:00";
string: c1418_finish  =  "18:00";
string: c1418_hours   =  "4.00";

string: c1618_shift   =  "CST 1600-1800-12240-B0006-01";
string: c1618_start   =  "16:00";
string: c1618_finish  =  "18:00";
string: c1618_hours   =  "2.00";


string: c1113_shift   =  "CST 1100-1300-12240-B0006-01";   %%GN
string: c1113_start   =  "11:00";
string: c1113_finish  =  "13:00";
string: c1113_hours   =  "2.00";
%string: c1113_shift_d =  "CST 1100-1300";

string: c1116_shift   =  "CST 1100-1600-12240-B0006-01";  
string: c1116_start   =  "11:00";
string: c1116_finish  =  "16:00";
string: c1116_hours   =  "5.00";
%string: c1116_shift_d =  "CST 1100-1600";

string: c1215_shift   =  "CST 1200-1500-12240-B0006-01";  
string: c1215_start   =  "12:00";
string: c1215_finish  =  "15:00";
string: c1215_hours   =  "3.00";
string: c1215_shift_d =  "CST 1200-1600";


string: c1216_shift   =  "CST 1200-1600-12240-B0006-01";  
string: c1216_start   =  "12:00";
string: c1216_finish  =  "16:00";
string: c1216_hours   =  "4.00";
string: c1216_shift_d =  "CST 1200-1600";




string: c1718_shift   =  "CST 1700-1800-12240-B0006-01";
string: c1718_start   =  "17:00";
string: c1718_finish  =  "18:00";
string: c1718_hours   =  "1.00";
string: c1718_shift_d =  "CST 1700-1800";

                         %"CST 1200-1800-SSU-B0006-01"
string: c1218_shift   =  "CST 1200-1800-SSU-12240-B0006-01";
string: c1218_start   =  "12:00";
string: c1218_finish  =  "18:00";
string: c1218_hours   =  "6.00";
string: c1218_shift_d =  "CST 1200-1800";



string: a812_shift    = "MH 0800-1200-12240-B0006-01";
string: a812_start    = "08:00";
string: a812_finish   = "12:00";
string: a812_hours    = "4.00"; 
string: a812_shift_d  = "MH 0800-1200";

string: i812_shift    = "MH 0800-1200-12240-IC-B0006-01";
string: i812_start    = "08:00";
string: i812_finish   = "12:00";
string: i812_hours    = "4.00"; 
string: i812_shift_d  = "MH 0800-1200 IC";

string: s812_shift    = "MH 0800-1200-12240-SSU-B0006-01";
string: s812_start    = "08:00";
string: s812_finish   = "12:00";
string: s812_hours    = "4.00"; 
string: s812_shift_d  = "MH 0800-1200 SSU";

string: a814_shift    = "MH 0800-1400 -12240-B0006-01";
string: a814_start    = "08:00";
string: a814_finish   = "14:00";
string: a814_hours    = "6.00"; 
string: a814_shift_d  = "MH 0800-1400";

string: i814_shift    = "MH 0800-1400-IC-12240-B0006-01";
string: i814_start    = "08:00";
string: i814_finish   = "14:00";
string: i814_hours    = "6.00"; 
string: i814_shift_d  = "MH 0800-1400 IC";

string: s814_shift    = "MH 0800-1400-SSU-12240-B0006-01";
string: s814_start    = "08:00";
string: s814_finish   = "14:00";
string: s814_hours    = "6.00"; 
string: s814_shift_d  = "MH 0800-1400 SSU";


string: a816_shift    = "MH 0800-1600-12240-B0006-01";
string: a816_start    = "08:00";
string: a816_finish   = "16:00";
string: a816_hours    = "8.00"; 
string: a816_shift_d  = "MH 0800-1600";

string: i816_shift    = "MH 0800-1600-IC-12240-B0006-01";
string: i816_start    = "08:00";
string: i816_finish   = "16:00";
string: i816_hours    = "8.00"; 
string: i816_shift_d  = "MH 0800-1600 IC";

string: s816_shift    = "MH 0800-1600-SSU-12240-B0006-01";
string: s816_start    = "08:00";
string: s816_finish   = "16:00";
string: s816_hours    = "8.00"; 
string: s816_shift_d  = "MH 0800-1600 SSU";




string: a818_shift    = "MH 0800-1800 -12240-B0006-01";
string: a818_start    = "08:00";
string: a818_finish   = "18:00";
string: a818_hours    = "10.00"; 
string: a818_shift_d  = "MH 0800-1800";

string: a1217_shift    = "MH 1200-1700 -12240-B0006-01";
string: a1217_start    = "12:00";
string: a1217_finish   = "17:00";
string: a1217_hours    = "5.00"; 
string: a1217_shift_d  = "MH 1200 -1700";


string: a918_shift    = "MH 0900-1800 -12240-B0006-01";
string: a918_start    = "09:00";
string: a918_finish   = "18:00";
string: a918_hours    = "9.00"; 
string: a918_shift_d  = "MH 0900-1700";




string: a817_shift    = "MH 0800-1700 -12240-B0006-01";
string: a817_start    = "08:00";
string: a817_finish   = "17:00";
string: a817_hours    = "9.00"; 
string: a817_shift_d  = "MH 0800-1700";

string: a81730_shift    = "MH 0800-1730-12240-B0006-01";
string: a81730_start    = "08:00";
string: a81730_finish   = "17:30";
string: a81730_hours    = "9.50"; 
string: a81730_shift_d  = "MH 0800-1730";

string: a1020_shift    = "MH 1000-2000 -12240-B0006-01";
string: a1020_start    = "10:00";
string: a1020_finish   = "20:00";
string: a1020_hours    = "10.00"; 
string: a1020_shift_d  = "MH 1000-2000";



string: i818_shift    = "MH 0800-1800 IC-12240-B0006-01";
string: i818_start    = "08:00";
string: i818_finish   = "18:00";
string: i818_hours    = "10.00"; 
string: i818_shift_d  = "MH 0800-1800 IC";

string: i817_shift    = "MH 0800-1700 IC-12240-B0006-01";
string: i817_start    = "08:00";
string: i817_finish   = "17:00";
string: i817_hours    = "9.00"; 
string: i817_shift_d  = "MH 0800-1700 IC";

string: i81730_shift    = "MH 0800-1730-IC-12240-B0006-01";
string: i81730_start    = "08:00";
string: i81730_finish   = "17:30";
string: i81730_hours    = "9.50"; 
string: i81730_shift_d  = "MH 0800-1730 IC";

string: s81730_shift    = "MH 0800-1730-SSU-12240-B0006-01";
string: s81730_start    = "08:00";
string: s81730_finish   = "17:30";
string: s81730_hours    = "9.50"; 
string: s81730_shift_d  = "MH 0800-1730 SSU";

string: s818_shift    = "MH 0800-1800 SSU-12240-B0006-01";
string: s818_start    = "08:00";
string: s818_finish   = "18:00";
string: s818_hours    = "10.00"; 
string: s818_shift_d  = "MH 0800-1800 SSU";

string: s817_shift    = "MH 0800-1700 SSU-12240-B0006-01";
string: s817_start    = "08:00";
string: s817_finish   = "17:00";
string: s817_hours    = "9.00"; 
string: s817_shift_d  = "MH 0800-1800 SSU";

string: p1224_shift    = "MH 1200-2400 -12240-B0006-01";
string: p1224_start    = "12:00";
string: p1224_finish   = "24:00";
string: p1224_hours    = "12.00";
string: p1224_shift_d  = "MH 1200-2400";


string: p1724_shift    = "MH 1700-2400 -12240-B0006-01";
string: p1724_start    = "17:00";
string: p1724_finish   = "24:00";
string: p1724_hours    = "7.00";
string: p1724_shift_d  = "MH 1700-2400";


string: p1624_shift    = "MH 1600-2400 -12240-B0006-01";
string: p1624_start    = "16:00";
string: p1624_finish   = "24:00";
string: p1624_hours    = "8.00";
string: p1624_shift_d  = "MH 1600-2400";

string: p1524_shift    = "MH 1500-2400 -12240-B0006-01";
string: p1524_start    = "15:00";
string: p1524_finish   = "24:00";
string: p1524_hours    = "9.0";
string: p1524_shift_d  = "MH 1500-2400";

string: p1424_shift    = "MH 1400-2400 -12240-B0006-01";
string: p1424_start    = "14:00";
string: p1424_finish   = "24:00";
string: p1424_hours    = "10.00";
string: p1424_shift_d  = "MH 1400-2400";

string: p1323_shift    = "MH 1300-2300 -12240-B0006-01";
string: p1323_start    = "13:00";
string: p1323_finish   = "23:00";
string: p1323_hours    = "10.00";
string: p1323_shift_d  = "MH 1300-2400";

string: p1324_shift    = "MH 1300-2400-12240-B0006-01";
string: p1324_start    = "13:00";
string: p1324_finish   = "24:00";
string: p1324_hours    = "11.00";
string: p1324_shift_d  = "MH 1300-2400";


enum shifts2 = {  a812  , %1
                  a814  , %2
                  a816  ,
                  a817  ,
                  a81730,
                  a818  ,
                  a918,
                  a1217  ,
                  a1020  ,
                  c1113 ,
                  %c1115 ,
                  c1116 ,
                  c1215 ,
                  c1216 ,
                  c1218 ,
                  c1416 ,
                  c1418 ,
                  c1618 ,
                  c1718 ,
                  c816  ,
                  c818  ,
                  c819  ,
                  p1224 ,
                  p1323 ,
                  p1324 ,
                  p1424 ,
                  p1524 ,
                  p1624 ,
                  p1724 ,
                  s816  ,
                  s817  ,
                  s81730,
                  s818  ,
                  i816  ,
                  i817  ,
                  i81730,
                  i818  ,
                  all    ,
                  cll    ,
                  lsll   ,
                  patll  ,
                  matll  ,
                  perll  ,
                  LWOPl  ,
                  SABB   ,
                  PHNW   ,
                  zz    };


%put this in rosteronoutput



%tring: a818_str  = join("_",[area,a818_shift,a818_start,a818_finish,a818_hours,a818_shift_d,"N","N","N"]);


string: zz_shift= "zz";

%array[1..70]      of string: dates; 
%array[shifts2]   of string: shift_desc;
%dates = 


function string: get_desc(shifts2: sh) = 
               if       sh = a812 then   a812_shift
               elseif   sh = a814 then   a814_shift
               elseif   sh = a816 then   a816_shift
               elseif   sh = a817 then   a817_shift
               elseif   sh = a81730 then a81730_shift
               elseif   sh = a818  then  a818_shift  
               elseif   sh = a918  then  a918_shift  
               elseif   sh = a1217  then  a1217_shift  
               elseif   sh = a1020  then  a1020_shift  
               elseif   sh = c1113 then  c1113_shift 
               elseif   sh = c1116 then  c1116_shift 
               elseif   sh = c1215 then  c1215_shift 
               elseif   sh = c1216 then  c1216_shift 
               elseif   sh = c1218 then  c1218_shift 
               elseif   sh = c1416 then  c1416_shift 
               elseif   sh = c1418 then  c1418_shift 
               elseif   sh = c1618 then  c1618_shift 
               elseif   sh = c1718 then  c1718_shift 
               elseif   sh = c816  then  c816_shift
               elseif   sh = c818  then  c818_shift
               elseif   sh = c819  then  c819_shift
               elseif   sh = p1224 then  p1224_shift 
               elseif   sh = p1324 then  p1324_shift   
               elseif   sh = p1323 then  p1323_shift 
               elseif   sh = p1424 then  p1424_shift 
               elseif   sh = p1524 then  p1524_shift 
               elseif   sh = p1624 then  p1624_shift 
               elseif   sh = p1724 then  p1724_shift 
               elseif   sh = s816  then  s816_shift 
               elseif   sh = s818  then  s818_shift 
               elseif   sh = s817  then  s817_shift  
               elseif   sh = s81730 then s81730_shift
               elseif   sh = i816   then i816_shift  
               elseif   sh = i817   then i817_shift  
               elseif   sh = i818   then i818_shift  
               elseif   sh = i81730 then i81730_shift
               elseif   sh = all     then leave_shift   
               elseif   sh = cll     then cleave_shift   
               elseif   sh = lsll     then lsleave_shift   
               elseif   sh = patll     then patleave_shift   
               elseif   sh = matll     then matleave_shift   
               elseif   sh = perll     then personal_leave_shift   
               elseif   sh = LWOPl     then LWOP_shift            
               elseif   sh = SABB      then SABB_shift            
               elseif   sh = PHNW      then PHNW_shift            
               else     "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnNO DESCRIPTION SHIFT"
               endif;
function string: get_start(shifts2: sh) = 
               if       sh = a812 then   a812_start
               elseif   sh = a814 then   a814_start
               elseif   sh = a816 then   a816_start
               elseif   sh = a817 then   a817_start
               elseif   sh = a81730 then a81730_start
               elseif   sh = a818  then  a818_start
               elseif   sh = a918  then  a918_start
               elseif   sh = a816  then  a816_start
               elseif   sh = a1217  then  a1217_start
               elseif   sh = a1020  then  a1020_start
               elseif   sh = c1113 then  c1113_start 
               elseif   sh = c1116 then  c1116_start 
               elseif   sh = c1215 then  c1215_start 
               elseif   sh = c1216 then  c1216_start 
               elseif   sh = c1218 then  c1218_start 
               elseif   sh = c1416 then  c1416_start 
               elseif   sh = c1418 then  c1418_start 
               elseif   sh = c1618 then  c1618_start 
               elseif   sh = c1718 then  c1718_start 
               elseif   sh = c816  then  c816_start
               elseif   sh = c818  then  c818_start
               elseif   sh = c819  then  c819_start
               elseif   sh = p1224 then  p1224_start 
               elseif   sh = p1323 then  p1323_start 
               elseif   sh = p1324 then  p1324_start 
               elseif   sh = p1424 then  p1424_start 
               elseif   sh = p1524 then  p1524_start 
               elseif   sh = p1624 then  p1624_start 
               elseif   sh = p1724 then  p1724_start 
               elseif   sh = s816  then  s816_start 
               elseif   sh = s818  then  s818_start 
               elseif   sh = s817  then  s817_start  
               elseif   sh = s81730 then s81730_start
               elseif   sh = i816   then i816_start  
               elseif   sh = i817   then i817_start  
               elseif   sh = i818   then i818_start  
               elseif   sh = i81730 then i81730_start
               elseif   sh = all     then leave_start  
               elseif   sh = cll     then cleave_start  
               elseif   sh = lsll     then lsleave_start  
               elseif   sh = patll     then patleave_start  
               elseif   sh = matll     then matleave_start  
               elseif   sh = perll     then personal_leave_start  
               elseif   sh = LWOPl     then LWOP_shift_start            
               elseif   sh = SABB     then SABB_shift_start            
               elseif   sh = PHNW     then PHNW_shift_start            

               else     " nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnNO START TIME"
               endif;
function string: get_fin(shifts2: sh) = 
               if       sh = a812 then   a812_finish
               elseif   sh = a814 then   a814_finish
               elseif   sh = a816 then   a816_finish
               elseif   sh = a817 then   a817_finish
               elseif   sh = a81730 then a81730_finish
               elseif   sh = a818  then  a818_finish
               elseif   sh = a918  then  a918_finish
               elseif   sh = a1217  then  a1217_finish
               elseif   sh = a1020  then  a1020_finish
               elseif   sh = c1113 then  c1113_finish
               elseif   sh = c1116 then  c1116_finish
               elseif   sh = c1215 then  c1215_finish
               elseif   sh = c1216 then  c1216_finish
               elseif   sh = c1218 then  c1218_finish
               elseif   sh = c1416 then  c1416_finish
               elseif   sh = c1418 then  c1418_finish 
               elseif   sh = c1618 then  c1618_finish 
               elseif   sh = c1718 then  c1718_finish 
               elseif   sh = c816  then  c816_finish
               elseif   sh = c818  then  c818_finish
               elseif   sh = c819  then  c819_finish
               elseif   sh = p1224 then  p1224_finish 
               elseif   sh = p1323 then  p1323_finish
               elseif   sh = p1324 then  p1324_finish
               elseif   sh = p1424 then  p1424_finish 
               elseif   sh = p1524 then  p1524_finish 
               elseif   sh = p1624 then  p1624_finish 
               elseif   sh = p1724 then  p1724_finish
               elseif   sh = s816  then  s816_finish 
               elseif   sh = s818  then  s818_finish 
               elseif   sh = s817  then  s817_finish  
               elseif   sh = s81730 then s81730_finish
               elseif   sh = i816   then i816_finish
               elseif   sh = i817   then i817_finish  
               elseif   sh = i818   then i818_finish  
               elseif   sh = i81730 then i81730_finish
               elseif   sh = all     then leave_finish    
               elseif   sh = cll     then cleave_finish    
               elseif   sh = lsll     then lsleave_finish    
               elseif   sh = patll     then patleave_finish    
               elseif   sh = matll     then matleave_finish    
               elseif   sh = perll     then personal_leave_finish    
               elseif   sh = LWOPl     then LWOP_shift_finish            
               elseif   sh = SABB     then SABB_shift_finish            
               elseif   sh = PHNW     then PHNW_shift_finish            
               
               else     "NnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnO FINISH TIME"
               endif;

function string: get_hrs(shifts2: sh) = 
               if       sh = a812 then   a812_hours
               elseif   sh = a814 then   a814_hours
               elseif   sh = a816 then   a816_hours
               elseif   sh = a817 then   a817_hours
               elseif   sh = a81730 then a81730_hours
               elseif   sh = a818  then  a818_hours
               elseif   sh = a918  then  a918_hours
               elseif   sh = a816  then  a816_hours
               elseif   sh = a1217  then  a1217_hours
               elseif   sh = a1020  then  a1020_hours
               elseif   sh = c1113 then  c1113_hours
               elseif   sh = c1116 then  c1116_hours
               elseif   sh = c1215 then  c1215_hours
               elseif   sh = c1216 then  c1216_hours
               elseif   sh = c1218 then  c1218_hours
               elseif   sh = c1416 then  c1416_hours
               elseif   sh = c1418 then  c1418_hours
               elseif   sh = c1618 then  c1618_hours
               elseif   sh = c1718 then  c1718_hours 
               elseif   sh = c816  then  c816_hours
               elseif   sh = c818  then  c818_hours
               elseif   sh = c819  then  c819_hours
               elseif   sh = p1224 then  p1224_hours 
               elseif   sh = p1323 then  p1323_hours
               elseif   sh = p1324 then  p1324_hours
               elseif   sh = p1424 then  p1424_hours 
               elseif   sh = p1524 then  p1524_hours 
               elseif   sh = p1624 then  p1624_hours 
               elseif   sh = p1724 then  p1724_hours
               elseif   sh = s816  then  s816_hours
               elseif   sh = s818  then  s818_hours
               elseif   sh = s817  then  s817_hours 
               elseif   sh = s81730 then s81730_hours
               elseif   sh = i816   then i816_hours
               elseif   sh = i817   then i817_hours  
               elseif   sh = i818   then i818_hours  
               elseif   sh = i81730 then i81730_hours
               elseif   sh = all     then leave_hours    
               elseif   sh = cll     then cleave_hours    
               elseif   sh = lsll    then lsleave_hours    
               elseif   sh = patll    then patleave_hours    
               elseif   sh = matll    then matleave_hours    
               elseif   sh = perll    then personal_leave_hours
               elseif   sh = LWOPl     then LWOP_shift_hours            
               elseif   sh = SABB     then SABB_shift_hours            
               elseif   sh = PHNW     then PHNW_shift_hours            
                   
               else     "nnnnnnnnnnnnnnnnnnnnnnnnoooooooooooooooo hhhhhhhhrrrrrrrrrrrrsssssss"
               endif;


