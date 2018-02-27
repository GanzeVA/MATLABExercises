function [ W, wyn ] = ObliczCalke( fun, n )
% Szymon Samuel Zborowski
% Funkcja oblicza podan¹ ca³kê podwójn¹ na obszarze D = D1 - D2, gdzie
% D1 = <-1,1>x<-1,1>, D2: |x|+|y| <= 1 przez podzia³ D na 4n^2 trójk¹tów
% przystaj¹cych i zastosowanie na ka¿dym z nich kwadratury rzêdu 3-go.
% Wejœcie:
%   fun - funkcja dwuargumentowa, któr¹ nale¿y sca³kowaæ
%   n - liczba okreœlaj¹ca liczbê trójk¹tów, na które podzielony zostanie
%       obszar D (4n^2 trójk¹tów)
% Wyjœcie:
%   W - tablica zawieraj¹ca w kolejnych kolumnach: wspó³rzêdne wierzcho³ków
%       trójk¹ta, na którym przeprowadzono interpolacjê (6 kolumn) i obliczon¹
%       na nim ca³kê podwójn¹ z fun
%   wyn - obliczona ca³ka na obszarze D
% Wywo³anie:
%   [ W, wyn ] = ObliczCalke( fun, n );

if (nargin < 2)
    fun = @(x,y) x + 3*y - 1;
    n = 2;
end 

Tr = zeros(4*n*n, 6); %[ A,B,C ]
Kw = zeros(n*n, 10); %[ A,B,C,D,S ]
W = zeros(4*n*n, 7);

for i=1:n
    for j=1:n
        ind = j + ((i-1)*n);
        Kw(ind,1:2) = [-1 + (j-1)*1/n + (i-1)*1/n, (j-1)*1/n - (i-1)*1/n];
        Kw(ind,3:10) = [Kw(ind, 1) + 1/n, Kw(ind, 2) - 1/n, Kw(ind, 1) + 1/n, Kw(ind, 2) + 1/n, Kw(ind, 1) + 2/n, Kw(ind, 2), Kw(ind, 1) + 1/n, Kw(ind, 2)];
        Tr(ind*4 - 3, 1:6) = [Kw(ind, 1:4) Kw(ind, 9:10)];
        Tr(ind*4 - 2, 1:6) = [Kw(ind, 3:4) Kw(ind, 7:10)];
        Tr(ind*4 - 1, 1:6) = [Kw(ind, 1:2) Kw(ind, 5:6) Kw(ind, 9:10)];
        Tr(ind*4, 1:6) = Kw(ind, 5:10);
    end
end

wyn = 0;
for i=1:4*n*n
    J = abs((Tr(i,3)-Tr(i,1))*(Tr(i,6)-Tr(i,2)) - (Tr(i,5)-Tr(i,1))*(Tr(i,4)-Tr(i,2)));
    F = @(a,b) J * fun(Tr(i,1) + (Tr(i,3)-Tr(i,1))*a + (Tr(i,5)-Tr(i,1))*b, Tr(i,2) + (Tr(i,4)-Tr(i,2))*a + (Tr(i,6)-Tr(i,2))*b);
    
    S = 1/6 * (F(1/2,1/2) + F(0,1/2) + F(1/2,0)); 
    
    W(i, 1:7) = [Tr(i,1:6) S];
    wyn = wyn + S;
end

end