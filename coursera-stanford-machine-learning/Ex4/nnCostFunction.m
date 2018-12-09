% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
m = size(X, 1);
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
% convert y
Y = [zeros(size(y),num_labels)];
len = size(Y)(1);
for i = 1:len
    Y(i,y(i)) = 1;
end
% Feedforward
A1 = [ones(size(X),1),X];
Z2 = A1 * Theta1';
A2 = sigmoid(Z2);
Z3 = [ones(size(A2),1),A2] * Theta2';
A3 = sigmoid(Z3);
% cost
J = sum(sum((-Y .* log(A3) - (1 - Y) .* log(1 - A3))))/m;
% regularization
J += (lambda / (2 * m)) * (sum(sum([Theta1(:,2:end)].^2)) + sum(sum([Theta2(:,2:end)].^2)));
map = zeros(m,num_labels);
for i = 1:m
    map(i,y(i)) = 1;
end
Theta1(:,1) = 0;
Theta2(:,1) = 0;
d3 = A3 - map;
d2 = (d3 * Theta2(:,2:end)) .* sigmoidGradient(Z2);
D1 = d2' * A1;
D2 = d3' * [ones(size(A2),1),A2];
Theta2_grad = D2 * (1 / m) + (lambda / m) * Theta2;
Theta1_grad = D1 * (1 / m) + (lambda / m) * Theta1;
% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];
end
