% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function J = computeCost(X, y, theta)
m = length(y); % number of training examples
J = 0;
for i = 1:m
    J = J + ((theta(1) + theta(2)*X(i,2))-y(i))^2;
endfor
J = J * (1/(2*m));
end
