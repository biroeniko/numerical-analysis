% Biro Eniko
% beim1499
% 531
% lab6

% ========== TEST ============== 
% x = [1 1.1 1.5 1.6]'
% fx = [1 1.21 2.25 2.56]'
% LagrangeNewton(x, fx, 1.3)
% ==============================

function [LagrResult] = LagrangeNewton(X, FX, x)
    m = size(X, 1);
    osztottDiff = zeros(m,m);
    osztottDiff(:,1) = FX;
    LagrResult = 0;
    
    % oszloponkent toltjuk fel
    for j = 2 : m
        for i = 1 : (m-j+1)
            osztottDiff(i,j) = (osztottDiff(i+1,j-1) - osztottDiff(i,j-1))/(X(i+j-1) - X(i));
        end
    end
    
    % kiszamoljuk a Lagrange polinomot
    faktor = 1;
    for j = 1 : m
        LagrResult = LagrResult + faktor.*osztottDiff(1,j);
        faktor = faktor.*(x - X(j));
    end
    
end