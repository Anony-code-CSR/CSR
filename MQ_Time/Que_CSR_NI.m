function [ ] = Que_CSR_NI(Pre_Time_NI, K_u,lambda, V_r, c, p)

    QuePro = tic;
    
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
        S_p_NI(:,h) = (1-c)*(ide(:,h) + c* V_l*V_r);  
    end
    
    MQ_QueTime_NI = toc( QuePro);

    clear K_u lambda;
    TotalTime_NI = Pre_Time_NI + MQ_QueTime_NI;
    fprintf('>>>>>>>>>Algorithm (CSR_NI):          TotalTime = %f s; ProTime = %f s;  MQ_QueTime = %f s; \n', TotalTime_NI, Pre_Time_NI, MQ_QueTime_NI);


end