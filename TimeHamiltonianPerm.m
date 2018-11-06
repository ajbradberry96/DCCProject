function t = TimeHamiltonianPerm(n, p, iterations, numWorkers)
    times = [];
    for i = 1:iterations
        G = rand(n,n) <= p;
        tic
        ExecuteHamiltonianPerm(n, G, numWorkers);
        time = toc;
        times = [times time];
    end
    t = mean(times);
end