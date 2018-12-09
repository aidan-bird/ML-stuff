% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));
xThetaT = (X*Theta') .* R - Y;
lambda2 = lambda/2;
J = sum(sum((xThetaT).^2))/2 + lambda2*(sum(sum(Theta .^ 2))) + lambda2*(sum(sum(X .^ 2)));
X_grad = xThetaT * Theta;
Theta_grad = xThetaT' * X;
X_grad += lambda*X;
Theta_grad += lambda*Theta;
%X_grad(2:end,:) += lambda*X(2:end,:);
%Theta_grad(2:end,:) += lambda*Theta(2:end,:);
grad = [X_grad(:); Theta_grad(:)];
end
