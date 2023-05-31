function [s_it ] = CSR_IT_ACC(a, c, kmax)  
n = size(a,1); 
d = sum(a,1)';                       
inv_d = spfun(@(x) 1./x, d);
w = a * spdiags(inv_d, 0, n, n); 
clear  inv_d a d;
ide = speye(n, n);
s_it = ide;

for i = 1: kmax
    s_it = c * w' * s_it * w + (1-c) * ide;  
end
 s_it = full(s_it);  
end

