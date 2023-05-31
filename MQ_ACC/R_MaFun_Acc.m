function [] = R_MaFun_Acc( a, c, r_set, QC, s)
   r = r_set;
   p = randperm(size(a,1), QC);
   for j = 1:numel(r)
         fprintf('>>>>>>>>>>>> r = %d, SamNumb = %d\n', r(j), QC);
         [x, u] = Pre_CSR_Our(a, c, r(j));
         Que_CSR_Our_Acc( x, u, c, p, s)
    end

end