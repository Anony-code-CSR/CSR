function [max_mem, K_u,lambda, V_r] = Pre_CSR_NI_Mem(a, c, r)

    n = size(a,1); 
    d = sum(a,1)';                       %d: in-degree vector 
    inv_d = spfun(@(x) 1./x, d);
    q = a * spdiags(inv_d, 0, n, n)  ;   %q: col_norm(a)
    max_mem = 0;
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));
    clear d inv_d a ; 
    ide = speye(n);

    [v, si, u] = svds(q, r);     %q : r-svd-decomposition
    clear q r ; 

    K_u = kron(u, u);
    inv_si= inv(si);
    K_v = kron(v', v');
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));    
    clear q u v si
    K_vu =  K_v * K_u;
    lambda = inv(kron(inv_si, inv_si)-c * K_vu);     
    V_r = K_v * ide(:); 
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));
    clear  K_si  K_vu;

end