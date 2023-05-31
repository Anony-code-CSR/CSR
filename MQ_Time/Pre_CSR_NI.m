function [Pre_Time_NI, K_u,lambda, V_r] = Pre_CSR_NI(a, c, r)
    Pre_computation = tic;  
    n = size(a,1); 
    d = sum(a,1)';                       %  d: in-degree vector 
    inv_d = spfun(@(x) 1./x, d);
    q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
    clear d inv_d a;   
    ide = speye(n);

    [v, si, u] = svds(q, r);             % w : svd-decomposition
    clear q r ; 

    K_u = kron(u, u);
    inv_si= inv(si);
    K_v = kron(v', v');
    K_vu =  K_v * K_u;
    lambda = inv(kron(inv_si, inv_si)-c * K_vu);     
    V_r = K_v * ide(:); 
    clear u q si v K_si  K_vu;
    Pre_Time_NI = toc(Pre_computation);

end