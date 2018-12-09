% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function centroids = computeCentroids(X, idx, K)
[m n] = size(X);
centroids = zeros(K, n);
for i = 1:K %slow
    k = 0;
    accumulator = zeros(1,n);
    for j = 1:m
        if(idx(j) == i)
            accumulator += X(j, :);
            k++;
        endif
    endfor
    centroids(i,:) = accumulator / k;
endfor
%for i = 1:K
%    vecIndex = find(idx == i);
%    vecNextX1 = sum(X(vecIndex, 1),2);
%    %len = length(vecNextX1);
%    len = length(vecIndex);
%    vecNextX1 = sum(vecNextX1);
%    vecNextX2 = sum(sum(X(vecIndex, 2),2));
%    if(len == 0)
%        len = 1;
%    endif
%    vecNextX1 /= len;
%    vecNextX2 /= len;
%    centroids(i,1) = vecNextX1;
%    centroids(i,2) = vecNextX2;
%endfor
%limit = length(idx);
%for i=1:K
%    pool = zeros();
%    j = 0;
%    %for j :limit
%    while(j < limit)
%        j++;
%        if(idx(j) == i)
%            pool += sum(X(j))
%        endif
%    endwhile
%    centroids(K) = pool / j
%    pause
%endfor
end

