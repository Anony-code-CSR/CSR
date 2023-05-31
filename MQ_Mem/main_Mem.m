clear all;
clc;
fpath =  'D:\Scientific research\dataset\';
%   ds = 'Erdos981';               % ED           % nodes: 485,          edges:  2762 	         
%  ds =  'ego-Facebook';          % FB           % nodes: 4,039,        edges:  88,234          
%  ds = 'p2p-Gnutella25';         % P2P          % nodes: 22,687,       edges:  54,705    
   ds = 'web-NotreDame';          % WN           % nodes: 325,729,      edges:  1,497,134
%  ds = 'com-Youtube';            % YT           % nodes: 1,134,890,    edges:  5,975,248
%  ds = 'wiki-Talk';              % WT           % nodes: 2,394,385,    edges:  5,021,410  
%============================================================================================================================== 
fname = [fpath, ds, '.mat'];
 load(fname);
 a = Problem.A;
 c = 0.6;
%============================================================================================================================== 
% R_MainFun_Mem : Fixed QC studies the effect of changing r_set on memory
  r_set = [25 50 100 200];          % r_set: # of iterations(CSR_IT,CSR_RLS) and low-rank(CSR_NI,CSR_Our)   
% r_set =[5,10,15,20];             
% QC = 100;                         % QC: # of query nodes
  QC = 300;                        
% Block_S = QC/100;                 % ED
  Block_S = QC/5;                   % (FB,P2P,WN,YT,WT)
  R_MaFun_Mem(a, c, r_set, QC, Block_S);           

%============================================================================================================================== 
%  Q_MaFun_Mem : Fixed r_set studies the effect of changing QC on memory
% r_set = 5;
% r_set = 50;
%  QC = [100 300 500 700];
% Block_S = QC/100;               
% Block_S = QC/5; 
% Q_MaFun_Mem(a, c, r_set, QC,  Block_S ) 


