% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));
h = X * theta;
J = sum(  ( h - y ) .^2 ) / (2 * m) + (lambda/(2 * m)) * sum(theta(2:length(theta),1) .^ 2);
grad = (sum((h - y).*X)./m) + (lambda/m)*(theta)';
grad(1) -= (lambda/m)*(theta(1))';
grad = grad(:);
end
