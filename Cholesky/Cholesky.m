% Biro Eniko
% beim1499
% 531
% lab3

% ================================
% TESZT 
% ================================
% A = [2 -1 0; -1 2 -1; 0 -1 2]
% L = chol(A)
% L = Cholesky(A)

function L = Cholesky(A)
    n = size(A, 2);
    L = zeros(n, n);
    for i = 1 : n
        for j = 1 : i
            if i == j
                summa = 0;
                for k = 1 : (i-1)
                    summa = summa + L(i,k)*L(i,k);
                end
                L(i,j) = sqrt(A(i,i) - summa);
                if (A(i,i) - summa) < 0
                    error('A matrix nem pozitiv definit!')
                end
            else
                summa = 0;
                for k = 1 : (j-1)
                    summa = summa + L(j,k)*L(i,k);
                end
                L(i,j) = (1/(L(j,j)))*(A(i,j) - summa);
            end
        end
    end
    
    L = L';
    
    % Ellenorzes: L*L' == A?
end