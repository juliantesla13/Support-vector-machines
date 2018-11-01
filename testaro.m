close all;
clear all;
clc;

X = [0 1 0 1; 0 0 1 1];
D = [0 1 1 1];
%%
spread = 0.3;
gamma = 1e5;
%%
net1 = entrenaRBF_minsqr(X,D,spread);
%net2 = entrenarSVMcote(X,D,gamma,spread);
net3 = entrenaSVM(X,D,spread,gamma);
%%
gamma = 100;
net4 = entrenaSVM_gauss(X,D,spread,gamma);
Y4 = operaSVM_lin(net4,X);
%%
gamma = 100;
net4 = entrenaSVM_lin(X,D,gamma);
Y4 = operaSVM_lin(net4,X);
%%
gamma = 1000;
net5 = entrenaSVM_pol(X,D,5,gamma);
Y5 = operaSVM_tanh(net5,X);
%%
gamma = 1000;
net6 = entrenaSVM_tanh(X,D,gamma);
Y6 = operaSVM_tanh(net6,X);