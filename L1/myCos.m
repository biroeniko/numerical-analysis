% Biro Eniko
% beim1499
% 531
% Labor 1

% Irjatok MatLab fuggvenyt a sin es cos kiszam?tasara, a Taylor keplet
% alkalmazasaval

% ================================
% TESZT 
% ================================
% myCos(2000, 0.000003)
% cos(2000)

function result = myCos(x, precision)
    result = 0;
    nextElement = 1;
    n = 1;
    x = x - floor(x/(2*pi)) * 2 * pi;
    
    while abs(nextElement) >= precision 
        result = result + nextElement;
        nextElement = (-1) * nextElement * x^2 / ((2*n-1)*(2*n));
        n = n + 1;
    end
end