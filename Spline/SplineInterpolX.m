% Biro Eniko
% beim1499
% 531
% lab8

% ========== TEST ============== 
% x = [1.3 1.6 1.9]'
% fx = [0.6200860 0.4554022 0.2818186]'
% SplineInterpolX(x, fx, 1.4)
% ==============================
% ========== TEST ============== 
% x = linspace(-5,5,10)'
% f = @(x) 1./(1 + x.^2);
% fx = f(x)'
% SplineInterpolX(x, fx, 1.4)
% ==============================

function SplineResult = SplineInterpolX(X, FX, x)
% 1. find -> behatarolni az x-et: find(x >= X) -> olyan index vektort ad,
% ami azt adja meg, hogy melyik indexek teljesitik ezt -> a legutolso kell
% ezek kozul
% 2. 2 oldal legtetejen megvan, hogy hogyan nez ki a Spline fgv.

n = size(X,1);

% novekvo sorrendbe rendezzuk az X es FX vektorokat - ez nem kell?
[sorted, indices] = sort(X);
X = X(indices);
FX = FX(indices);

% megkeressuk, hol van az x, melyik intervallumban
index_aux = find(x >= X);
index = index_aux(length(index_aux));
if length(index_aux) == length(X)
    index = index-1;
end

% Spline fgv
C = SplineInterpol(X, FX);
coefficients = C(:,index);

SplineResult = coefficients(1) + coefficients(2)*(x-X(index)) + ...
               coefficients(3)*(x-X(index))^2 + ...
               coefficients(4)*(x-X(index))^3;

end