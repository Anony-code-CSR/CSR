function  [] = Q_MaFun_Mem(a, c, r_set, QC, Block_S)

    r = r_set;
    for j = 1:numel(QC)
         fprintf('>>>>>>>>>>>> r = %d, SamNumb = %d\n', r, QC(j));         
         p = randperm(size(a,1), QC(j));
         
         %%% Algorithm1: CSR+ 
         [pre_max_mem_Our, x, u] = Pre_CSR_Our_Mem(a, c, r); 
         Que_CSR_Our_Mem(pre_max_mem_Our, x, u, c, p); 
         clear pre_max_mem_Our x u;
         
         %%% Algorithm2: CSR-RLS           
          CSR_RLS_Mem(a, c, r, p, Block_S(j));
         
         %%% Algorithm3: CSR-IT 
          CSR_IT_Mem(a, c, r); 
      
         %%% Algorithm4: CSR-NI        
          [pre_max_mem_NI, K_u,lambda, V_r] = Pre_CSR_NI_Mem(a, c, r);       
          Que_CSR_NI_Mem(pre_max_mem_NI, K_u,lambda, V_r, c, p);
          clear pre_max_mem_NI K_u lambda  V_r;
         fprintf('>>>>\n\n\n');

    end
             

end

