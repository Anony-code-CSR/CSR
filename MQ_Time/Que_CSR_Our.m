function [ ] = Que_CSR_Our(Total_ProTime, x, u, c, p)
   
    Que_Time = tic;
    n = size(u,1);
    Co = size(p,2);

    e_p = sparse(p, 1:Co, 1, n, Co);
    S_p_Our = (1-c)* ( e_p + c * x * (u(p,:))' );
    MQ_QueTime = toc(Que_Time);                     % % MQ_QueTime: The time of a mult-query nodes
    
    TotalTime = Total_ProTime + MQ_QueTime; 
    fprintf('>>>>>>>>Algorithm (CSR_Our):              TotalTime = %f s; ProTime = %f s;  MQ_QueTime = %f s;  \n', TotalTime, Total_ProTime, MQ_QueTime);

end