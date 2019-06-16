% Biro Eniko
% beim1499
% 531
% lab9

% ========== TEST ============== 
% x = linspace(-5,5,10)'
% f = @(x) (x.^2);
% fx = f(x)'
% LegjobbNegyzetesFolyt(-1, 1, 10, 0.8)
% LegjobbNegyzetesFolyt(-1, 1, 7, 0.5)
% ==============================

function approxResult = LegjobbNegyzetesFolyt(a, b, n, x)
    szabadtagVektor = zeros(n+1, 1);
    
    % feltoltjuk az szabadtagvektort
    for k = 1 : (n+1)
        myfunction = @(x) ((x.^2)/(sqrt(1-x.^2))) .* (cos((k-1)*acos(x)));
        szabadtagVektor(k) = quad(myfunction, a, b);
        if k == 1
            alphas(k) = szabadtagVektor(k) / (pi);
        else
            alphas(k) = szabadtagVektor(k) / (pi/2);
        end
    end   
    szabadtagVektor
    % kiszamoljuk a kozetlitest
    approxResult = 0;
    for k = 1 : (n+1)
        approxResult = approxResult + alphas(k)*(cos((k-1)*acos(x)));
    end
    approxResult
end