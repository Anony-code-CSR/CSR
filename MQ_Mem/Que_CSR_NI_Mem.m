function [ ] = Que_CSR_NI_Mem(max_mem, K_u,lambda, V_r, c, p)
    
    Co = size(p,2);
    n = sqrt(size(K_u,1));
    S_p_NI = zeros(n,Co);
    ide = sparse(p,1:Co,1,n,Co);
    r =  size(lambda,1);
    for h = 1:Co
        V_l = zeros(n,r);
        for i = 1:n
          V_l(i,:) = K_u((i-1) * n + p(h),:) * lambda;      
        end
        S_p_NI(:,h) = (1-c)*(ide(:,h) + c* V_l * V_r); 
        mem = whos;
        max_mem = max(max_mem, sum([mem.bytes])); 
        clear V_l;
    end
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));
    max_mem = max_mem/(1024^2);
    fprintf('>>>>>>>>Algorithm (Que_CSR_NI_Mem):         MaxMemory = : %f MB\n ',  max_mem);
    
    
    
    
    
    

end