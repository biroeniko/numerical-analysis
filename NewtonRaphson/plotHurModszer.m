% Biro Eniko
% beim1499
% 531
% lab11

% ================================
% TESZT 
% ================================
% f = @(x) (sin(x) - x)
% plotHurModszer(f, eps, 0.5, pi/4, 10)
% f = @(x) (cos(x) - x)
% plotHurModszer(f, eps, 0.5, pi/4, 10)
% f = @(x) (x^2)
% plotHurModszer(f, eps, 0.5, pi/4, 10)
% ================================

function result = plotHurModszer(f, epszilon, x0, x1, maxIter)
    % konvergencia feltetel
    % KELL TUDNI, HOGY MIERT VALASZTOTTAM EN EZT az x0-at UGY, AHOGY
    % pl. f'' = diff(df); -> van a konvergencia feltetel, vagyis
    % f(x0)*f''(x0) > 0
    
    x = x1;
    prev_x = x1;
    prev_prev_x = x0;
    i = 1;
    
    % kirajzoljuk az Ox es Oy tengelyeket
    plot([-5*x0,5*x0], [0,0], 'k'); hold on;
    plot([0,0], [-5*x1,5*x1], 'k'); hold on;
    
    % kirajzoljuk az f-et
    fplot(f, [-5*x0, 5*x1]);
    
    % kirajzoljuk a 2 pontot
    plot(x0,f(x0),'-o');
    plot(x1,f(x1),'-o');
    
    % kirajzoljuk a hurt
    plot([x0, x1],[f(x0), f(x1)], 'r');
    
    while true
        x = prev_x - (f(prev_x)*(prev_x - prev_prev_x))/(f(prev_x) - f(prev_prev_x));
        if (i >= maxIter || abs(x - prev_x) < epszilon)
            break;
        end
        prev_prev_x = prev_x;
        prev_x = x;
        i = i + 1;

        % kirajzoljuk az uj pontot
        plot(x, f(x), '-bo');

        % kirajzoljuk a hurt - eldontjuk, hogy melyik (bal vagy jobb)
        % oldali ponttal kotjuk ossze
        
        if (f(x0)*f(x) < 0)
           x1 = x;
        else
           x0 = x;
        end
        plot([x0, x1],[f(x0), f(x1)], 'g');
    end
    
    if (i >= maxIter)
        disp('A leallas a maximum iteracio szerint tortent');
    else
        disp('A leallas az epszilon alapjan tortent');
    end
    
    disp('A gyok kozelitesi erteke:');
    result = x;
    disp(result);
end