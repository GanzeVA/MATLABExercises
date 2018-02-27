function [ A ] = WylosujMacierz( n )
% Szymon Samuel Zborowski
% Funkcja losuje macierz kwadratow¹ o podanym rozmiarze, która spe³nia
% warunki: jest równa swojej transponacji, jest silnie diagonalnie
% dominuj¹ca i dodatnio okreœlona
% Wejœcie:
%   n - liczba, okreœlaj¹ca rozmiar wylosowanej macierzy
% Wyjœcie:
%   A - wylosowana macierz kwadratowa nxn spe³niaj¹ca warunki: A=A'>0 i 
%   silnie diagonalnie dominuj¹ca
% Wywo³anie:
%   A = WylosujMacierz(n);

if (nargin == 0)
    n = 5;
end

A = rand(n);
for i=1:n
    for j=i:n
        A(j,i) = A(i,j); % macierz równa macierzy transponowanej
    end
    A(i,i) = A(i,i) + sum(A(i,:)); % macierz silnie diagonalnie dominuj¹ca
end

end

