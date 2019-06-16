% Biro Eniko
% beim1499
% 531
% lab11

% ================================
% TESZT 
% ================================
% f = @(x) (cos(x) - x)
% HurModszer(f, eps, 0.5, pi/4, 10)
% ================================


function result = HurModszer(f, epszilon, x0, x1, maxIter)
    % konvergencia feltetel
    % KELL TUDNI, HOGY MIERT VALASZTOTTAM EN EZT az x0-at UGY, AHOGY
    % pl. f'' = diff(df); -> van a konvergencia feltetel, vagyis
    % f(x0)*f''(x0) > 0
    
    x = x1;
    prev_x = x1;
    prev_prev_x = x0;
    i = 1;
    
    while true
        x = prev_x - (f(prev_x)*(prev_x - prev_prev_x))/(f(prev_x) - f(prev_prev_x));
        if (i >= maxIter || abs(x - prev_x) < epszilon)
            break;
        end
        
        prev_prev_x = prev_x;
        prev_x = x;
        i = i + 1;
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