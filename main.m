delete(gcp('nocreate'));

numWorkers = 1:4;
percentages = [.25 .5 .75];
numVertices = 3:7;
iterations = 30;

A = [];
for w = numWorkers
    parpool(w);
    
    pool = gcp('nocreate');
    
    pI = 0;
    %addAttachedFiles(pool, "ExecuteHamiltonianPerm.m")
    for p = percentages
        pI = pI + 1;
        times = [];
        for v = numVertices

            [p,v]
            t = TimeHamiltonianPerm(v, p, iterations, pool.NumWorkers);
            times = [times t];
        end
        
        A(pI, w, :) = times;
    end
    delete(pool);
end

save('data.mat', 'A');