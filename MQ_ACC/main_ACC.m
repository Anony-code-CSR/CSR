clear all;
clc;

fpath = 'D:\Scientific research\dataset\';
%   ds = 'Erdos981';               % ED           % nodes: 485,          edges:  2762 	         
  ds =  'ego-Facebook';          % FB           % nodes: 4,039,        edges:  88,234          
%  ds = 'p2p-Gnutella25';         % P2P          % nodes: 22,687,       edges:  54,705 
%============================================================================================================================== 

 fname = [fpath, ds, '.mat'];
 load(fname);
 a = Problem.A;
 c = 0.6;
%============================================================================================================================== 
 kmax = 500;
 [s] = CSR_IT_ACC(a, c, kmax);   % baseline
 r_set = [25 50 100 200];    
 QC = 300 ;                     
 R_MaFun_Acc(a, c, r_set, QC, s);


