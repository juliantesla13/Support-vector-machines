function y = operaSVM_lin(net,X)
  
	sz = size(X);
	msz = size(net.c);
  
  y = zeros(1,sz(2));
  for i = 1:sz(2)
    y(1,i) = sum(net.w(1,2:end).*sum(net.c.*repmat(X(:,i),1,msz(2))))+net.w(1,1);
  end
end