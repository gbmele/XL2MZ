array[docs,1..70] of var int: REQUESTS; 

%GM
array[1..70] of var int: GM_requests = array1d(1..70,[

47,	47,	47,	47,	99,	99,	99,	% 	GM day 7          1a 2p 3ap 4c 91!a  92!p 
4,	2,	99,	4,	99,	99,	1,	% 	GM day 14          1a 2p 3ap 4c 91!a  92!p 

4,	2,	99,	4,	4,	99,	99,	% 	GM day 21          1a 2p 3ap 4c 91!a  92!p 
4,	2,	99,	4,	4,	99,	99,	% 	GM day 28          1a 2p 3ap 4c 91!a  92!p 

4,	2,	99,	4,	4,	99,	99,	% 	GM day 35          1a 2p 3ap 4c 91!a  92!p 
4,	2,	99,	4,	99,	99,	1,	% 	GM day 42          1a 2p 3ap 4c 91!a  92!p 

4,	2,	99,	4,	4,	99,	99,	% 	GM day 49          1a 2p 3ap 4c 91!a  92!p 
4,	4,	99,	4,	4,	99,	99,	% 	GM day 56          1a 2p 3ap 4c 91!a  92!p 

4,	2,	99,	4,	4,	99,	99,	% 	GM day 63          1a 2p 3ap 4c 91!a  92!p 
4,	2,	99,	4,	4,	99,	99,	% 	GM day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc GM

%      constraint count(roster[GM,..],l,4);

      constraint REQUESTS[GM,1..70] = GM_requests; 

%RG
array[1..70] of var int: RG_requests = array1d(1..70,[

4,	4,	4,	4,	99,	99,	99,	% 	RG day 7          1a 2p 3ap 4c 91!a  92!p 
4,	4,	4,	99,	99,	1,	99,	% 	RG day 14          1a 2p 3ap 4c 91!a  92!p 

4,	4,	4,	2,	99,	99,	99,	% 	RG day 21          1a 2p 3ap 4c 91!a  92!p 
4,	4,	4,	99,	99,	1,	99,	% 	RG day 28          1a 2p 3ap 4c 91!a  92!p 

4,	4,	4,	2,	99,	99,	99,	% 	RG day 35          1a 2p 3ap 4c 91!a  92!p 
4,	4,	4,	2,	99,	99,	99,	% 	RG day 42          1a 2p 3ap 4c 91!a  92!p 

4,	4,	4,	2,	99,	99,	99,	% 	RG day 49          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	99,	99,	99,	% 	RG day 56          1a 2p 3ap 4c 91!a  92!p 

4,	4,	4,	2,	99,	99,	99,	% 	RG day 63          1a 2p 3ap 4c 91!a  92!p 
4,	4,	4,	2,	99,	99,	99,	% 	RG day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc RG

%      constraint count(roster[RG,..],l,4);

      constraint REQUESTS[RG,1..70] = RG_requests; 


%DB
array[1..70] of var int: DB_requests = array1d(1..70,[

1,	2,	99,	1,	1,	99,	99,	% 	DB day 7          1a 2p 3ap 4c 91!a  92!p 
1,	1,	99,	1,	2,	99,	99,	% 	DB day 14          1a 2p 3ap 4c 91!a  92!p 

1,	2,	99,	1,	1,	99,	99,	% 	DB day 21          1a 2p 3ap 4c 91!a  92!p 
1,	2,	99,	1,	1,	99,	99,	% 	DB day 28          1a 2p 3ap 4c 91!a  92!p 

1,	1,	99,	1,	2,	99,	99,	% 	DB day 35          1a 2p 3ap 4c 91!a  92!p 
1,	2,	99,	1,	99,	1,	1,	% 	DB day 42          1a 2p 3ap 4c 91!a  92!p 

1,	2,	99,	1,	1,	99,	99,	% 	DB day 49          1a 2p 3ap 4c 91!a  92!p 
1,	2,	99,	42,	42,	99,	99,	% 	DB day 56          1a 2p 3ap 4c 91!a  92!p 

42,	42,	42,	42,	99,	99,	99,	% 	DB day 63          1a 2p 3ap 4c 91!a  92!p 
42,	42,	99,	99,	99,	2,	2,	% 	DB day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc DB

%      constraint count(roster[DB,..],l,8);

      constraint REQUESTS[DB,1..70] = DB_requests; 


%MC
array[1..70] of var int: MC_requests = array1d(1..70,[

99,	1,	2,	4,	99,	1,	99,	% 	MC day 7          1a 2p 3ap 4c 91!a  92!p 
99,	1,	1,	4,	2,	99,	99,	% 	MC day 14          1a 2p 3ap 4c 91!a  92!p 

99,	1,	2,	4,	99,	1,	99,	% 	MC day 21          1a 2p 3ap 4c 91!a  92!p 
1,	1,	2,	4,	99,	99,	99,	% 	MC day 28          1a 2p 3ap 4c 91!a  92!p 

99,	99,	2,	4,	1,	2,	99,	% 	MC day 35          1a 2p 3ap 4c 91!a  92!p 
99,	1,	2,	4,	1,	99,	99,	% 	MC day 42          1a 2p 3ap 4c 91!a  92!p 

41,	41,	41,	41,	99,	99,	99,	% 	MC day 49          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	99,	99,	99,	% 	MC day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	4,	2,	99,	99,	% 	MC day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	2,	4,	1,	1,	99,	% 	MC day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc MC

%      constraint count(roster[MC,..],l,8);

      constraint REQUESTS[MC,1..70] = MC_requests; 

%CC
array[1..70] of var int: CC_requests = array1d(1..70,[

99,	1,	1,	1,	2,	99,	99,	% 	CC day 7          1a 2p 3ap 4c 91!a  92!p 
2,	99,	1,	1,	1,	99,	99,	% 	CC day 14          1a 2p 3ap 4c 91!a  92!p 

2,	99,	1,	1,	1,	99,	99,	% 	CC day 21          1a 2p 3ap 4c 91!a  92!p 
2,	99,	1,	1,	1,	99,	99,	% 	CC day 28          1a 2p 3ap 4c 91!a  92!p 

2,	99,	1,	1,	99,	1,	1,	% 	CC day 35          1a 2p 3ap 4c 91!a  92!p 
2,	99,	99,	1,	1,	99,	99,	% 	CC day 42          1a 2p 3ap 4c 91!a  92!p 

2,	99,	1,	1,	99,	2,	2,	% 	CC day 49          1a 2p 3ap 4c 91!a  92!p 
99,	1,	1,	1,	1,	99,	99,	% 	CC day 56          1a 2p 3ap 4c 91!a  92!p 

42,	42,	42,	42,	99,	99,	99,	% 	CC day 63          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	99,	99,	99,	% 	CC day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc CC

%      constraint count(roster[CC,..],l,8);

      constraint REQUESTS[CC,1..70] = CC_requests; 

%SD
array[1..70] of var int: SD_requests = array1d(1..70,[

1,	4,	1,	2,	99,	99,	2,	% 	SD day 7          1a 2p 3ap 4c 91!a  92!p 
99,	4,	1,	2,	99,	99,	99,	% 	SD day 14          1a 2p 3ap 4c 91!a  92!p 

4,	1,	99,	2,	99,	99,	1,	% 	SD day 21          1a 2p 3ap 4c 91!a  92!p 
99,	1,	4,	99,	2,	99,	1,	% 	SD day 28          1a 2p 3ap 4c 91!a  92!p 

4,	1,	1,	2,	99,	99,	99,	% 	SD day 35          1a 2p 3ap 4c 91!a  92!p 
42,	42,	42,	42,	99,	99,	99,	% 	SD day 42          1a 2p 3ap 4c 91!a  92!p 

1,	4,	1,	2,	99,	99,	99,	% 	SD day 49          1a 2p 3ap 4c 91!a  92!p 
1,	4,	1,	2,	99,	99,	99,	% 	SD day 56          1a 2p 3ap 4c 91!a  92!p 

41,	41,	41,	41,	99,	99,	99,	% 	SD day 63          1a 2p 3ap 4c 91!a  92!p 
99,	4,	1,	1,	2,	99,	99,	% 	SD day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc SD

%      constraint count(roster[SD,..],l,8);

      constraint REQUESTS[SD,1..70] = SD_requests; 


%HL
array[1..70] of var int: HL_requests = array1d(1..70,[

1,	1,	4,	2,	99,	99,	99,	% 	HL day 7          1a 2p 3ap 4c 91!a  92!p 
1,	1,	4,	2,	99,	99,	99,	% 	HL day 14          1a 2p 3ap 4c 91!a  92!p 

1,	1,	4,	99,	2,	99,	99,	% 	HL day 21          1a 2p 3ap 4c 91!a  92!p 
1,	1,	4,	2,	99,	99,	99,	% 	HL day 28          1a 2p 3ap 4c 91!a  92!p 

1,	1,	4,	2,	99,	99,	99,	% 	HL day 35          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	99,	99,	99,	% 	HL day 42          1a 2p 3ap 4c 91!a  92!p 

2,	99,	4,	99,	1,	1,	2,	% 	HL day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	4,	1,	2,	99,	99,	% 	HL day 56          1a 2p 3ap 4c 91!a  92!p 

2,	99,	4,	1,	99,	1,	2,	% 	HL day 63          1a 2p 3ap 4c 91!a  92!p 
99,	1,	4,	2,	99,	99,	99,	% 	HL day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc HL

%      constraint count(roster[HL,..],l,4);

      constraint REQUESTS[HL,1..70] = HL_requests; 

%DL
array[1..70] of var int: DL_requests = array1d(1..70,[

1,	2,	4,	1,	99,	99,	99,	% 	DL day 7          1a 2p 3ap 4c 91!a  92!p 
1,	2,	4,	1,	99,	2,	2,	% 	DL day 14          1a 2p 3ap 4c 91!a  92!p 

99,	1,	4,	1,	2,	99,	99,	% 	DL day 21          1a 2p 3ap 4c 91!a  92!p 
1,	1,	4,	1,	2,	99,	99,	% 	DL day 28          1a 2p 3ap 4c 91!a  92!p 

1,	2,	99,	1,	1,	99,	99,	% 	DL day 35          1a 2p 3ap 4c 91!a  92!p 
1,	2,	99,	1,	1,	99,	99,	% 	DL day 42          1a 2p 3ap 4c 91!a  92!p 

99,	2,	4,	99,	1,	99,	99,	% 	DL day 49          1a 2p 3ap 4c 91!a  92!p 
99,	2,	4,	99,	1,	2,	2,	% 	DL day 56          1a 2p 3ap 4c 91!a  92!p 

99,	2,	99,	1,	1,	99,	99,	% 	DL day 63          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	99,	99,	99,	% 	DL day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc DL

%     constraint count(roster[DL,..],l,4);

      constraint REQUESTS[DL,1..70] = DL_requests; 
%RM
array[1..70] of var int: RM_requests = array1d(1..70,[

99,	2,	4,	1,	1,	99,	99,	% 	RM day 7          1a 2p 3ap 4c 91!a  92!p 
1,	2,	4,	99,	1,	99,	99,	% 	RM day 14          1a 2p 3ap 4c 91!a  92!p 

1,	2,	4,	99,	1,	99,	99,	% 	RM day 21          1a 2p 3ap 4c 91!a  92!p 
1,	2,	4,	99,	1,	99,	99,	% 	RM day 28          1a 2p 3ap 4c 91!a  92!p 

1,	2,	4,	99,	1,	99,	99,	% 	RM day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	1,	1,	1,	1,	% 	RM day 42          1a 2p 3ap 4c 91!a  92!p 

99,	1,	4,	99,	2,	99,	99,	% 	RM day 49          1a 2p 3ap 4c 91!a  92!p 
1,	2,	4,	99,	99,	1,	1,	% 	RM day 56          1a 2p 3ap 4c 91!a  92!p 

99,	1,	4,	1,	2,	99,	99,	% 	RM day 63          1a 2p 3ap 4c 91!a  92!p 
1,	2,	4,	99,	1,	99,	99,	% 	RM day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc RM

%      constraint count(roster[RM,..],l,0);

      constraint REQUESTS[RM,1..70] = RM_requests; 

%GN
array[1..70] of var int: GN_requests = array1d(1..70,[

2,	99,	2,	4,	99,	2,	99,	% 	GN day 7          1a 2p 3ap 4c 91!a  92!p 
2,	99,	2,	4,	99,	2,	99,	% 	GN day 14          1a 2p 3ap 4c 91!a  92!p 

2,	99,	2,	4,	99,	2,	99,	% 	GN day 21          1a 2p 3ap 4c 91!a  92!p 
2,	99,	2,	4,	99,	2,	99,	% 	GN day 28          1a 2p 3ap 4c 91!a  92!p 

2,	99,	2,	4,	99,	2,	99,	% 	GN day 35          1a 2p 3ap 4c 91!a  92!p 
2,	99,	2,	4,	99,	2,	99,	% 	GN day 42          1a 2p 3ap 4c 91!a  92!p 

2,	99,	2,	4,	99,	2,	99,	% 	GN day 49          1a 2p 3ap 4c 91!a  92!p 
2,	99,	2,	4,	99,	2,	99,	% 	GN day 56          1a 2p 3ap 4c 91!a  92!p 

2,	99,	2,	4,	99,	2,	99,	% 	GN day 63          1a 2p 3ap 4c 91!a  92!p 
2,	99,	2,	4,	99,	2,	99,	% 	GN day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc GN

%      constraint count(roster[GN,..],l,0);

      constraint REQUESTS[GN,1..70] = GN_requests; 


%EW
array[1..70] of var int: EW_requests = array1d(1..70,[

99,	1,	1,	47,	47,	99,	99,	% 	EW day 7          1a 2p 3ap 4c 91!a  92!p 
99,	1,	2,	4,	1,	99,	99,	% 	EW day 14          1a 2p 3ap 4c 91!a  92!p 

41,	41,	41,	41,	99,	99,	99,	% 	EW day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	2,	4,	99,	1,	1,	% 	EW day 28          1a 2p 3ap 4c 91!a  92!p 

99,	1,	1,	4,	2,	99,	99,	% 	EW day 35          1a 2p 3ap 4c 91!a  92!p 
99,	1,	2,	4,	99,	2,	2,	% 	EW day 42          1a 2p 3ap 4c 91!a  92!p 

99,	1,	2,	4,	1,	99,	99,	% 	EW day 49          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	99,	99,	99,	% 	EW day 56          1a 2p 3ap 4c 91!a  92!p 

41,	41,	41,	41,	99,	99,	99,	% 	EW day 63          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	99,	99,	99,	% 	EW day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc EW

%      constraint count(roster[EW,..],l,16);

      constraint REQUESTS[EW,1..70] = EW_requests; 


%BB
array[1..70] of var int: BB_requests = array1d(1..70,[

99,	1,	1,	99,	99,	99,	99,	% 	BB day 7          1a 2p 3ap 4c 91!a  92!p 
99,	1,	1,	99,	99,	99,	99,	% 	BB day 14          1a 2p 3ap 4c 91!a  92!p 

99,	1,	1,	99,	99,	99,	99,	% 	BB day 21          1a 2p 3ap 4c 91!a  92!p 
99,	1,	1,	99,	99,	99,	99,	% 	BB day 28          1a 2p 3ap 4c 91!a  92!p 

99,	1,	1,	99,	99,	99,	99,	% 	BB day 35          1a 2p 3ap 4c 91!a  92!p 
99,	1,	1,	99,	99,	99,	99,	% 	BB day 42          1a 2p 3ap 4c 91!a  92!p 

99,	1,	1,	99,	99,	99,	99,	% 	BB day 49          1a 2p 3ap 4c 91!a  92!p 
99,	1,	1,	99,	99,	99,	99,	% 	BB day 56          1a 2p 3ap 4c 91!a  92!p 

99,	1,	1,	99,	99,	99,	99,	% 	BB day 63          1a 2p 3ap 4c 91!a  92!p 
99,	1,	1,	99,	99,	99,	99,	% 	BB day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc BB

%      constraint count(roster[BB,..],l,0);

      constraint REQUESTS[BB,1..70] = BB_requests; 


%LB
array[1..70] of var int: LB_requests = array1d(1..70,[

48,	99,	48,	99,	48,	99,	99,	% 	LB day 7          1a 2p 3ap 4c 91!a  92!p 
48,	99,	48,	99,	48,	99,	99,	% 	LB day 14          1a 2p 3ap 4c 91!a  92!p 

48,	99,	48,	99,	48,	99,	99,	% 	LB day 21          1a 2p 3ap 4c 91!a  92!p 
48,	99,	48,	99,	48,	99,	99,	% 	LB day 28          1a 2p 3ap 4c 91!a  92!p 

48,	99,	48,	99,	48,	99,	99,	% 	LB day 35          1a 2p 3ap 4c 91!a  92!p 
48,	99,	48,	99,	48,	99,	99,	% 	LB day 42          1a 2p 3ap 4c 91!a  92!p 

48,	99,	48,	99,	48,	99,	99,	% 	LB day 49          1a 2p 3ap 4c 91!a  92!p 
48,	99,	48,	99,	48,	99,	99,	% 	LB day 56          1a 2p 3ap 4c 91!a  92!p 

48,	99,	48,	99,	48,	99,	99,	% 	LB day 63          1a 2p 3ap 4c 91!a  92!p 
48,	99,	48,	99,	48,	99,	99,	% 	LB day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc LB

%      constraint count(roster[LB,..],l,30);

      constraint REQUESTS[LB,1..70] = LB_requests; 


%LC
array[1..70] of var int: LC_requests = array1d(1..70,[

99,	42,	99,	42,	99,	99,	99,	% 	LC day 7          1a 2p 3ap 4c 91!a  92!p 
99,	2,	99,	1,	99,	99,	99,	% 	LC day 14          1a 2p 3ap 4c 91!a  92!p 

99,	2,	99,	1,	99,	1,	1,	% 	LC day 21          1a 2p 3ap 4c 91!a  92!p 
99,	2,	99,	2,	99,	99,	99,	% 	LC day 28          1a 2p 3ap 4c 91!a  92!p 

99,	2,	99,	1,	99,	99,	99,	% 	LC day 35          1a 2p 3ap 4c 91!a  92!p 
99,	1,	99,	2,	99,	1,	2,	% 	LC day 42          1a 2p 3ap 4c 91!a  92!p 

99,	2,	99,	1,	99,	1,	1,	% 	LC day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	42,	99,	99,	99,	% 	LC day 56          1a 2p 3ap 4c 91!a  92!p 

99,	42,	99,	41,	99,	99,	99,	% 	LC day 63          1a 2p 3ap 4c 91!a  92!p 
99,	41,	99,	41,	99,	99,	99,	% 	LC day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc LC

%      constraint count(roster[LC,..],l,7);

      constraint REQUESTS[LC,1..70] = LC_requests; 


%DH
array[1..70] of var int: DH_requests = array1d(1..70,[

2,	99,	4,	99,	1,	99,	99,	% 	DH day 7          1a 2p 3ap 4c 91!a  92!p 
2,	99,	4,	99,	1,	99,	99,	% 	DH day 14          1a 2p 3ap 4c 91!a  92!p 

2,	99,	4,	99,	1,	2,	2,	% 	DH day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	4,	99,	2,	99,	99,	% 	DH day 28          1a 2p 3ap 4c 91!a  92!p 

2,	99,	4,	99,	1,	2,	2,	% 	DH day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	4,	99,	2,	99,	99,	% 	DH day 42          1a 2p 3ap 4c 91!a  92!p 

2,	99,	4,	99,	1,	99,	99,	% 	DH day 49          1a 2p 3ap 4c 91!a  92!p 
2,	99,	4,	99,	1,	99,	99,	% 	DH day 56          1a 2p 3ap 4c 91!a  92!p 

2,	99,	4,	99,	1,	99,	99,	% 	DH day 63          1a 2p 3ap 4c 91!a  92!p 
2,	99,	4,	99,	1,	2,	2,	% 	DH day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc DH

%      constraint count(roster[DH,..],l,0);

      constraint REQUESTS[DH,1..70] = DH_requests; 

%SK
array[1..70] of var int: SK_requests = array1d(1..70,[

45,	45,	45,	99,	99,	99,	99,	% 	SK day 7          1a 2p 3ap 4c 91!a  92!p 
45,	45,	45,	99,	99,	99,	99,	% 	SK day 14          1a 2p 3ap 4c 91!a  92!p 

45,	45,	45,	99,	99,	99,	99,	% 	SK day 21          1a 2p 3ap 4c 91!a  92!p 
45,	45,	45,	99,	99,	99,	99,	% 	SK day 28          1a 2p 3ap 4c 91!a  92!p 

45,	45,	45,	99,	99,	99,	99,	% 	SK day 35          1a 2p 3ap 4c 91!a  92!p 
45,	45,	45,	99,	99,	99,	99,	% 	SK day 42          1a 2p 3ap 4c 91!a  92!p 

45,	45,	45,	99,	99,	99,	99,	% 	SK day 49          1a 2p 3ap 4c 91!a  92!p 
45,	45,	45,	99,	99,	99,	99,	% 	SK day 56          1a 2p 3ap 4c 91!a  92!p 

45,	45,	45,	99,	99,	99,	99,	% 	SK day 63          1a 2p 3ap 4c 91!a  92!p 
45,	45,	45,	99,	99,	99,	99,	% 	SK day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc SK

%      constraint count(roster[SK,..],l,30);

      constraint REQUESTS[SK,1..70] = SK_requests; 


%BL
array[1..70] of var int: BL_requests = array1d(1..70,[

42,	42,	99,	99,	99,	99,	99,	% 	BL day 7          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	1,	2,	99,	99,	% 	BL day 14          1a 2p 3ap 4c 91!a  92!p 

3,	99,	99,	3,	99,	99,	99,	% 	BL day 21          1a 2p 3ap 4c 91!a  92!p 
41,	41,	99,	99,	99,	99,	99,	% 	BL day 28          1a 2p 3ap 4c 91!a  92!p 

41,	41,	99,	99,	99,	99,	99,	% 	BL day 35          1a 2p 3ap 4c 91!a  92!p 
41,	41,	99,	99,	99,	99,	99,	% 	BL day 42          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	3,	99,	99,	2,	% 	BL day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	1,	2,	99,	99,	% 	BL day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	2,	99,	99,	2,	% 	BL day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	1,	2,	99,	99,	% 	BL day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc BL

%      constraint count(roster[BL,..],l,8);

      constraint REQUESTS[BL,1..70] = BL_requests; 

%ML
array[1..70] of var int: ML_requests = array1d(1..70,[

99,	99,	1,	1,	99,	99,	1,	% 	ML day 7          1a 2p 3ap 4c 91!a  92!p 
99,	99,	41,	1,	99,	99,	1,	% 	ML day 14          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	1,	99,	99,	1,	% 	ML day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	1,	99,	99,	2,	% 	ML day 28          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	1,	99,	99,	2,	% 	ML day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	1,	99,	99,	1,	% 	ML day 42          1a 2p 3ap 4c 91!a  92!p 

99,	99,	41,	1,	99,	99,	1,	% 	ML day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	41,	1,	99,	99,	2,	% 	ML day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	1,	99,	99,	1,	% 	ML day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	1,	99,	99,	1,	% 	ML day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc ML

%      constraint count(roster[ML,..],l,3);

      constraint REQUESTS[ML,1..70] = ML_requests; 


%CP
array[1..70] of var int: CP_requests = array1d(1..70,[

99,	99,	1,	99,	99,	99,	99,	% 	CP day 7          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	CP day 14          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	CP day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	CP day 28          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	CP day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	CP day 42          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	CP day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	CP day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	CP day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	CP day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc CP

%      constraint count(roster[CP,..],l,0);

      constraint REQUESTS[CP,1..70] = CP_requests; 


%RP
array[1..70] of var int: RP_requests = array1d(1..70,[

99,	1,	99,	2,	99,	99,	2,	% 	RP day 7          1a 2p 3ap 4c 91!a  92!p 
99,	1,	99,	2,	4,	99,	2,	% 	RP day 14          1a 2p 3ap 4c 91!a  92!p 

99,	1,	99,	2,	99,	99,	2,	% 	RP day 21          1a 2p 3ap 4c 91!a  92!p 
99,	1,	99,	2,	4,	99,	2,	% 	RP day 28          1a 2p 3ap 4c 91!a  92!p 

99,	1,	99,	2,	99,	99,	2,	% 	RP day 35          1a 2p 3ap 4c 91!a  92!p 
99,	1,	99,	2,	4,	99,	2,	% 	RP day 42          1a 2p 3ap 4c 91!a  92!p 

99,	1,	99,	2,	99,	99,	2,	% 	RP day 49          1a 2p 3ap 4c 91!a  92!p 
99,	1,	99,	2,	4,	99,	2,	% 	RP day 56          1a 2p 3ap 4c 91!a  92!p 

99,	1,	99,	2,	99,	99,	2,	% 	RP day 63          1a 2p 3ap 4c 91!a  92!p 
99,	1,	99,	2,	4,	99,	2,	% 	RP day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc RP

%      constraint count(roster[RP,..],l,0);

      constraint REQUESTS[RP,1..70] = RP_requests; 


%AR
array[1..70] of var int: AR_requests = array1d(1..70,[

99,	99,	1,	1,	99,	99,	99,	% 	AR day 7          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	1,	99,	% 	AR day 14          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	1,	99,	99,	99,	% 	AR day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	1,	99,	99,	99,	% 	AR day 28          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	1,	99,	99,	99,	% 	AR day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	41,	41,	99,	99,	99,	% 	AR day 42          1a 2p 3ap 4c 91!a  92!p 

99,	99,	41,	41,	99,	99,	99,	% 	AR day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	41,	41,	99,	99,	99,	% 	AR day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	41,	41,	99,	99,	99,	% 	AR day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	42,	42,	99,	99,	99,	% 	AR day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc AR

%      constraint count(roster[AR,..],l,10);

      constraint REQUESTS[AR,1..70] = AR_requests; 


%LS
array[1..70] of var int: LS_requests = array1d(1..70,[

1,	99,	99,	99,	1,	1,	1,	% 	LS day 7          1a 2p 3ap 4c 91!a  92!p 
99,	2,	99,	99,	99,	99,	99,	% 	LS day 14          1a 2p 3ap 4c 91!a  92!p 

1,	99,	2,	99,	2,	2,	99,	% 	LS day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	2,	99,	99,	99,	99,	% 	LS day 28          1a 2p 3ap 4c 91!a  92!p 

1,	1,	99,	99,	1,	99,	99,	% 	LS day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	2,	99,	99,	99,	99,	% 	LS day 42          1a 2p 3ap 4c 91!a  92!p 

1,	99,	2,	99,	2,	2,	99,	% 	LS day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	2,	99,	99,	99,	99,	% 	LS day 56          1a 2p 3ap 4c 91!a  92!p 

1,	99,	99,	99,	1,	1,	1,	% 	LS day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	2,	99,	99,	99,	99,	% 	LS day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc LS

%      constraint count(roster[LS,..],l,0);

      constraint REQUESTS[LS,1..70] = LS_requests; 
%AV
array[1..70] of var int: AV_requests = array1d(1..70,[

99,	1,	4,	4,	2,	99,	99,	% 	AV day 7          1a 2p 3ap 4c 91!a  92!p 
2,	99,	4,	4,	1,	2,	2,	% 	AV day 14          1a 2p 3ap 4c 91!a  92!p 

99,	99,	4,	4,	1,	99,	99,	% 	AV day 21          1a 2p 3ap 4c 91!a  92!p 
2,	99,	4,	4,	1,	99,	99,	% 	AV day 28          1a 2p 3ap 4c 91!a  92!p 

1,	99,	4,	4,	2,	99,	99,	% 	AV day 35          1a 2p 3ap 4c 91!a  92!p 
2,	99,	4,	4,	1,	99,	99,	% 	AV day 42          1a 2p 3ap 4c 91!a  92!p 

4,	1,	4,	2,	99,	99,	99,	% 	AV day 49          1a 2p 3ap 4c 91!a  92!p 
99,	1,	4,	2,	4,	1,	1,	% 	AV day 56          1a 2p 3ap 4c 91!a  92!p 

99,	4,	4,	1,	2,	99,	99,	% 	AV day 63          1a 2p 3ap 4c 91!a  92!p 
1,	99,	4,	4,	2,	99,	99,	% 	AV day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc AV

%      constraint count(roster[AV,..],l,0);

      constraint REQUESTS[AV,1..70] = AV_requests; 

constraint roster[AV,7]  = o;

%TB
array[1..70] of var int: TB_requests = array1d(1..70,[

1,	4,	2,	99,	99,	99,	99,	% 	TB day 7          1a 2p 3ap 4c 91!a  92!p 
1,	4,	2,	99,	99,	99,	99,	% 	TB day 14          1a 2p 3ap 4c 91!a  92!p 

1,	4,	2,	99,	99,	99,	99,	% 	TB day 21          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	99,	99,	99,	99,	% 	TB day 28          1a 2p 3ap 4c 91!a  92!p 

1,	4,	2,	99,	99,	1,	1,	% 	TB day 35          1a 2p 3ap 4c 91!a  92!p 
1,	4,	99,	99,	2,	99,	99,	% 	TB day 42          1a 2p 3ap 4c 91!a  92!p 

1,	4,	2,	99,	99,	1,	1,	% 	TB day 49          1a 2p 3ap 4c 91!a  92!p 
1,	4,	2,	99,	99,	99,	99,	% 	TB day 56          1a 2p 3ap 4c 91!a  92!p 

1,	4,	2,	99,	99,	99,	99,	% 	TB day 63          1a 2p 3ap 4c 91!a  92!p 
1,	4,	2,	99,	99,	99,	1,	% 	TB day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc TB

%      constraint count(roster[TB,..],l,3);

      constraint REQUESTS[TB,1..70] = TB_requests; 


%JD
array[1..70] of var int: JD_requests = array1d(1..70,[

99,	99,	1,	99,	99,	99,	99,	% 	JD day 7          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	JD day 14          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	JD day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	JD day 28          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	JD day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	JD day 42          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	JD day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	JD day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	1,	99,	99,	99,	99,	% 	JD day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	1,	99,	99,	99,	99,	% 	JD day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc JD

%      constraint count(roster[JD,..],l,0);

      constraint REQUESTS[JD,1..70] = JD_requests; 


%CK
array[1..70] of var int: CK_requests = array1d(1..70,[

2,	2,	2,	99,	99,	2,	2,	% 	CK day 7          1a 2p 3ap 4c 91!a  92!p 
41,	41,	41,	41,	41,	99,	99,	% 	CK day 14          1a 2p 3ap 4c 91!a  92!p 

99,	2,	2,	99,	99,	1,	1,	% 	CK day 21          1a 2p 3ap 4c 91!a  92!p 
99,	2,	2,	99,	99,	1,	1,	% 	CK day 28          1a 2p 3ap 4c 91!a  92!p 

2,	2,	99,	99,	99,	1,	1,	% 	CK day 35          1a 2p 3ap 4c 91!a  92!p 
2,	2,	2,	99,	99,	2,	2,	% 	CK day 42          1a 2p 3ap 4c 91!a  92!p 

2,	2,	99,	99,	99,	99,	99,	% 	CK day 49          1a 2p 3ap 4c 91!a  92!p 
2,	2,	99,	99,	99,	1,	1,	% 	CK day 56          1a 2p 3ap 4c 91!a  92!p 

1,	2,	2,	99,	99,	2,	2,	% 	CK day 63          1a 2p 3ap 4c 91!a  92!p 
1,	2,	2,	99,	99,	1,	1,	% 	CK day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc CK

%      constraint count(roster[CK,..],l,5);

      constraint REQUESTS[CK,1..70] = CK_requests; 

%NM
array[1..70] of var int: NM_requests = array1d(1..70,[

99,	99,	99,	99,	99,	99,	99,	% 	NM day 7          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	NM day 14          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	NM day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	1,	1,	2,	2,	% 	NM day 28          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	NM day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	NM day 42          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	NM day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	NM day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	NM day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	NM day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc NM

%      constraint count(roster[NM,..],l,0);

      constraint REQUESTS[NM,1..70] = NM_requests; 
%KM
array[1..70] of var int: KM_requests = array1d(1..70,[

2,	99,	99,	99,	99,	99,	99,	% 	KM day 7          1a 2p 3ap 4c 91!a  92!p 
1,	99,	99,	99,	99,	99,	99,	% 	KM day 14          1a 2p 3ap 4c 91!a  92!p 

1,	99,	99,	99,	99,	99,	2,	% 	KM day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	KM day 28          1a 2p 3ap 4c 91!a  92!p 

2,	99,	99,	99,	99,	99,	99,	% 	KM day 35          1a 2p 3ap 4c 91!a  92!p 
1,	99,	99,	99,	99,	99,	99,	% 	KM day 42          1a 2p 3ap 4c 91!a  92!p 

1,	99,	99,	99,	99,	99,	1,	% 	KM day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	KM day 56          1a 2p 3ap 4c 91!a  92!p 

2,	99,	99,	99,	99,	99,	99,	% 	KM day 63          1a 2p 3ap 4c 91!a  92!p 
2,	99,	99,	99,	99,	99,	99,	% 	KM day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc KM

%      constraint count(roster[KM,..],l,0);

      constraint REQUESTS[KM,1..70] = KM_requests; 


%DZ
array[1..70] of var int: DZ_requests = array1d(1..70,[

99,	99,	99,	99,	99,	99,	99,	% 	DZ day 7          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	DZ day 14          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	DZ day 21          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	DZ day 28          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	DZ day 35          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	DZ day 42          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	DZ day 49          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	DZ day 56          1a 2p 3ap 4c 91!a  92!p 

99,	99,	99,	99,	99,	99,	99,	% 	DZ day 63          1a 2p 3ap 4c 91!a  92!p 
99,	99,	99,	99,	99,	99,	99,	% 	DZ day 70          1a 2p 3ap 4c 91!a  92!p 
      ]); % end of array for doc DZ

%      constraint count(roster[DZ,..],l,0);

      constraint REQUESTS[DZ,1..70] = DZ_requests; 


