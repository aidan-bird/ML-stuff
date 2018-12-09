% Copyright 2018, Aidan Bird.
% This work is licensed under the terms of the MIT license.
% For a copy, see <https://opensource.org/licenses/MIT>.*
% Machine Learning by Stanford University <https://www.coursera.org/learn/machine-learning>.*
% Coursera Honor Code <https://learner.coursera.help/hc/en-us/articles/209818863-Coursera-Honor-Code>.*
%
function word_indices = processEmail(email_contents)
vocabList = getVocabList();
word_indices = [];
email_contents = lower(email_contents);
email_contents = regexprep(email_contents, '<[^<>]+>', ' ');
email_contents = regexprep(email_contents, '[0-9]+', 'number');
email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');
email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');
email_contents = regexprep(email_contents, '[$]+', 'dollar');
fprintf('\n==== Processed Email ====\n\n');
l = 0;
ii = 1;
while ~isempty(email_contents)
    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
    str = regexprep(str, '[^a-zA-Z0-9]', '');
    try str = porterStemmer(strtrim(str)); 
    catch str = ''; continue;
    end;
    if length(str) < 1
       continue;
    end
    cmpvec = strcmp(str, vocabList);
    findValue = find(cmpvec);
    if(findValue > 0)
        word_indices(ii) = findValue;
        ii++;
    end
    %word_indices(i) =
    %
    %for ii = 1:len
    %    if(strcmp(str, vocabList(ii)) == 1)
    %        word_indices(i) = ii;
    %        break
    %    end
    %end
    %i++;
    if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s ', str);
    l = l + length(str) + 1;
end
end
