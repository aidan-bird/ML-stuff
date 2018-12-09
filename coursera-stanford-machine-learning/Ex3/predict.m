% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function p = predict(Theta1, Theta2, X)
m = size(X, 1);
num_labels = size(Theta2, 1);
p = zeros(size(X, 1), 1);
%    A2 = sigmoid(X1 * Theta1');
%    A2 = [ones((size(A2(:,1),1)),1),A2];
%    H = sigmoid(sigmoid(A2 * Theta2'))
%    [~,p] = max(H, [], 2);
%X = [ones((size(X(:,1),1)),1), X];
%A2 = X * Theta1;
%A3 = sigmoid(A2);
%A3 = Theta2' * A3;
%OUT = sigmoid(A3);
%[a,p] = max(OUT, [], 2);
A2 = sigmoid([ones((size(X(:,1),1)),1),X] * Theta1');
[~,p] = max((sigmoid(sigmoid(([ones((size(A2(:,1),1)),1),A2]) * Theta2'))), [], 2);
end
