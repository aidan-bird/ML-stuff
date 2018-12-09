% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function x = emailFeatures(word_indices)
n = 1899;
x = zeros(n, 1);
len = length(word_indices);
for i = 1:len
    x(word_indices(i)) = 1;
end
end
