function [ S ] = CalkowanieZlozonymiProstokatami( f, a, b, n )
% Funkcja ca³kuje metod¹ z³o¿onych prostok¹tów podan¹ funkcjê na przedziale
% [a, b], dziel¹c go na n podprzedzia³ów.
% Wejœcie:
%   f - funkcja jednoargumentowa do sca³kowania
%   [a, b] - przedzia³ ca³kowania
%   n - liczba okreœlaj¹ca na ile podprzedzia³ów podzieliæ przedzia³ [a, b]
% Wyjœcie:
%   S - wynik ca³kowania
% Wywo³anie:
%   S = CalkowanieZlozonymiProstokatami( f, a, b, n )

h = (b-a)/n;
x = linspace(a,b,n+1);
S = 0;
for i=1:n
    S = S + f((x(i)+(x(i+1)))/2);
end
S = S*h;

end

