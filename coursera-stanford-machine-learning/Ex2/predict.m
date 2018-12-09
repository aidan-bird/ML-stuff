% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function p = predict(theta, X)
m = size(X, 1); % Number of training examples
p = zeros(m, 1);
sig = sigmoid(X * theta);
for i = 1:m
    if(sig(i) >= 0.5)
        p(i) = 1;
    else
        p(i) = 0;
        endif
endfor
end
