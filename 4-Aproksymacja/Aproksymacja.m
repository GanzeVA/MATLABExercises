function [ W, err ] = Aproksymacja( fun, a, b, n, m, k )
% Szymon Samuel Zborowski
% Funkcja dokonuje aproksymacji �redniokwadratowej ci�g�ej w przestrzeni
% funkcji sklejanych S1(delta_n,0). Ca�kuje za pomoc� z�o�onej formu�y
% prostok�t�w z punktem �rodkowym. Tablicuje funkcj�, przybli�enie i b��d w
% m punktach oraz oblicza b��d �redniokwadratowy w tych punktach.
% Wej�cie:
%   fun - funkcja jednoargumentowa do aproksymacji
%   [a, b] - odcinek okre�laj�cy przestrze� aproksymacji
%   n - liczba okre�laj�ca na ile r�wnych cz�ci podzieli� odcinek [a, b]
%   m - liczba okre�laj�ca ile punkt�w tablicowa�
%   k - liczba okre�laj�ca na ile przedzia��w dzieli� obszar przy
%   ca�kowaniu
% Wyj�cie:
%   W - tablica zawieraj�ca w kolejnych kolumnach: wsp�rz�dne punktu,
%   funkcj� w danym punkcie, przybli�enie w danym punkcie, b��d w danym
%   punkcie
%   err - b��d �redniokwadratowy w tych punktach
% Wywo�anie:
%   W = Aproksymacja( fun, a, b, n, m, k )

if (nargin < 5)
    fun = @(x) x;
    a = 0;
    b = 1;
    n = 5;
    m = 10;
    k = 1000;
end 

W = zeros(m, 4);
err = 0;
h = (b-a)/n;
delta = linspace(a,b,n+1);
alfa = zeros(1, n+1);

G(1:n+1,1:n+1) = 0;
for i=1:n+1
    G(i,i) = 4;
    if ( i ~= n+1); G(i,i+1) = 1; end
    if ( i ~= 1); G(i,i-1) = 1; end
end
G(1,1) = 2;
G(n+1,n+1) = 2;
G = (h/6) * G;

F(1)   = CalkowanieZlozonymiProstokatami(@(x) ((delta(2) - x)/(delta(2) - delta(1)))*fun(x), delta(1), delta(2), k);
F(n+1) = CalkowanieZlozonymiProstokatami(@(x) ((x - delta(n))/(delta(n+1) - delta(n)))*fun(x), delta(n), delta(n+1), k);
for i=2:n
    F(i) = CalkowanieZlozonymiProstokatami(@(x) ((x - delta(i-1))/(delta(i) - delta(i-1)))*fun(x), delta(i-1), delta(i), k) + CalkowanieZlozonymiProstokatami(@(x) ((delta(i+1) - x)/(delta(i+1) - delta(i)))*fun(x),   delta(i), delta(i+1), k);
end

alfa = G \ F';

delta2 = linspace(a,b,m+1);
for i = 1:m
    tmp = floor((delta2(i) - a) / h) + 1;
    W(i,1) = delta2(i);
    W(i,2) = fun(delta2(i));
    lewa = alfa(tmp) * (delta(tmp+1) - (delta2(i)))/((delta(tmp+1) - delta(tmp)));
    prawa = alfa(tmp+1) * ((delta2(i) - delta(tmp))/(delta(tmp+1) - delta(tmp)));
    W(i,3) = lewa + prawa;
    W(i,4) = abs(W(i,2) - W(i,3));
    err = err + W(i,4).^2;    
end

err = err / m;
end