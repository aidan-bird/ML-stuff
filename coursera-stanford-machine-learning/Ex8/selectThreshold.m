% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function [bestEpsilon bestF1] = selectThreshold(yval, pval)
bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
stepsize = (max(pval) - min(pval)) / 1000;
predict = zeros(length(yval),1);
limit = length(predict);
for epsilon = min(pval):stepsize:max(pval)
    fp = 0;
    tp = 0;
    fn = 0;
    for i = 1:length(pval)
        if (pval(i) < epsilon)
            %predict(i) = 1;
            if (yval(i) == 1)
                tp++;
            else
                fp++;
            endif
        else
            %predict(i) = 0;
            if (yval(i) == 1)
                fn++;
            endif
        endif
    endfor
    prec = tp / (tp + fp);
    rec = tp / (tp + fn);
    F1 = (2*prec*rec)/(prec + rec);
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end
end
