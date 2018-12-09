% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [U, S] = pca(X)
[m, n] = size(X);
U = zeros(n);
S = zeros(n);
sigma = (X')/m * X;
[U, S, ~] = svd(sigma);
end
