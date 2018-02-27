function [ c ] = ConditionNumber( A, eps )
% Szymon Samuel Zborowski
% Funkcja oblicza wska�nik uwarunkowania podanej macierzy diagonalnie 
% silnie dominuj�cej A=A'>0. Oblicza warto�� w�asn� maksymaln� z metody
% pot�gowej i warto�� w�asn� minimaln� z odwrotnej metody pot�gowej. Uk�ady
% r�wna� rozwi�zuje korzystaj�c z metody iteracyjnej Gaussa-Seidla.
% Wej�cie:
%   A - macierz silnie diagonalnie dominuj�ca, dodatnio okre�lona,
%       spe�niaj�ca warunek A=A', kt�rej wska�nik uwarunkowania nale�y
%       obliczy�
% Wyj�cie:
%   c - obliczony wska�nik uwarunkowania macierzy A
%   eps - warunek zako�czenia p�tli obliczaj�cej warto�ci w�asne metod�
%       pot�gow�
% Wywo�anie:
%   c = ConditionNumber(A);

if (nargin == 0)
    %A = [19 2 -1; 2 8 1; -1 1 7]; % Przyk�ady a) i b)
    %{
    A = [2.6822 0 0.1576 0.1419 0.6557;
         0 2.0826 0.9706 -0.4218 0.0357;
         0.1576 0.9706 4.8074 0 -0.8491;
         0.1419 -0.4218 0 3.9978 0.9340;
         0.6557 0.0357 -0.8491 0.9340 3.8320] % Przyk�ady c) i d)
    %}
end 
if (nargin < 2)
    eps = 10e-6;
end

n = length(A);

% bada, czy podana macierz spe�nia za�o�enia
if ~isequal(A, A')
    error('Macierz nie jest r�wna macierzy transponowanej');
end
for i=1:n
    if det(A(1:i, 1:i)) <= 0
        error('Macierz nie jest dodatnio okre�lona');
    end
    if abs(A(i,i)) <= sum(abs(A(i,:))) - abs(A(i,i))
        error('Macierz nie jest silnie diagonalnie dominuj�ca');
    end
end

% oblicza warto�� w�asn� maksymaln� macierzy (lmax)
x = ones(n,1);
err = 1;
while(err > eps)
    xold = x;
    y = A * x;
    x = y / norm(y);
    err = norm(x - xold);
end
lmax = x' * A * x;

% oblicza warto�� w�asn� minimaln� macierzy (lmin)
x = ones(n,1);
err = 1;
while(err > eps)
    xold = x;
    
    % UK�AD R�WNA� A*y=x METOD� GAUSSA-SEIDLA
    y = ones(n,1);
    while(err > eps)
        yold = y;
        for i = 1:n
            sumy = A(i, [1:i-1, i+1:n]) * y([1:i-1, i+1:n]);
            y(i) = (x(i) - sumy) / A(i,i);
        end
        err = norm(y - yold);
    end
    
    x = y / norm(y);
    err = norm(x - xold);
end
lmin = x' * A * x;

% oblicza wska�nik uwarunkowania macierzy
c = lmax / lmin;

eig(A)
lmax
lmin
end

