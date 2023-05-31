clear all
clc
% example 2: The detailed processing of each step of the CSR+ algorithm is shown as follows:
a = [0, 1, 0, 1, 0,  0; 
    0, 0, 0, 0, 0,  0; 
    0, 1, 0, 0, 1,  0; 
    1, 0, 1, 0, 0,  1; 
    0, 1, 0, 1, 0,  0; 
    0, 0, 0, 1, 1,  0];
ran = rank(a);
c = 0.6;
r = 3;       
p = [2 4];

n = size(a,1); 
d = sum(a,1)'; %  d: in-degree vector 
inv_d = spfun(@(x) 1./x, d);
q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
clear d inv_d a ;

[v, si, u] = svds(q, r);
g = v'* u * si; 
clear v; 
ide_r = eye(r);
h = ide_r;   
for i = 1:10  
  h = h + c^(2^(i-1)) *(g * h * (g')); 
  g = g * g;
end
gamma = si * h * si;
clear  si g ide_r h; 
x = u * gamma;
clear gamma 
e_p = sparse(p,1:2,1,n,2);   
S = ( e_p + c * x * u(p,:)'); 

