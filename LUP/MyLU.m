% Biro Eniko
% beim1499
% 531
% lab3

% ================================
% TESZT 
% ================================
% (function [L,U,P] = MyLU(A))
% A = [2 -1 0; -1 2 -1; 0 -1 2]
% [L,U,P] = MyLU(A)
% [L,U,P] = lu(A)

% A = magic(3)
% [L,U,P] = MyLU(A)
% [L,U,P] = lu(A)

function [L,U,P] = MyLU(A)
    % A - egyutthatomatrix
    n = size(A, 2);
    P = eye(n);
    
    % SORCSEREK
    % megkeressuk az abszolut ertekben maximalis elemet oszloponkent
    for j = 1 : n
        [m, io] = max(abs(A(j:n, j)));
        io = io + (j-1);                    % aktualizaljuk a sorindexet
       
        % ha nem lehetseges a sorcsere (a legnagyobb elem 0), akkor hibauzenettel visszaterunk
        if (m == 0)
            error('Az egyenletrendszer matrixa szingularis')
        end
        
        % elvegezzuk a sorcseret
        A([j io], :) = A([io j], :);
        P([j io], :) = P([io j], :);  
        
        % ELIMINACIO
        % kivonjuk az elso egyenlet (Ai1/A11)-szereset az i-edik
        % egyenletbol (i = 2, 3, ..., n)
        % azutan kivonjuk a masodik egyenlet (Ai2/A22)-szereset az i-edik
        % egyenletbol (i = 3, 4, ..., n)
        % kivonas
        for k = j+1 : n
            beszorzottSor = A(j,j:n) * (A(k,j)/A(j,j));
            l = (A(k,j)/A(j,j));
            A(k,j:n) = A(k,j:n) - beszorzottSor;
            A(k,j) = l;
        end
    end
    
    L = tril(A, -1);
    for i = 1 : n
        L(i,i) = 1;
    end
    
    U = triu(A);
end