function [ c ] = ConditionNumber( A, eps )
% Szymon Samuel Zborowski
% Funkcja oblicza wskaŸnik uwarunkowania podanej macierzy diagonalnie 
% silnie dominuj¹cej A=A'>0. Oblicza wartoœæ w³asn¹ maksymaln¹ z metody
% potêgowej i wartoœæ w³asn¹ minimaln¹ z odwrotnej metody potêgowej. Uk³ady
% równañ rozwi¹zuje korzystaj¹c z metody iteracyjnej Gaussa-Seidla.
% Wejœcie:
%   A - macierz silnie diagonalnie dominuj¹ca, dodatnio okreœlona,
%       spe³niaj¹ca warunek A=A', której wskaŸnik uwarunkowania nale¿y
%       obliczyæ
% Wyjœcie:
%   c - obliczony wskaŸnik uwarunkowania macierzy A
%   eps - warunek zakoñczenia pêtli obliczaj¹cej wartoœci w³asne metod¹
%       potêgow¹
% Wywo³anie:
%   c = ConditionNumber(A);

if (nargin == 0)
    %A = [19 2 -1; 2 8 1; -1 1 7]; % Przyk³ady a) i b)
    %{
    A = [2.6822 0 0.1576 0.1419 0.6557;
         0 2.0826 0.9706 -0.4218 0.0357;
         0.1576 0.9706 4.8074 0 -0.8491;
         0.1419 -0.4218 0 3.9978 0.9340;
         0.6557 0.0357 -0.8491 0.9340 3.8320] % Przyk³ady c) i d)
    %}
end 
if (nargin < 2)
    eps = 10e-6;
end

n = length(A);

% bada, czy podana macierz spe³nia za³o¿enia
if ~isequal(A, A')
    error('Macierz nie jest równa macierzy transponowanej');
end
for i=1:n
    if det(A(1:i, 1:i)) <= 0
        error('Macierz nie jest dodatnio okreœlona');
    end
    if abs(A(i,i)) <= sum(abs(A(i,:))) - abs(A(i,i))
        error('Macierz nie jest silnie diagonalnie dominuj¹ca');
    end
end

% oblicza wartoœæ w³asn¹ maksymaln¹ macierzy (lmax)
x = ones(n,1);
err = 1;
while(err > eps)
    xold = x;
    y = A * x;
    x = y / norm(y);
    err = norm(x - xold);
end
lmax = x' * A * x;

% oblicza wartoœæ w³asn¹ minimaln¹ macierzy (lmin)
x = ones(n,1);
err = 1;
while(err > eps)
    xold = x;
    
    % UK£AD RÓWNAÑ A*y=x METOD¥ GAUSSA-SEIDLA
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

% oblicza wskaŸnik uwarunkowania macierzy
c = lmax / lmin;

eig(A)
lmax
lmin
end

