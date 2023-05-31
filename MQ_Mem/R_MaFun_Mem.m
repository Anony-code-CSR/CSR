function  [] = R_MaFun_Mem(a, c, r_set, QC, Block_S)

    r = r_set;
    p = randperm(size(a,1), QC);
    for j = 1:numel(r)
         fprintf('>>>>>>>>>>>> r = %d, SamNumb = %d\n', r(j), QC);               
        %%% Algorithm1: CSR+
        [pre_max_mem_Our, x, u] = Pre_CSR_Our_Mem(a, c, r(j)); 
        Que_CSR_Our_Mem(pre_max_mem_Our, x, u, c, p);
        clear pre_max_mem_Our x u;
        
        %%% Algorithm2: CSR-RLS
        CSR_RLS_Mem(a,c, r(j), p, Block_S);             %   online  block by block 
        
        
        %%% Algorithm3: CSR-IT 
        CSR_IT_Mem(a, c, r(j) );  

        %%% Algorithm4: CSR-NI       
        [pre_max_mem_NI, K_u,lambda, V_r] = Pre_CSR_NI_Mem(a, c, r(j));
        Que_CSR_NI_Mem(pre_max_mem_NI, K_u,lambda, V_r, c, p);
        clear pre_max_mem_NI K_u lambda  V_r;
        fprintf('>>>>\n');

    end
             

end

