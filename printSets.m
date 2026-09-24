function printSets(label, rows, vertices)
%PRINTSETS Display each indicator row as a list of vertex labels.
    fprintf('%s (%d sets):\n', label, size(rows, 1));
    for i = 1:size(rows, 1)
        fprintf('  {%s}\n', num2str(vertices(rows(i, :))));
    end
end
