% Biro Eniko
% beim1499
% 531
% lab7

% ========== TEST ============== 
% f = @(x) 1./(1 + x.^2);               % RUNGE fuggveny
% df = @(x) (-2*x)./((1 + x.^2).^2);    % RUNGE fuggveny derivaltja
% a = -5;
% b = 5;
% plotHermite(f, df, a, b)
% ==============================

function plotHermite(f, df, a, b)
    m = 1000;                       % ezekben szamoljuk ki a fuggveny ertekeket es a Lagr ertekeket
    x = linspace(a,b,m);
    plot(x, f(x), 'k');  hold on;
    n = 30;                         % ennyi pontot adunk be a Hermite interpolacioba
    X = linspace(a,b,n);            % alappontok
    dFX = df(X);
    xHerm = linspace(a,b,m);        % a Hermite interpolacioval kiszamitando ertekek
    YHerm = zeros(n,1);
    %for i = 1 : m
        YHerm = HermiteInterpol(X', f(X)', dFX', xHerm); 
    %end
    
    axis([a b a b]);
    plot(xHerm, YHerm, 'g'); 
end