function  [] = Q_MainFun(a, c, r_set, QC, Block_S )

t = size(QC,2);
r = r_set;
[PreTime_Our, x, u] = Pre_CSR_Our(a, c, r);
[Pre_Time_NI, K_u,lambda, V_r] = Pre_CSR_NI(a, c, r);
for i =1:t    
        fprintf('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>r =%d,  SamNumb = %d\n',r, QC(i));  
        p = randperm(size(a,1), QC(i));
        Que_CSR_Our(PreTime_Our, x, u, c, p);  
        Que_CSR_NI(Pre_Time_NI, K_u,lambda, V_r, c, p);
        CSR_RLS(a, c, r, p, Block_S(i));      %  online piece by piece    
        fprintf('>>>>\n');

end

end


