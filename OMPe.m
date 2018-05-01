function [ Aa ] = OMPe( d, K )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Id = eye(d);
Cd = dctmtx(d);
Dic = [Id,Cd];

e = [];
R = normrnd(0, 1/d, K, 1);
An = zeros(2*d, 1);
for i = 1: 1: K
    An(i) = R(i);
end
An = An(randperm(numel(An)));
Sig = Dic*An;

for n = 1:1:30
[~, P] = size(Sig);
[~, L] = size(Dic);
for k = 1: 1: P,
	a = [];
	x = Sig(:, k);
	residual = x;
	index = zeros(K, 1);
	for j = 1: 1: K,
		proj = Dic'*residual;
		pos = find(abs(proj) == max(abs(proj)));
		pos = pos(1);
		index(j) = pos;
		a = pinv(Dic(:, index(1:j)))*x;
		residual = x - Dic(:,index(1:j))*a;
	end;
	temp = zeros(L,1);
	temp(index) = a;
	A(:,k) = sparse(temp);
end;
    e(n) = norm(An-A);
end;
    Aa = mean(e(:));
return;
end

