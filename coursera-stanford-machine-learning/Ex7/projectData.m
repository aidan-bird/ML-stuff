% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function Z = projectData(X, U, K)
Z = zeros(size(X, 1), K);
Z = X(1:end,:) * (U(:,1:K));
%x = X(i, :)';
%for i = 1:length(X)
%    for k = 1:K
%        Z = (X(i,:))' * U(:, 1:length(K));
%    endfor
%endfor
end
