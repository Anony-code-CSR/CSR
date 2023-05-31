function [] = CSR_RLS(a, c, r, p, Block )

    % % % % SS_CSR_PR_MV1 : Use the MV algorithm to process query nodes online block matrix by block matrix
    %%%%%%*********
    
    TimeTic = tic;
    n = size(a,1); 
    d = sum(a,1)';                       %  d: in-degree vector 
    inv_d = spfun(@(x) 1./x, d);
    q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
    clear d inv_d a ; 
    
    
    Co = size(p,2);
    S_j = zeros(n, Co);
    Incol= Co/Block;
    incol = Incol;
    sta = 1; 
 
    for t=1:Block
        P_Cell = cell(1,r+1);
        Q_PM  = sparse(p(sta: Incol), 1:incol, 1, n, incol);   % Q_PM:  The matrix of the columns in which the query node is located
        P_Cell{1,1} = Q_PM;
        for j = 1 : r  
            Q_PM = q * Q_PM;
            P_Cell{1,j+1} = Q_PM;
        end
        qt = q';
        S_j1(:,sta: Incol) = P_Cell{1,r+1};
        for i = r : -1 : 1
            S_j1(:,sta: Incol) = P_Cell{1,i} +  c * qt * S_j1(:,sta: Incol); 
        end
        S_j2(:,sta: Incol) =  P_Cell{1,r};
        for i = r-1: -1 :1
            S_j2(:,sta: Incol)= P_Cell{1,i} +  c * qt * S_j2(:,sta:Incol);   
        end
        S_j(:,sta:Incol) =  S_j1(:,sta: Incol) - c *  S_j2(:,sta: Incol);
        sta = Incol+1;
        Incol = Incol + incol;
    
    end
    TotalTime = toc(TimeTic);
    fprintf('>>>>>>>>Algorithm (CSR_RLS):              TotalTime = %f s; \n',  TotalTime);
 end   