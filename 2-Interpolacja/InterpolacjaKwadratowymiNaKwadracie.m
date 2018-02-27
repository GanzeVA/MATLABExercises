function [ W, errmax ] = InterpolacjaKwadratowymiNaKwadracie( fun, a, b, n )
% Szymon Samuel Zborowski
% Funkcja interpoluje funkcjami kwadratowymi na kwadracie podzielonym
% na 2n^2 tr�jk�t�w przystaj�cych. Tablicuje funkcje, przybli�enia i b��dy
% w �rodkach ci�ko�ci tr�jk�t�w. Oblicza b��d maksymalny w tych punktach.
% Wej�cie:
%   fun - funkcja interpolowana przez program
%   a - liczba okre�laj�ca punkt pocz�tkowy interpolacji (a, b)
%   b - liczba okre�laj�ca punkt pocz�tkowy interpolacji (a, b)
%   n - d�ugo�� boku kwadratu, na kt�rym interpolujemy (okre�la liczb�
%       tr�jk�t�w przystaj�cych, na kt�re podzielony zostanie kwadrat)
% Wyj�cie:
%   W - tablica zawieraj�ca w kolejnych kolumnach: wsp�rz�dn� x-ow�
%       punktu, wsp�rz�dn� y-ow� punktu, funkcj� w danym punkcie, funkcj�
%       interpoluj�c� w danym punkcie, b��d bezwzgl�dny oraz b��d wzgl�dny
%       interpolacji
%   errmax - maksymalny b��d bezwzgl�dny interpolacji w danych punktach
% Wywo�anie:
%   [ W, errmax ] = InterpolacjaKwadratowymiNaKwadracie( fun, a, b, n );

if (nargin < 3)
    fun = @(x,y) (x+y)^3;
    a = 3;
    b = 2;
    n = 2;
end 

Tr = zeros(2*n*n, 14); %[ A,B,C,D,E,F,S ]
Kw = zeros(n*n, 8); %[ A,B,C,D ]
W = zeros(2*n*n, 6);

for i=1:n
    for j=1:n
        ind = j + ((i-1)*n);
        Kw(ind,1:2) = [a + (i-1)/n, b + (j-1)/n];
        Kw(ind,3:8) = [Kw(ind, 1) + 1/n, Kw(ind, 2), Kw(ind, 1), Kw(ind, 2) + 1/n, Kw(ind, 1) + 1/n, Kw(ind, 2) + 1/n];
    end
end
for i=1:(n*n)
    Tr(i*2 - 1, 1:6) = Kw(i, 1:6);
    Tr(i*2, 1:6) = Kw(i, 3:8);
end
for i=1:(2*n*n)
    Tr(i, 7:12) = [(Tr(i,1) + Tr(i,3)) / 2, (Tr(i,2) + Tr(i,4)) / 2, (Tr(i,3) + Tr(i,5)) / 2, (Tr(i,4) + Tr(i,6)) / 2, (Tr(i,1) + Tr(i,5)) / 2, (Tr(i,2) + Tr(i,6)) / 2]; 
    Tr(i, 13:14) = [(Tr(i,1) + Tr(i,3) + Tr(i,5)) / 3, (Tr(i,2) + Tr(i,4) + Tr(i,6)) / 3];
end
figure;
plot(Tr(:,1),Tr(:,2),Tr(:,3),Tr(:,4),Tr(:,5),Tr(:,6));
title('Podzia� kwadratu na 2n^2 tr�jk�t�w przystaj�cych');

for i=1:(2*n*n)
    d = (Tr(i, 3) - Tr(i,5))*(Tr(i,2) - Tr(i,6)) - (Tr(i,4) - Tr(i,6))*(Tr(i,1) - Tr(i,5));
    
    f0 = @(x,y) ((Tr(i,6) - Tr(i,4))*x + (Tr(i,3) - Tr(i,5))*y + Tr(i,5)*Tr(i,4) - Tr(i,6)*Tr(i,3))/d;
    f1 = @(x,y) ((Tr(i,2) - Tr(i,6))*x + (Tr(i,5) - Tr(i,1))*y + Tr(i,1)*Tr(i,6) - Tr(i,2)*Tr(i,5))/d;
    f2 = @(x,y) ((Tr(i,4) - Tr(i,2))*x + (Tr(i,1) - Tr(i,3))*y + Tr(i,3)*Tr(i,2) - Tr(i,4)*Tr(i,1))/d;

    p0 = @(x, y) f0(x,y)*(2*f0(x,y) - 1);
    p1 = @(x, y) f1(x,y)*(2*f1(x,y) - 1);
    p2 = @(x, y) f2(x,y)*(2*f2(x,y) - 1);
    p3 = @(x, y) 4*f0(x,y)*f1(x,y);
    p4 = @(x, y) 4*f0(x,y)*f2(x,y);
    p5 = @(x, y) 4*f1(x,y)*f2(x,y);

    approx = fun(Tr(i,1),Tr(i,2))*p0(Tr(i,13),Tr(i,14));
    approx = approx + fun(Tr(i,3),Tr(i,4))*p1(Tr(i,13),Tr(i,14));
    approx = approx + fun(Tr(i,5),Tr(i,6))*p2(Tr(i,13),Tr(i,14));
    approx = approx + fun(Tr(i,7),Tr(i,8))*p3(Tr(i,13),Tr(i,14));
    approx = approx + fun(Tr(i,9),Tr(i,10))*p4(Tr(i,13),Tr(i,14));
    approx = approx + fun(Tr(i,11),Tr(i,12))*p5(Tr(i,13),Tr(i,14));
    
    W(i, 1:6) = [Tr(i,13),Tr(i,14),fun(Tr(i,13),Tr(i,14)),approx,abs(fun(Tr(i,13),Tr(i,14)) - approx),abs((fun(Tr(i,13),Tr(i,14)) - approx) / fun(Tr(i,13),Tr(i,14)))];
end

errmax = max(W(1:end, 5));

end