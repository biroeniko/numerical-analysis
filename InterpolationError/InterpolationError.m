% ========== TEST ============== 
% X = [1.0; 1.3; 1.6; 1.9; 2.2]
% f = @(x) exp(x)
% FX = f(X)
% InterpolationError(X, 1.5)
% result = LagrInterpolation(X, FX, 1.5, 10^(-3));
% ==============================

function [] = InterpolationError(X, value)
    f = @(x) exp(x);
    df = @(x) exp(x);
    FX = f(X);
    dFX = df(X);                % itt most ugyanaz a derivalt, maskepp derivalni kell

    xErtHermite = HermiteInterpol(X, FX, dFX, value)
    xErtLagr = LagrInterpolation(X, FX, value, 10e-3)

    difference = abs(xErtHermite - xErtLagr)

    errorHermite = abs(f(value) - xErtHermite)
    errorLagr = abs(f(value) - xErtLagr)
end

