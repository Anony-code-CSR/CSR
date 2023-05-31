function [x, u] = Pre_CSR_Our(a, c, r)

    n = size(a,1); 
    d = sum(a,1)'; %  d: in-degree vector 
    inv_d = spfun(@(x) 1./x, d);
    clear d ;
    q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
    clear inv_d a n;    
    [v, si, u] = svds(q, r); 
    g = v'* u * si;    
    clear v q ; 
    h = speye(r);   

    for j = 1: 7
        h = h + c^(2^(j-1))*(g * h * g');
        g = g * g;
    end
    gamma = si * h * si;
 
    clear r si g ide_r h     
    x = u * gamma;
end
  








