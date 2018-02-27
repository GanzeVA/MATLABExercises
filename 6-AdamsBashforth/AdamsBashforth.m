function [ Y1, Y2, X ] = AdamsBashforth( f1, f2, y1_pocz, y2_pocz, a, b, n )
% Szymon Samuel Zborowski
% Funkcja rozwi¹zuje numerycznie uk³ad dwóch równañ ró¿niczkowych metod¹
% Adamsa-Bashfortha rzêdu 2-go. Wartoœci pocz¹tkowe wyznacza ulepszon¹
% metod¹ Eulera.
% Wejœcie:
%   f1, f2 - funkcje z uk³adu ró¿niczkowego
%   a, b - przedzia³, na którym dzia³aj¹ funkcje
%   y1_pocz, y2_pocz - zagadnienia pocz¹tkowe dla y1 i y2 (y1(a) = y1_pocz,
%   y2(a) = y2_pocz)
%   n - okreœla na ile punktów podzieliæ przedzia³ (krok ca³kowania 
%   h = (b - a) / n)
% Wyjœcie:
%   X - macierz 1xn punktów, w których obliczono wartoœci
%   Y1 - obliczona wartoœæ y1 w punktach z X
%   Y2 - obliczona wartoœæ y2 w punktach z X
% Wywo³anie:
%   [ Y1, Y2, X ] = AdamsBashforth( f1, f2, y1_pocz, y2_pocz, a, b, n );

h = (b - a) / n;
X = a:h:b;

Y1 = zeros(1, n+1);
Y2 = zeros(1, n+1);
Y1(1) = y1_pocz;
Y2(1) = y2_pocz;

% Obliczamy pierwszy punkt ulepszon¹ metod¹ Eulera
Y1(2) = Y1(1) + ((h./2) * ((f1(X(1), Y1(1), Y2(1))) + ... 
        f1(X(1), Y1(1) + h * f1(X(1), Y1(1), Y2(1)), ...
        Y2(1) + h * f2(X(1), Y1(1), Y2(1)))));
Y2(2) = Y2(1) + ((h./2) * ((f2(X(1), Y1(1), Y2(1))) + ... 
        f2(X(1), Y1(1) + h * f1(X(1), Y1(1), Y2(1)), ...
        Y2(1) + h * f2(X(1), Y1(1), Y2(1)))));   

% Obliczamy pozosta³e punkty metod¹ Adamsa-Bashfortha rzêdu 2-go
for i = 3:n+1
    Y1(i) = Y1(i-1) + ((h./2) * (3 * f1(X(i), Y1(i-1), Y2(i-1)) - f1(X(i-1), Y1(i-2), Y2(i-2))));
    Y2(i) = Y2(i-1) + ((h./2) * (3 * f2(X(i), Y1(i-1), Y2(i-1)) - f2(X(i-1), Y1(i-2), Y2(i-2))));
end

end

