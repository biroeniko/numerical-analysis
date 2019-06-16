% Biro Eniko
% beim1499
% 531
% Labor 1

% Irjatok MatLab fuggvenyt a sin es cos kiszam?tasara, a Taylor keplet
% alkalmazasaval

% ================================
% TESZT 
% ================================
% mySin(-20, 0.000003)
% sin(-20)

function result = mySin(x, precision)
    result = 0;
    n = 1;
    x = x - floor(x/(2*pi)) * 2 * pi;
    nextElement = x;
    
    while abs(nextElement) >= precision 
        result = result + nextElement;
        nextElement = (-1) * nextElement * x^2 / ((2*n)*(2*n+1));
        n = n + 1;
    end
end