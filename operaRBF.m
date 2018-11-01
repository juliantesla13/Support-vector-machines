function y = operaRBF(net,X)
	
    %Opera una net RBF ante una entrada X (cada columna es un patrón de
    %entrada). El resultado es un vector (cada y es escalar).

	sz = size(X);
	msz = size(net.c);
	
	y = zeros(1,sz(2));
	for i = 1:sz(2)
		r = zeros(1,msz(2));
		%for k = 1:msz(2)
			r = sqrt(sum((net.c-repmat(X(:,i),1,msz(2))).^2));
		%end
		phi = [1 exp(-(r.^2)/(2*net.spread^2))];
		y(1,i) = net.w*phi.';
	end
end