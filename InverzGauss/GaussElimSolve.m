% Biro Eniko
% beim1499
% 531
% lab2

% ================================
% TESZT 
% ================================
% B = [3 3; 5 5]
% GaussElimSolve(B, [1; 2]) 
% -> inkompatibilis

% A = magic(3)
% GaussElimSolve(A,[1; 2; 3])
% ell: A\[1; 2; 3]

% GaussElimSolve(magic(3),[1; 2; 3])
% GaussElimSolve(magic(4),[1; 2; 3; 4])

% A = [1 2 3; 4 3 2; 1 2 3]
% b = [2;3;2]
% GaussElimSolve(A,b)
% -> Az egyenletrendszer matrixa szingularis

% GaussElimSolve(magic(7),[1; 2; 3; 5;7;8;8])
% magic(7)\[1; 2; 3; 5;7;8;8]

function GaussElimSolve(A,b)
    p = rank(A);
    n = size(A, 2);
    [U,c] = GaussElim(A,b);
    
    % ellenorizzuk, hogy letezik-e olyan p es n index kozotti szabad tag,
    % ami nem egyenlo 0-val
    for i = p+1 : n
        if c(i) ~= 0
            error('A rendszer nem kompatibilis');
        end
    end
    
    allIsZero = false;
    if p ~= n
        for i = p+1 : n
            if c(i) ~= 0
                error('A rendszer nem kompatibilis');
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
        disp('A rendszer kompatibilis, hatarozatlan');
    else
        disp('A rendszer megoldasa:')
        x = UTriangSolve(U, c)
    end
    
end