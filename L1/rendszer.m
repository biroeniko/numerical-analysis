% Biro Eniko
% beim1499
% 531
% Labor 1

% Mennyi a rendszer matrixanak inverze es determinansa. Mennyi a megoldas?


% ================================
% TESZT 
% ================================
% rendszer

function rendszer()
    A = [10 7 8 7; ...
         7 5 6 5; ...
         8 6 10 9; ...
         7 5 9 10]
    b = [32; 23; 33; 31]
    inverz = inv(A)
    determinans = det(A)
    
    % megoldas
    megoldas = A\b
    
    % perturbalt szabadvektor
    b_pontatlan = [32.1; 22.9; 33.1; 30.9];
    delta_b = b_pontatlan - b;
    megoldas_b_pontatlan = A\(b + delta_b)
    be_relativ_hiba1 = norm(delta_b)/norm(b)
    ki_relativ_hiba1 = norm(megoldas_b_pontatlan - megoldas)/norm(megoldas)
    
    % perturbalt egyutthatomatrix
    A_pontatlan = [10 7 8.1 7.2; ...
                   7.08 5.04 6 5; ...
                   8 5.98 9.89 9; ...
                   6.99 4.99 9 9.89];
    delta_A = A_pontatlan - A;
    megoldas_A_pontatlan = (A + delta_A)\b
    be_relativ_hiba2 = norm(delta_A)/norm(A)
    ki_relativ_hiba2 = norm(megoldas_A_pontatlan - megoldas)/norm(megoldas)
    
    % magyarazat: nagy a kondicioszam => nagy elteres kis perturbalas
    % eseten is
    kondicioszam = norm(A) * norm(inv(A))
end