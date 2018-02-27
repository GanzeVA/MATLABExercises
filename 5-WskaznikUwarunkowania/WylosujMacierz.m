function [ A ] = WylosujMacierz( n )
% Szymon Samuel Zborowski
% Funkcja losuje macierz kwadratow� o podanym rozmiarze, kt�ra spe�nia
% warunki: jest r�wna swojej transponacji, jest silnie diagonalnie
% dominuj�ca i dodatnio okre�lona
% Wej�cie:
%   n - liczba, okre�laj�ca rozmiar wylosowanej macierzy
% Wyj�cie:
%   A - wylosowana macierz kwadratowa nxn spe�niaj�ca warunki: A=A'>0 i 
%   silnie diagonalnie dominuj�ca
% Wywo�anie:
%   A = WylosujMacierz(n);

if (nargin == 0)
    n = 5;
end

A = rand(n);
for i=1:n
    for j=i:n
        A(j,i) = A(i,j); % macierz r�wna macierzy transponowanej
    end
    A(i,i) = A(i,i) + sum(A(i,:)); % macierz silnie diagonalnie dominuj�ca
end

end

