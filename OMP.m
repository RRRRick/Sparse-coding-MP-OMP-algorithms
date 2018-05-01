function [ Aa ] = OMP( Dic, k )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
e = [];
for n = 1:1:100
R = normrnd(0, 1/100, k, 1);
An = zeros(200, 1);
for i = 1: 1: k
    An(i) = R(i);
end;
An = An(randperm(numel(An)));
Sig = Dic*An;

[~, K] = size(Dic);

	a = [];
	x = X(:, 1);
	residual = x;
	index = zeros(K, 1);
	for j = 1: 1: K,
		proj = Dic'*residual;
		pos = find(abs(proj) == max(abs(proj)));
		pos = pos(1);
		index(j) = pos;
		a = pinv(D(:, index(1:j)))*x;
		residual = x - Dic(:,index(1:j))*a;
        if norm(residual)<=10^(-12)
            break
        end
	end;
	temp = zeros(K,1);
    index(index==0)=[];
	temp(index) = a;
	A(:,1) = temp;
end;
    e(n) = norm(An-A);
end;
    Aa = mean(e(:));
return;
end

