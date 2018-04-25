function [ Aa ] = MPe( d,K )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Id = eye(d);
Cd = dctmtx(d);
Dic = [Id,Cd];

e = [];
for n = 1:1:300
R = normrnd(0, 1/100, K, 1);
An = zeros(2*d, 1);
for i = 1: 1: K
    An(i) = R(i);
end;
An = An(randperm(numel(An)));
Sig = Dic*An;

[~, L] = size(Dic);
	a = zeros(L,1);
	x = Sig(:, 1);
	residual = x;
	while 1,    
		proj = Dic'*residual;
        	[~,pos]=max(abs(proj));
		a(pos)=a(pos)+proj(pos);  
      		residual = residual -proj(pos)*Dic(:,pos);
      	if length(a(a~=0))== K
          break
      end
end;
    A(:,1) = a;
    e(n) = norm(An-A);
end;
    Aa = mean(e(:));
return;
end

