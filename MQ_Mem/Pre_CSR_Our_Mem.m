function [max_mem, x, u] = Pre_CSR_Our_Mem(a, c, r)

    n = size(a,1); 
    d = sum(a,1)';                      %  d: in-degree vector 
    inv_d = spfun(@(x) 1./x, d);
    q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
    max_mem = 0;
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));
    clear d inv_d a ;   
    
    [v, si, u] = svds(q, r); 
    g = v'* u * si;  
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));   
    
    clear v q ; 
    h = speye(r);   

    for j = 1: 7
        h = h + c^(2^(j-1))*(g * h * g');
        g = g * g;
    end
    gamma = si * h * si;
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));
    clear r si g ide_r h 
    
    x = u * gamma;
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));    
    clear gamma 
    
    Premax_mem = max_mem;
    Premax_mem = Premax_mem/(1024^2);
    fprintf('>>Algorithm(Pre_CSR_Our_Mem ):               PreMaxMemory = : %f MB\n ', Premax_mem);  

 end
  








