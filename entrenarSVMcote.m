function [red]=entrenarSVMcote(X,D,gama,ancho)

%D = [0 1 1 1];   %or
sz_x = size(X);
for k=1 : sz_x(2)
   for j=1 : sz_x(2)
       omega(k,j) = exp(-(norm(X(:,k)-X(:,j)))^2/(2*ancho^2));
   end
end
 
%gama = 100;
%omega=[1 .13 .13 .059; .13 1 .059 .13;.13 .059 1 .13;.059 .13 .13 1];
aux = omega + (1/gama)*eye(size(omega));
M = [0 ones(1,4);ones(4,1) aux];

red.spread = ancho;
red.c = X;
red.w = (inv(M)*[0;D'])';