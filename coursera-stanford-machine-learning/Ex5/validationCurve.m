% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [lambda_vec, error_train, error_val] = ...
    validationCurve(X, y, Xval, yval)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);
for i = 1:length(lambda_vec)
    lambda = lambda_vec(i);
    %theta = trainLinearReg( X(1:i,:), y(1:i,:), lambda);
    theta = trainLinearReg( X, y, lambda);
    error_train(i) = linearRegCostFunction(X, y, theta, 0);
    error_val(i) = linearRegCostFunction(Xval,yval,theta, 0);
end
end
