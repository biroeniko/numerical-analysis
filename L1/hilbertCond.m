% Biro Eniko
% beim1499
% 531
% Labor 1

% Tanulmanyozd a Hilbert matrix Hn = (hij), hij = 1
% i+j?1 , i = 1, n, j = 1, n
% kond?cionalasat. (cond)

% ================================
% TESZT 
% ================================
% hilbertCond(5)

function hilbertCond(n)
    for k = 1 : n
        hilbertMatrix = zeros(k, k);
        for i = 1 : k
            for j = 1 : k
                hilbertMatrix(i, j) = 1/(i+j-1);
            end
        end
        kondicioSzam = norm(hilbertMatrix)*norm(inv(hilbertMatrix));
        fprintf('n = %d -re a kondicioszam: %f\n', i, kondicioSzam);
    end
end