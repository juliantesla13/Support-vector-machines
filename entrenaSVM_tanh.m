function net = entrenaSVM_tanh(X,D,gamma)
  
  sz = size(X);
	net.c = X;
  msz = size(net.c);
	omega = zeros(sz(2),sz(2));
  for i = 1:sz(2)
    omega(i,:) = tanh(sum(net.c.*repmat(X(:,i),1,msz(2))));
  end
  aomega = omega+(1/gamma)*eye(sz(2));
  M = [0 ones(1,sz(2)); ones(sz(2),1) aomega];
  net.w = (M\[0; D'])';
end