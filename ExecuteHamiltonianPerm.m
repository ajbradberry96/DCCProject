function ExecuteHamiltonianPerm( n, G, numWorkers )
%HAMILTONIANPERM Summary of this function goes here
%   Detailed explanation goes here
    permutations = perms(1:n);
    spmd
        myDone = false;
        myperms = permutations(labindex:numWorkers:end,:);
        for i = 1:length(myperms)
            done = gop(@or, myDone);
            if done == true
                break;
            end   
            p = myperms(i,:);
            cycle = true;
            for j = 1:n-1
                if G(p(j),p(j+1)) == 0
                    cycle = false;
                    break
                end
            end
            if cycle == true
                myDone = true;
                break;
            end
                   
        end
        if ~done
                done = gop(@or, myDone);
        end
end