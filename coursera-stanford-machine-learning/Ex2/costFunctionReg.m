% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [J, grad] = costFunctionReg(theta, X, y, lambda)
m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));
sig = sigmoid(X * theta);
J = (sum(sum((-y.*log(sig)) - ((1-y) .* log(1 - sig)))))/m + (lambda/(2*m))*sum(theta(2:length(theta),1).^2);
grad = (sum((sig - y).*X)./m) + (lambda/m)*(theta)';
grad(1) = grad(1) - (lambda/m)*(theta(1))';
%grad = sum(sum((sig .- y).*X))/m .+ (lambda/m)*(theta(2:length(theta)));
%grad = grad(1,1:length(grad));
% + (lambda/m)*(theta(2:length(theta)));
end
