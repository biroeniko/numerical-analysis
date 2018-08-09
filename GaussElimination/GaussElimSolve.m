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
% TESTS 
% ================================
% B = [3 3; 5 5]
% GaussElimSolve(B, [1; 2]) 
% -> incompatible
% ================================
% A = magic(3)
% GaussElimSolve(A,[1; 2; 3])
% check:
% A\[1; 2; 3]
% ================================
% GaussElimSolve(magic(3),[1; 2; 3])
% ================================
% A = [1 2 3; 4 3 2; 1 2 3]
% b = [2; 3; 2]
% GaussElimSolve(A,b)
% -> The matrix of the system is singular
% ================================
% GaussElimSolve(magic(7),[1;2;3;5;7;8;8])
% check:
% magic(7)\[1;2;3;5;7;8;8]
% ================================

function GaussElimSolve(A,b)
    p = rank(A);
    n = size(A, 2);
    [U,c] = GaussElim(A,b);
    
    % check if there is a free member between p and n which is not 0
    for i = p+1 : n
        if c(i) ~= 0
            error('The system is not compatible');
        end
    end
    
    allIsZero = false;
    if p ~= n
        for i = p+1 : n
            if c(i) ~= 0
                error('The system is not compatible');
            end
        end

        allIsZero = true;
        for i = p+1 : n
            if c(i) ~= 0
                allIsZero = false;
            end
        end
    end
    
    if allIsZero == true
        disp('The system is compatible, undetermined');
    else
        disp('The solution of the system is:')
        x = UTriangSolve(U, c)
    end
    
end