percentages = .25:.25:1;
numVertices = 3:9;
iterations = 30;
pool = gcp('nocreate')
figure;
hold on;
%addAttachedFiles(pool, "ExecuteHamiltonianPerm.m")
for p = percentages
    times = [];
    for n = numVertices
        [p,n]
        t = TimeHamiltonianPerm(n, p, iterations, pool.NumWorkers);
        times = [times t];
    end
    plot(numVertices, times);
end
legend(strtrim(cellstr(num2str(percentages'))'));
xlabel("Number of Vertices");
ylabel(["Average Time over " iterations " trials"]);