% Biro Eniko
% beim1499
% 531
% lab8

% ========== TEST ============== 
% x = [1.3 1.6 1.9]'
% fx = [0.6200860 0.4554022 0.2818186]'
% SplineInterpol(x, fx)
% ==============================

function C = SplineInterpol(X, FX)
% 1. H vektor meghatarozasa -> reszintervallumok hossza
% 2. mu, d, lambda hogyan nez ki -> fel tudjuk irni az egyenletrendszert,
% amely megoldasakent megkapjuk a momentumokat (TERM SPLINE)
% 3. tridiagonalis matrix megoldasa -> relaxaciohoz hasonloan kell
% megcsinalni -> a.) diag(i), diag(i-1), diag(i+1); b.)spdiags - sparse diags (ritka matrixot general) -> ha a
% matrixot kiiratnank, akkor egy listas megjelenites lenne
% 4. megoldjuk az egyenletrendszert
% 5. meghat a momentumokat pdf 2. oldal tetejen
% 6. megvan a C

n = size(X,1) - 1;             % ahogy a pdf-ben: n+1 csomopontunk van!!!

% novekvo sorrendbe rendezzuk az X es FX vektorokat
[sorted, indices] = sort(X);
X = X(indices);
FX = FX(indices);

% H vektor meghatarozasa
aux_h = X(2:n+1) - X(1:n);
h = [0; aux_h];

% mu, lambda, d kiszamitasa
mu = zeros(n+1,1);
lambda = zeros(n+1,1);
d = zeros(n+1,1);

for i = 2 : n
    lambda(i) = h(i+1)/(h(i) + h(i+1));
    mu(i) = 1 - lambda(i);
    d(i) = (6/(h(i)+h(i+1)))*((FX(i+1) - FX(i))/h(i+1) - (FX(i) - FX(i-1))/h(i));
end
% termeszetes Spline:
lambda(1) = 1;
d(1) = 0;
mu(n+1) = 1;
d(n+1) = 0;
mu(1) = 0;
lambda(n+1) = 0;

% momentumok kiszamitasa
A = diag(2*ones(n+1,1));
A = A + diag(lambda(1:n), 1);
A = A + diag(mu(2:n+1), -1);
M = A\d;

% C kiszamitasa
alpha = zeros(n,1);
beta = zeros(n,1);
gamma = zeros(n,1);
delta = zeros(n,1);

for i = 1 : n
    alpha(i) = FX(i);
    beta(i) = ((FX(i+1) - FX(i))/h(i+1)) - (((2*M(i) + M(i+1))/6)*h(i+1));
    gamma(i) = M(i)/2;
    delta(i) = (M(i+1) - M(i))/(6*h(i+1)); 
end

C = zeros(4, n);
C(1,:) = alpha;
C(2,:) = beta;
C(3,:) = gamma;
C(4,:) = delta;
end