%{
MIT License

Copyright (c) 2016 Biro Eniko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

%}

% ================================
% INPUT (A,b) A - coefficient matrix, b - vector of free members
% ================================
% OUTPUT [U,c]
% ================================
% TESZT 
% ================================
% A = magic(3)
% [U,c] = GaussElim(A,[1; 2; 3])
% ================================

function [U,c] = GaussElim(A,b)
    n = size(A, 2);
    
    % changing of rows
    % we search for the maximal value in absolute value in each column
    for j = 1 : n
        [m, io] = max(abs(A(j:n, j)));
        io = io + (j-1);                    % actualize the row index
       
        % if there is no possible row change (the max is 0), then we return with error
        if (m == 0)
            error('The matrix of the system is singular')
        end
        
        % swap rows
        A([j io], :) = A([io j], :);
        b([j io], 1) = b([io j], 1);
        
        % ELIMINATION
        % we substract the first equation*(Ai1/11) from the i'th equation i = 2,...
        % we substract the second equation*(Ai2/22) from the i'th equation i = 3,...
        for k = j+1 : n
            multipliedRow = A(j,j:n) * (A(k,j)/A(j,j));
            multipliedRowB = b(j) * (A(k,j)/A(j,j));
            A(k,j:n) = A(k,j:n) - multipliedRow;
            b(k) = b(k) - multipliedRowB;
        end
    end
    
    U = A;
    c = b;
end