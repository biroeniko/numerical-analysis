% Biro Eniko
% beim1499
% 531
% lab11

% ================================
% TESZT 
% ================================
% f = @(x) cos(x) - x
% df = @(x) -sin(x) - 1
% plotNewtonRaphson(f, df, 0.0001, pi/4, 0, pi/4, 10)
% ================================

function result = plotNewtonRaphson(f, df, epszilon, x0, a, b, maxIter)
    % kirajzoljuk az Ox es Oy tengelyeket
    plot([0,0],[a,b], 'k'); hold on;
    plot([a,b],[0,0], 'k');
    
    x = linspace(a, b, 1000);
    xx = linspace(a, b, 10);
    plot(x, f(x), 'g')
    
    NR = NewtonRaphson(f, df, x0, epszilon, maxIter);
    NRlen = length(NR);
    
    for i = 1:NRlen
        t = (xx-NR(i)) * df(NR(i)) + f(NR(i));
        plot(xx, t, 'b')
    end
end