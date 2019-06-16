% Biro Eniko
% beim1499
% 531
% lab5

% X = [1.0; 1.3; 1.6; 1.9; 2.2]
% FX = [0.7651977; 0.6200860; 0.4554022; 0.2818186; 0.1103623]
% result = LagrInterpolation(X, FX, 1.5, 10^(-4));
%   Az f fgv megkozelito erteke a kert pontban epsilon pontossaggal: 0.511820
% result = LagrInterpolation(X, FX, 1.5, eps);
%   A kert pontszam nem elegendo a kert pontossag eleresehez

% x = [1 1.1 1.4 1.5]'
% fx = [1 1.21 1.96 2.25]'
% result = LagrInterpolation(x, fx, 1.3, 0.01);
%   Az f fgv megkozelito erteke a kert pontban epsilon pontossaggal: 1.690000

function [result] = LagrInterpolation(X, FX, x, epsilon)
    % az x-tol valo tavolsag szerint rendezzuk az X es FX vektorokat
    n = size(X,1);
    DistanceVector = abs(x*ones() - X);
    result = 0;
    resultIsOk = false;
    
    [sorted, indices] = sort(DistanceVector);
    X = X(indices)
    FX = FX(indices);
    
    % tablazat elemeinek a generalasa
    Q = zeros(n,n);
    
    % elso osztlop kitoltese
    Q(:,1) = FX;
   
    % tobbi oszlop kitoltese
    for i = 2 : n
        for j = 1 : i-1
            Q(i,j+1) = (Q(j,j) * (X(i) - x) - Q(i,j)*(X(j) - x))/(X(i) - X(j));
        end
        % a foatlot nezzuk
        if (abs(Q(i,i) - Q(i-1, i-1)) < epsilon)
            result = Q(i,i);
            resultIsOk = true;
            break;
        end
    end
    
    if ~resultIsOk
        % ha nem allt le, akkor hiba
        error('A kert pontszam nem elegendo a kert pontossag eleresehez')
    else
        fprintf('Az f fgv megkozelito erteke a kert pontban epsilon pontossaggal: %f\n', result);
    end
end