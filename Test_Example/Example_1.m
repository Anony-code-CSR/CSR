clear all
clc
% Example1 : Duplicate Computations in CoSimRank Search [S]∗,Q with Multi-Source Queries Q = {𝑏,𝑑} on Graph G
a = [0, 1, 0, 1, 0,  0; 
     0, 0, 0, 0, 0,  0; 
     0, 1, 0, 0, 1,  0; 
     1, 0, 1, 0, 0,  1; 
     0, 1, 0, 1, 0,  0; 
     0, 0, 0, 1, 1,  0];    
ran = rank(a);
c = 0.6;
r = 4;                        
p = [2 4];
n = size(a,1); 
d = sum(a,1)'; %  d: in-degree vector 
inv_d = spfun(@(x) 1./x, d);
q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
clear d inv_d a ; 

Co = size(p,2);
Block = 1;
S_j = zeros(n, Co);
Incol= Co/Block;
incol = Incol;
sta = 1; 

for t=1:Block
        P_Cell = cell(1,r+1);
        Q_PM  = sparse(p(sta: Incol), 1:incol, 1, n, incol);  
        P_Cell{1,1} = Q_PM;

        for j = 1 : r  
            Q_PM = q * Q_PM;
            P_Cell{1,j+1} = Q_PM;
        end
        qt = q';
        
        S_j1(:,sta: Incol) =  P_Cell{1,r+1};
        for i = r: -1 :1
            S_j1(:,sta: Incol)= P_Cell{1,i} +  c * qt * S_j1(:,sta:Incol);   
        end
        sta = Incol+1;
       Incol = Incol + incol;
end  

    