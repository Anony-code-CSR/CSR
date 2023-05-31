function  [] = R_MainFun(a, c, r_set, QC , Block_S  )

p = randperm(size(a,1), QC);
r = r_set;

for i =1:numel(r)
        fprintf('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n   r =%d,  SamNumb = %d\n',r(i), QC); 
        % Algorithm1: CSR+
        [PreTime_Our, x, u] = Pre_CSR_Our(a, c, r(i));
        Que_CSR_Our(PreTime_Our, x, u, c, p);
        clear PreTime_Our x  u;
        
        % Algorithm2: CSR-RLS
        CSR_RLS(a, c, r(i), p, Block_S );     
        
        % Algorithm3: CSR-IT
         CSR_IT(a, c, r(i)) ;

        % Algorithm4: CSR-NI
%         [Pre_Time_NI, K_u,lambda, V_r] = Pre_CSR_NI(a, c, r(i));
%         Que_CSR_NI(Pre_Time_NI, K_u,lambda, V_r,c ,p);
%         clear Pre_Time_NI K_u lambda V_r;       
        fprintf('\n');
end

end


