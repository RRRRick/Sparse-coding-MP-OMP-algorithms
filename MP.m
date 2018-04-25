function Aa = MP( Dic,K )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
e = [];
for n = 1:1:300
R = normrnd(0, 1/100, K, 1);
An = zeros(200, 1);
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
      	if norm(residual)<=10^(-12)
          break
      end
end;
    A(:,1) = a;
    e(n) = norm(An-A);
end;
    Aa = mean(e(:));
return;
end

