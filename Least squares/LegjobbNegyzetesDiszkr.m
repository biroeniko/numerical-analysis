% Biro Eniko
% beim1499
% 531
% lab9

% ========== TEST ============== 
% x = linspace(-5,5,10)'
% f = @(x) (x.^2);
% fx = f(x)'
% LegjobbNegyzetesDiszkr(x, fx, 3, 4)
% ==============================

function approxResult = LegjobbNegyzetesDiszkr(X, FX, n, x)
    m = length(X);
    egyutthatoMatrix = zeros(n+1, n+1);
    szabadtagVektor = zeros(n+1, 1);
    
    % feltoltjuk az egyutthagytomatrixot
    for i = 1 : (n+1)
        for k = 1 : (n+1)
            sum = 0;
            for j = 1 : m
                sum = sum + (X(j))^(i+k-2);
            end
            egyutthatoMatrix(i,k) = sum;
        end
    end
    
    % feltoltjuk az szabadtagvektort
    for k = 1 : (n+1)
        sum = 0;
        for j = 1 : m
            sum = sum + FX(j) * X(j)^(k-1);
        end
        szabadtagVektor(k) = sum;
    end   
    alphas = egyutthatoMatrix\szabadtagVektor;
    
    % kiszamoljuk a kozetlitest
    approxResult = 0;
    bazisfuggveny = 1;
    for i = 1 : (n+1)
        approxResult = approxResult + alphas(i)*bazisfuggveny;
        bazisfuggveny = bazisfuggveny * x;
    end
end