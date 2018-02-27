function [ X, wit ] = OdwracanieMacierzySOR( A, w, it, tol )
% Szymon Samuel Zborowski
% Funkcja odwraca macierz metod� iteracji prostej SOR przez rozwi�zywanie
% uk�ad�w r�wna� postaci AX = I (gdzie I - macierz jednostkowa, A - macierz
% rozrzedzona).
% Wej�cie:
%   A - macierz rozrzedzona, kt�ra zostanie odwr�cona
%   w - liczba, parametr relaksacji potrzebny do metody SOR
%   it - liczba okre�laj�ca maksymaln� liczb� iteracji metody SOR
%   tol - liczba b�d�ca warunkiem stopu algorytmu (je�li b��d mniejszy)
% Wyj�cie:
%   X - macierz odwrotna do podanej na wej�ciu macierzy rozrzedzonej A
%   wit - liczba wykonanych iteracji (je�li -1 to odwr�cenie nieudane)
% Wywo�anie:
%   [X, wit] = OdwracanieMacierzySOR(A, w, it);

if (nargin == 0)
    A = [1 0 0 1 0;0 2 3 0 0;1 3 -5 0 0;0 0 0 -20 35;-1 -5 0 0 70]; %Przyk�ad a)
    %A = eye(9) * 9.7; %Przyk�ad b)
    %A = pascal(5); %Przyk�ad c)
    %A = eye(100); %Przyk�ad d)
end
if (nargin < 3)
    w = 0.8;
end
if (nargin < 4)
    it = 1000;
end
if (nargin < 5)
    tol = 1e-5;
end

n = size(A,1); %rozmiar macierzy A
X = ones(n);
I = eye(n);

iz = 0; %liczba niezerowych element�w macierzy A

%Przygotowanie macierzy pomocniczej AR zawieraj�cej niezerowe elementy
%macierzy rozrzedzonej A
%AR(1,:) - wiersz, AR(2,:) - kolumna, AR(3,:) - warto��
AR = zeros(3,n);
for i=1:n
    for j=1:n
        if (A(i,j) ~= 0)
            iz = iz+1;
            AR(1,iz) = i;
            AR(2,iz) = j;
            AR(3,iz) = A(i,j);
        end
    end
end
AR = AR(:,1:iz);
inv(A)
%Rozwi�zanie metod� iteracyjn� SOR uk�ad�w r�wna� AX=I
for k=1:it
    Xold = X;
    for j=1:n
        for i=1:n
            X(i,j) = X(i,j) + w./A(i,i) .* (I(i,j) - AR(3,AR(1,:)==i)*X(AR(2,AR(1,:)==i),j));
        end
    end
    err = norm(X - Xold) / norm(X);
    if err < tol
        wit = k;
        
        return;
    end
end

wit = -1;
X = NaN;
end

