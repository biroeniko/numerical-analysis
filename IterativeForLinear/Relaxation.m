% Biro Eniko
% beim1499
% 531
% lab4

% ================================
% TESZT 
% ================================
% [x, nr] = Relaxation(3,eps)
% [x, nr] = Relaxation(5,eps)
% [x, nr] = Relaxation(4,eps)

function [result, nrofIterations] = Relaxation(n, epsilon)
    % matrixok felepitese
    v = 5*ones(n,1);
    A = diag(v);
    v = -1*ones(n-1,1);
    A = A + diag(v,1);
    A = A + diag(v,-1);

    b = 3*ones(n, 1);
    b(1) = 4;
    b(n) = 4;

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
    myspectralradius = max(abs(eig(B)));
    opt_omega = 2/(1 + sqrt(1-myspectralradius^2))
    
    x_prev = zeros(size(b));       % kezdetben nullvektor
    
    if norm(B) >= 1
        error('Az eljaras nem konvergens!')
    end
    
    B = inv(D/opt_omega - L)*(((1 - opt_omega)/opt_omega)*D + U);
    f = inv(D/opt_omega - L)*b;
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