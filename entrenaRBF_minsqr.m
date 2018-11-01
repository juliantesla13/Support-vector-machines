function net = entrenaRBF_minsqr(X,D,spread)
	
  %Crea un centro para cada uno de los patrones de entrada. Luego evalúa
  %la salida Phi de las neuronas y se determinan los pesos de la capa de
  %salida usando LMS.

	%Inicialmente se asumirá que la salida es de 1xp.
	%dsz = size(D);
  sz = size(X);
	net.c = X;
	net.spread = spread;
	phi = zeros(sz(2),sz(2));
	for i = 1:sz(2)
		r = zeros(1,sz(2));
		for k = 1:sz(2)
			r(1,k) = norm(net.c(:,k)-X(:,i));
		end
		phi(i,:) = exp(-(r.^2)/(2*net.spread^2));
	end
  net.w = [0; phi\D']';
end