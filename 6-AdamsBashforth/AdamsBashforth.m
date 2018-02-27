function [ Y1, Y2, X ] = AdamsBashforth( f1, f2, y1_pocz, y2_pocz, a, b, n )
% Szymon Samuel Zborowski
% Funkcja rozwi�zuje numerycznie uk�ad dw�ch r�wna� r�niczkowych metod�
% Adamsa-Bashfortha rz�du 2-go. Warto�ci pocz�tkowe wyznacza ulepszon�
% metod� Eulera.
% Wej�cie:
%   f1, f2 - funkcje z uk�adu r�niczkowego
%   a, b - przedzia�, na kt�rym dzia�aj� funkcje
%   y1_pocz, y2_pocz - zagadnienia pocz�tkowe dla y1 i y2 (y1(a) = y1_pocz,
%   y2(a) = y2_pocz)
%   n - okre�la na ile punkt�w podzieli� przedzia� (krok ca�kowania 
%   h = (b - a) / n)
% Wyj�cie:
%   X - macierz 1xn punkt�w, w kt�rych obliczono warto�ci
%   Y1 - obliczona warto�� y1 w punktach z X
%   Y2 - obliczona warto�� y2 w punktach z X
% Wywo�anie:
%   [ Y1, Y2, X ] = AdamsBashforth( f1, f2, y1_pocz, y2_pocz, a, b, n );

h = (b - a) / n;
X = a:h:b;

Y1 = zeros(1, n+1);
Y2 = zeros(1, n+1);
Y1(1) = y1_pocz;
Y2(1) = y2_pocz;

% Obliczamy pierwszy punkt ulepszon� metod� Eulera
Y1(2) = Y1(1) + ((h./2) * ((f1(X(1), Y1(1), Y2(1))) + ... 
        f1(X(1), Y1(1) + h * f1(X(1), Y1(1), Y2(1)), ...
        Y2(1) + h * f2(X(1), Y1(1), Y2(1)))));
Y2(2) = Y2(1) + ((h./2) * ((f2(X(1), Y1(1), Y2(1))) + ... 
        f2(X(1), Y1(1) + h * f1(X(1), Y1(1), Y2(1)), ...
        Y2(1) + h * f2(X(1), Y1(1), Y2(1)))));   

% Obliczamy pozosta�e punkty metod� Adamsa-Bashfortha rz�du 2-go
for i = 3:n+1
    Y1(i) = Y1(i-1) + ((h./2) * (3 * f1(X(i), Y1(i-1), Y2(i-1)) - f1(X(i-1), Y1(i-2), Y2(i-2))));
    Y2(i) = Y2(i-1) + ((h./2) * (3 * f2(X(i), Y1(i-1), Y2(i-1)) - f2(X(i-1), Y1(i-2), Y2(i-2))));
end

end

