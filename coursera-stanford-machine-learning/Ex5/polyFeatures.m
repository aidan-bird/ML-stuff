% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [X_poly] = polyFeatures(X, p)
X_poly = zeros(numel(X), p);
for i = 1:size(X)(1)
    for ii = 1:p
        X_poly(i,ii) = X(i) ^ ii;
    end
end
end
