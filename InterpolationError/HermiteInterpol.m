% Biro Eniko
% beim1499
% 531
% lab7

% ========== TEST ============== 
% x = [1.3 1.6 1.9]'
% fx = [0.6200860 0.4554022 0.2818186]'
% dfx = [-0.5220232 -0.5698959 -0.5811571]'
% HermiteInterpol(x, fx, dfx, 1.5)
% ==============================

function [HermiteResult] = HermiteInterpol(X, FX, dFX, x)
    m = size(X, 1);
    HermiteResult = 0;
    
    Z = zeros(2*m,1);
    FZ = zeros(2*m,1);
    for i = 1:m
        Z(2*i-1) = X(i);
        Z(2*i) = X(i);
        FZ(2*i-1) = FX(i);
        FZ(2*i) = FX(i);
    end
    osztottDiff = zeros(2*m,2*m);
    % elso oszlop
    osztottDiff(:,1) = FZ;
    
    % masodik oszlop kulon eset, derivaltakat is hasznalunk
    for i = 1 : m
        osztottDiff(2*i,2) = dFX(i);
        if i ~= 1
            osztottDiff(2*i-1,2) = (osztottDiff(2*i-1,1) - osztottDiff(2*i-2,1))/(Z(2*i-1) - Z(2*i-2));
        end
    end
    
    % oszloponkent toltjuk fel
    for i = 3 : (2*m)
        for j = 3 : i
            osztottDiff(i,j) = (osztottDiff(i,j-1) - osztottDiff(i-1,j-1))/(Z(i) - Z(i-j+1));
        end
    end
    
    % kiszamoljuk a Hermite polinomot
    faktor = 1;
    for j = 1 : 2*m
        HermiteResult = HermiteResult + faktor.*osztottDiff(j,j);
        faktor = faktor.*(x - Z(j));
    end
    
end