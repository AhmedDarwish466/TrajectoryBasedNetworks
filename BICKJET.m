% This is the Bickley jet from K. Padberg-Ghele and S. Schneide 2017
% clear all, close all, clc

% Constants
function [VEC,t] = BICKJET(varargin)
% Parameters
A  = [.0075; .15; .3];
L  = 1.77;
U0 = 5.414;
C  = [.1446*U0; .205*U0; .461*U0];
re = 6.371;
K  = [2/re; 4/re; 6/re];
Sigma = K.*C;

% Physical and Temporal domain paramaters
x = [0:0.1:20];
y = [-3.5:0.1:3.5];

if nargin >= 2 % If the user specified starting and ending time, t1 and t2
    t = linspace(varargin{1},varargin{2},600);
else
    t = linspace(10,30,500); % Default time interval t1=10, t2=30
end

[X,Y] = meshgrid(x,y);

%%
for k = 1 :length(t)
    %     VEC{k,1}.U = U0*tanh(Y/L) + 2*U0.*tanh(Y/L).*(sech(Y/L)).^2.*(A(1).*cos(K(1).*X-Sigma(1)*t(k))+A(2).*cos(K(2).*X-Sigma(2)*t(k))+A(3).*cos(K(3).*X-Sigma(1)*t(k)));
    VEC{k,1}.U = U0*(sech(Y/L)).^2.*(1 + 2.*tanh(Y/L).*((A(1)*cos(K(1)*X-Sigma(1)*t(k)))+(A(2)*cos(K(2)*X-Sigma(2)*t(k)))+(A(3)*cos(K(3)*X-Sigma(3)*t(k)))));
    VEC{k,1}.V = -U0*L.*(sech(Y/L)).^2.*((A(1)*K(1).*sin(K(1)*X-Sigma(1)*t(k)))+(A(2)*K(2).*sin(K(2)*X-Sigma(2)*t(k)))+(A(3)*K(3).*sin(K(3)*X-Sigma(3)*t(k))));
    VEC{k}.X = X ;
    VEC{k}.Y = Y ;
    VEC{k}.C = ones(size(X,1),size(X,2));
end

