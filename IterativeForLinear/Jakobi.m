% Biro Eniko
% beim1499
% 531
% lab4

% ================================
% TESZT 
% ================================
% A = [2 -1 0; -1 2 -0.5; 0 -0.5 2]
% [x, nr] = Jakobi(A, [1;2;3], eps)
% A\[1;2;3]

function [result, nrofIterations] = Jakobi(A, b, epsilon)
    n = size(A, 2);
    
    % ellenorizzuk, hogy soronkent dominans foatloju-e a matrix
    for i = 1 : n
        summa = 0;
        for j = 1 : n
            if i ~= j
                summa = summa + abs(A(i,j));
            end
        end
        if abs(A(i,i)) <= summa
            error('A matrix soronkent nem dominans foatloju!');
        end
    end
    
    D = zeros(n,n);
    for i = 1 : n
        D(i,i) = A(i,i);
    end
    
    L = -tril(A, -1);
    U = -triu(A, 1);
    
    B = inv(D)*(L+U);
    f = inv(D) * b;
    x_prev = zeros(size(b));       % kezdetben nullvektor
    
    if norm(B) >= 1
        error('Az eljaras nem konvergens!')
    end
    
    % rejtett do while ciklus
    nrofIterations = 0;
    while true
        x = B*x_prev + f;
        nrofIterations = nrofIterations + 1;
        if norm(x - x_prev) <= ((1 - norm(B))/(norm(B))) * epsilon
            break;
        end
        x_prev = x;
    end
    
    result = x;

end