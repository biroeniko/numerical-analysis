% Biro Eniko
% beim1499
% 531
% lab8

% ========== TEST ============== 
% f = @(x) 1./(1 + x.^2);               % RUNGE fuggveny
% df = @(x) (-2*x)./((1 + x.^2).^2);    % RUNGE fuggveny derivaltja
% a = -5;
% b = 5;
% plotSpline(f, df, a, b)
% ==============================

function plotSpline(f, df, a, b)
    m = 1000;                       % ezekben szamoljuk ki a fuggveny ertekeket es a Lagr ertekeket
    x = linspace(a,b,m);
    plot(x, f(x), 'k');  hold on;
    n = 51;                         % ennyi pontot adunk be a Hermite interpolacioba
    X = linspace(a,b,n);            % alappontok
    dFX = df(X);
    xSpline = linspace(a,b,n);      % a Spline interpolacioval kiszamitando ertekek
    YSpline = zeros(n,1);
    fuggvenyertekek = f(X);
    for i = 1 : n
        YSpline(i) = SplineInterpolX(X', f(X)', xSpline(i)); 
    end
    
    axis([a b a b]);
    pause(1);
    plot(xSpline, YSpline, 'g'); 
end