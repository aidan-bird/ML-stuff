% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)
m = size(X, 1);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);
for i = 1:m
    theta = trainLinearReg( X(1:i,:), y(1:i,:), lambda);
    error_train(i) = linearRegCostFunction(X(1:i,:), y(1:i), theta, 0);
    error_val(i) = linearRegCostFunction(Xval,yval,theta, 0);
end
end
