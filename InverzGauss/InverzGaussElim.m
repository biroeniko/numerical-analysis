% Biro Eniko
% beim1499
% 531
% lab2

% ================================
% TESZT 
% ================================
% A = magic(3)
% InverzGaussElim(A)

function inverz = InverzGaussElim(A)
    % A - egyutthatomatrix   b - szabadtagok vektora
    A = [A, eye(size(A,2))];
    [sor, oszlop] = size(A);
    
    % SORCSEREK
    % megkeressuk az abszolut ertekben maximalis elemet oszloponkent
    for j = 1 : sor
        [m, io] = max(abs(A(j:sor, j)));
        io = io + (j-1);                    % aktualizaljuk a sorindexet
       
        % ha nem lehetseges a sorcsere (a legnagyobb elem 0), akkor hibauzenettel visszaterunk
        if (m == 0)
            error('Az egyenletrendszer matrixa szingularis')
        end
        
        % elvegezzuk a sorcseret
        A([j io], :) = A([io j], :);
        
        % ELIMINACIO
        % kivonjuk az elso egyenlet (Ai1/A11)-szereset az i-edik
        % egyenletbol (i = 2, 3, ..., n)
        % azutan kivonjuk a masodik egyenlet (Ai2/A22)-szereset az i-edik
        % egyenletbol (i = 3, 4, ..., n)
        for k = 1 : sor
            if (k ~= j)
                beszorzottSor = A(j,j:oszlop) * (A(k,j)/A(j,j));
                A(k,j:oszlop) = A(k,j:oszlop) - beszorzottSor;
            end
        end
    end
    
    % a bal oldali matrixot egysegmatrixig visszuk
    for i = 1 : sor
        d = A(i,i);
        for j = 1 : oszlop
            A(i,j) = A(i,j)/d;
        end
    end   
    
    inverz = A(:,oszlop/2+1:oszlop);
end