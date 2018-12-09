% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function idx = findClosestCentroids(X, centroids)
K = size(centroids, 1);
idx = zeros(size(X,1), 1);
m = length(X);
colCentroids = size(centroids,2);
colDisplacement = colCentroids - 1;
test = zeros(m,K * colCentroids);
testSum = zeros(m,K);
for i = 1:K
    col = 1 + ((i - 1) * colCentroids);
    test(:,col : col + colDisplacement) = (X - centroids(i,:)).^2;
    tesSum(:,i) = sum(test(:,col : col + colDisplacement),2);
endfor
[~,idx] = min(tesSum,[],2);
%limit = length(X);
%buf = zeros(1,size(centroids,2))
%for i = 1:limit
%    for j = 1:K
%        buf(j) = sum((X(i) - centroids(j))^2);
%    endfor
%    [~,idx(i)] = min(buf);
%endfor
%test = zeros(length(X),length(centroids));
%for i = 1:K
%    %test(:,i) = sum((X - centroids(i,:)).^2,2);
%    %test(:,i) = (X(:,1) - centroids(i,1)).^2 + (X(:,2) - centroids(i,2)).^2;
%    %test(:,i) = sum((X - centroids(i)).^2,2)
%    %test(:,i) = sum((bsxfun(@minus, X, centroids(i))).^2, 2)
%    test(:,i) = sum((bsxfun(@minus, X, centroids(i,:))).^2, 2);
%endfor
%[~,idx] = min(test,[],2);
%colCentroids = size(centroids,2);
%test = zeros(length(X),colCentroids * length(centroids));
%testSum = zeros(length(X),length(centroids));
%indexMap = zeros(1,colCentroids * length(centroids));
%colDisplacement = colCentroids - 1;
%for i = 1:K
%    col = 1 + ((i - 1) * colCentroids);
%    %indexMap(col : col + colDisplacement) = ones(1,colDisplacement) .* i;
%    %test(:,col : col + colDisplacement) = sqrt((X(:,(1)) - centroids(i,(1))).^2 + (X(:,2) - centroids(i,2)).^2).^ 2;
%    testSum(:,i) = sqrt((X(:,(1)) - centroids(i,(1))).^2 + (X(:,2) - centroids(i,2)).^2).^ 2
%    %testSum(:,i) = sum(test(:,col : col + colDisplacement),2)
%    pause
%endfor
%[~,idx] = max(testSum,[],2)
%indexes(1:5)
%idx = indexMap(indexes);
end

