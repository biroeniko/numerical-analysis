% Biro Eniko
% beim1499
% 531
% lab2

% Irjunk egy olyan MatLab fuggvenyt, melynek bemenete az (A, b) paros,
% kimenete pedig [U, c], ha el tudta vegezni az eliminaciot, ellenkezo esetben
% hibauzenet.
% (function [U,c] = GaussElim(A,b) )

% ================================
% TESZT 
% ================================
% A = magic(3)
% GaussElimDeterminant(A)
% det(A)
% 
% A = magic(4)
% GaussElimDeterminant(A)
% det(A)


function [determinant] = GaussElimDeterminant(A)
    % A - egyutthatomatrix   b - szabadtagok vektora
    [sor, oszlop] = size(A);
    
    csere = 0;
    
    % SORCSEREK
    % megkeressuk az abszolut ertekben maximalis elemet oszloponkent
    for j = 1 : sor
        [m, io] = max(abs(A(j:sor, j)));
        io = io + (j-1);                    % aktualizaljuk a sorindexet
       
        % ha nem lehetseges a sorcsere (a legnagyobb elem 0), akkor hibauzenettel visszaterunk
        if (m == 0)
            error('Az egyenletrendszer matrixa szingularis')
        end
        if io ~= j
            csere = csere + 1;
        end
        % elvegezzuk a sorcseret
        A([j io], :) = A([io j], :);
        
        % ELIMINACIO
        % kivonjuk az elso egyenlet (Ai1/A11)-szereset az i-edik
        % egyenletbol (i = 2, 3, ..., n)
        % azutan kivonjuk a masodik egyenlet (Ai2/A22)-szereset az i-edik
        % egyenletbol (i = 3, 4, ..., n)
        for k = j+1 : sor
            beszorzottSor = A(j,j:oszlop) * (A(k,j)/A(j,j));
            A(k,j:oszlop) = A(k,j:oszlop) - beszorzottSor;
        end
    end
    
    U = A;
    determinant = (-1)^csere * prod(diag(U));
end