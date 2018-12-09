% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [C, sigma] = dataset3Params(X, y, Xval, yval)
C = 1;
sigma = 0.3;
test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
err = zeros(length(test),length(test));
len = length(test);
for i = 1:len
    for ii = 1:len
        model= svmTrain(X, y, test(i), @(x1, x2) gaussianKernel(x1, x2, test(ii)));
        predictions = svmPredict(model, Xval);
        err(i,ii) = mean(double(predictions ~= yval));
    end
end
[~, C] = min(min(err,[],2));
[~, sigma] = min(min(err,[],1));
sigma = test(sigma);
C = test(C);
end
