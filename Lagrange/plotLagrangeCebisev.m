% Biro Eniko
% beim1499
% 531
% lab6

% ========== TEST ============== 
% f = @(x) 1./(1 + x.^2);   % RUNGE fuggveny
% plotLagrangeCebisev(f, -10, 10)
% ==============================

function plotLagrangeCebisev(f, a, b)
    m = 1000;                       % ezekben szamoljuk ki a fuggveny ertekeket es a Lagr ertekeket
    x = linspace(a,b,m);
    plot(x, f(x), 'k');  hold on;
    n = 25;                         % ennyi pontot adunk be a Lagrange interpolacioba
    X = zeros(n,1);                 % alappontok - Csebisev
    for i = 1:n
        X(i) = (a+b)/2 + (b-a)/2 * (cos(((2*i - 1) * pi)/(2*n)));
    end
    xLagr = x;        % a Lagr interpolacioval kiszamitando ertekek
    YLagr = zeros(n,1);
    %for i = 1 : m
        YLagr = LagrangeNewton(X, f(X)', xLagr); 
    %end
    
    axis([a b a b]);
    plot(xLagr, YLagr, 'g'); 
end