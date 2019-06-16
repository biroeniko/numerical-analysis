% Biro Eniko
% beim1499
% 531
% lab10

% ========== TEST ============== 
% x = linspace(-5,5,10)'
% f = @(x) (x.^2);
% RombergIntegracio(f, -1, 1, 0.0001, 10)
% ==============================

function result = RombergIntegracio(f, a, b, epszilon, maxIter)
    h = b - a;
    prev_Q = (b-a)/2 * (f(a) + f(b)); 
    Q = prev_Q;
    i = 1;
    
    while true
        sum = 0;
        for j = 1:(2^(i-1))
            sum = sum + f(a + (2*j-1)*(h/(2^i)));
        end
        Q = (1/2) * prev_Q + (h/(2^i))*sum;
        if (i >= maxIter || abs(Q - prev_Q) < epszilon)
            break;
        end
        prev_Q = Q;
        i = i + 1;
    end
    
    if (i >= maxIter)
        disp('A leallas a maximum iteracio szerint tortent');
    else
        disp('A leallas az epszilon alapjan tortent');
    end
    
    disp('Az intervallumon a fuggveny integraltjanak kozelitesi erteke:');
    result = prev_Q;
    disp(result);
end