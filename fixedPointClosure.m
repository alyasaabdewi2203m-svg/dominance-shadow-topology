function closure = fixedPointClosure(seedRows, generatorRows, opFun)
%FIXEDPOINTCLOSURE Repeatedly combine every current set with every
%   generator via opFun, adding any new results, until nothing new
%   appears. Polynomial in the size of the resulting closure -- NOT an
%   exponential subset enumeration.
    current = seedRows;
    while true
        m = size(current, 1);
        k = size(generatorRows, 1);
        combined = false(m * k, size(current, 2));
        idx = 1;
        for i = 1:m
            for j = 1:k
                combined(idx, :) = opFun(current(i, :), generatorRows(j, :));
                idx = idx + 1;
            end
        end
        updated = unique([current; combined], 'rows');
        if isequal(updated, current)
            break
        end
        current = updated;
    end
    closure = current;
end
