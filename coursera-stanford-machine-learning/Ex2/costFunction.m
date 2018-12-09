% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [J, grad] = costFunction(theta, X, y)
m = length(y);
J = 0;
grad = zeros(size(theta));
sig = sigmoid(X * theta);
J = (sum(sum((-y.*log(sig)) - ((1-y) .* log(1 - sig)))))/m;
grad = (sum((sig.-y).*X))./m;
end
