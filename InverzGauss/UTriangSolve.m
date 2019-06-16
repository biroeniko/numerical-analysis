% Biro Eniko
% beim1499
% 531
% lab2

% PELDA
% A = magic(3)
% [U,c] = GaussElim(A,[1; 2; 3])
% x = UTriangSolve(U, c)

% ================================
% TESZT 
% ================================
% A = magic(3)
% [U,c] = GaussElim(A,[1; 2; 3])
% x = UTriangSolve(U, c)

% ellenorzes:
% A\[1;2;3]

function x = UTriangSolve(U,b)
    n = size(U, 2);
    x = zeros(n, 1);
    
    % kepletek alkalmazasa
    x(n) = b(n)/U(n,n);
    for i = (n-1) : -1 : 1
        summa = 0;
        for j = i+1 : n
            summa = summa + U(i,j)*x(j);
        end
        x(i) = 1/(U(i,i)) * (b(i) - summa);
    end
end