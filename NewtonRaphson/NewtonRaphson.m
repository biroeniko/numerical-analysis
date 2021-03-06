% Biro Eniko
% beim1499
% 531
% lab11

% ================================
% TESZT 
% ================================
% f = @(x) (cos(x) - x)
% df = @(x) (-sin(x) - 1)
% NewtonRaphson(f, df, pi/4, eps, 10)
% ================================

function result = NewtonRaphson(f, df, x0, epszilon, maxIter)
    % konvergencia feltetel
    % KELL TUDNI, HOGY MIERT VALASZTOTTAM EN EZT az x0-at UGY, AHOGY
    % pl. f'' = diff(df); -> van a konvergencia feltetel, vagyis
    % f(x0)*f''(x0) > 0
    
    x = size(maxIter);
    x(1) = x0;
    prev_x = x0;
    i = 1;
    
    while true
        x(i+1) = prev_x - f(prev_x)/df(prev_x);
        if (i >= maxIter || abs(x(i+1) - prev_x) < epszilon)
            break;
        end
        prev_x = x(i+1);
        i = i + 1;
    end
    
    if (i >= maxIter)
        disp('A leallas a maximum iteracio szerint tortent');
    else
        disp('A leallas az epszilon alapjan tortent');
    end
    
    disp('A fuggvenyertek kozelitesi erteke:');
    result = x;
    disp(result(i+1));
end