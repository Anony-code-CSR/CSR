function [] = Que_CSR_Our_Acc( x, u, c, p, s)   
    n = size(u,1);
    Co = size(p,2);
    e_p = sparse(p, 1:Co, 1, n, Co);
    S_p_Our = (1-c)* ( e_p + c * x * (u(p,:))' );
    ACC = sum(sum(abs( S_p_Our -s(:,p) )))/(n * size(p,2));  
    fprintf('>>(Que_CSR_Our_Acc):                 ACC = : %3.7f\n',    ACC ); 

end