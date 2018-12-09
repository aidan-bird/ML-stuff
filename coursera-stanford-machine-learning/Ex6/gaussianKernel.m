% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function sim = gaussianKernel(x1, x2, sigma)
x1 = x1(:); x2 = x2(:);
sim = 0;
twoSigmaSquared = 2 * (sigma ^ 2);
sim = exp ( -(sum( (x1 - x2) .^ 2  )) / (twoSigmaSquared) );
end
