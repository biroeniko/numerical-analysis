% Biro Eniko
% beim1499
% 531
% lab6

% ========== TEST ============== 
% f = @(x) 1./(1 + x.^2);   % RUNGE fuggveny
% a = -5;
% b = 5;
% plotLagrange(f, a, b)
% ==============================

function plotLagrange(f, a, b)
    m = 1000;                       % ezekben szamoljuk ki a fuggveny ertekeket es a Lagr ertekeket
    x = linspace(a,b,m);
    plot(x, f(x), 'k');  hold on;
    n = 25;                         % ennyi pontot adunk be a Lagrange interpolacioba
    X = linspace(a,b,n);            % alappontok
    xLagr = linspace(a,b,m);        % a Lagr interpolacioval kiszamitando ertekek
    YLagr = zeros(n,1);
    %for i = 1 : m
        YLagr = LagrangeNewton(X', f(X)', xLagr); 
    %end
    
    axis([a b a b]);
    plot(xLagr, YLagr, 'g'); 
end