function [] = Que_CSR_Our_Mem(max_mem, x, u, c, p)
   
    n = size(u,1);
    Co = size(p,2);
    e_p = sparse(p, 1:Co, 1, n, Co);
    S_p_Our = (1-c)* ( e_p + c * x * (u(p,:))' );
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));
    max_mem = max_mem/(1024^2);   
    fprintf('>>Algorithm (Que_CSR_Our_Mem):              MaxMemory = : %f MB\n  ', max_mem);  

end