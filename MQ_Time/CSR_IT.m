function [ ] = CSR_IT(a, c, r)   % s = cw'sw + (1-c)I
%%%%%%  computate the peak amount of memory used by the algorithm to run.

    time_Iter = tic;
    n = size(a,1); 
    d = sum(a,1)';                       %  d: in-degree vector 
    inv_d = spfun(@(x) 1./x, d);
    q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
    clear  inv_d a d;

    ide = speye(n, n);
    s = ide;
    clear n

    for i = 1: r
        s = c * q' * s * q + (1-c) * ide;    
    end

    Temp_Iter = toc(time_Iter);
    fprintf('>>>>>>>>>>Algorithm (CSR_IT) (baseline)   Time: %f s\n ',Temp_Iter); 

end

