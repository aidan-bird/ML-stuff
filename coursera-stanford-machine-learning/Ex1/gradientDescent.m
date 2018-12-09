% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    sumTheta1 = 0;
    sumTheta2 = 0;
    for i = 1:m
        sumTheta1 = sumTheta1 + ((theta(1) + theta(2)*X(i,2))-y(i))*X(i,1);
        sumTheta2 = sumTheta2 + ((theta(1) + theta(2)*X(i,2))-y(i))*X(i,2);
    endfor
        theta(1) = theta(1) - alpha*(1/m)*sumTheta1;
        theta(2) = theta(2) - alpha*(1/m)*sumTheta2;
    J_history(iter) = computeCost(X, y, theta);
end
end
