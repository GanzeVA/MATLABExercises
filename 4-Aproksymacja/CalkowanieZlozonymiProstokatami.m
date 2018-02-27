function [ S ] = CalkowanieZlozonymiProstokatami( f, a, b, n )
% Funkcja ca�kuje metod� z�o�onych prostok�t�w podan� funkcj� na przedziale
% [a, b], dziel�c go na n podprzedzia��w.
% Wej�cie:
%   f - funkcja jednoargumentowa do sca�kowania
%   [a, b] - przedzia� ca�kowania
%   n - liczba okre�laj�ca na ile podprzedzia��w podzieli� przedzia� [a, b]
% Wyj�cie:
%   S - wynik ca�kowania
% Wywo�anie:
%   S = CalkowanieZlozonymiProstokatami( f, a, b, n )

h = (b-a)/n;
x = linspace(a,b,n+1);
S = 0;
for i=1:n
    S = S + f((x(i)+(x(i+1)))/2);
end
S = S*h;

end

