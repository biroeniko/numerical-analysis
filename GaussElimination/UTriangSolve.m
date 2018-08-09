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
% A = magic(3)
% [U,c] = GaussElim(A,[1;2;3])
% x = UTriangSolve(U, c)
% check:
% A\[1;2;3]
% ================================
% A = magic(3)
% [U,c] = GaussElim(A,[1; 2; 3])
% x = UTriangSolve(U, c)
% ================================

function x = UTriangSolve(U,b)
    n = size(U, 2);
    x = zeros(n, 1);
    
    x(n) = b(n)/U(n,n);
    for i = (n-1) : -1 : 1
        summa = 0;
        for j = i+1 : n
            summa = summa + U(i,j)*x(j);
        end
        x(i) = 1/(U(i,i)) * (b(i) - summa);
    end
end