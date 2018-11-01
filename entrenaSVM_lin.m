function net = entrenaSVM_lin(X,D,gamma)
  
  sz = size(X);
	net.c = X;
  msz = size(net.c);
	omega = zeros(sz(2),sz(2));
  for i = 1:sz(2)
		%r = zeros(1,msz(2));
		%for k = 1:msz(2)
    omega(i,:) = sum(net.c.*repmat(X(:,i),1,msz(2)));
		%omega(i,:) = exp(-abs(sum((net.c-repmat(X(:,i),1,sz(2))).^2))/(2*net.spread^2));
		%end
		%phi(i,:) = [1 exp(-(r.^2)/(2*net.spread^2))];
		%y(1,i) = net.w*phi.';
  end
  aomega = omega+(1/gamma)*eye(sz(2));
  M = [0 ones(1,sz(2)); ones(sz(2),1) aomega];
  net.w = (M\[0; D'])';
end