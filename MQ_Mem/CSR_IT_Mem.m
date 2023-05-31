function [ ] = CSR_IT_Mem(a, c, r)   % s = cw'sw + (1-c)I
%%%%%%  computate the peak amount of memory used by the algorithm to run.

    n = size(a,1); 
    d = sum(a,1)';                       %  d: in-degree vector 
    inv_d = spfun(@(x) 1./x, d);
    w = a * spdiags(inv_d, 0, n, n)  ;   % q:  col_norm(a)
    max_mem = 0;
    mem = whos;
    max_mem = max(max_mem, sum([mem.bytes]));
    clear  inv_d a d;


    ide = speye(n, n);
    s_it = ide;
    for i = 1: r
        s_it = c * w' * s_it * w + (1-c) * ide;
        men = whos;
        max_mem = max(max_mem, sum([men.bytes]));   
    end
    max_mem = max_mem/(1024^2);
    fprintf('>>Algorithm(CSR_IT_Mem):                    MaxMemory = : %f MB\n ',  max_mem);


end

