function [CSC_fullset,EIGVAL,L] = Spectral_Adjacency(DEG,S,varargin)

DD = diag(DEG);
L = DD - S;
LN = DD^(-0.5)*L*DD^(-0.5);
if nargin == 3 && strcmpi(varargin{1},'Normalized')
    [eigvec, eigval] = eig(LN,DD); % Generalized Eigen
    EIGVAL = sort(diag(real(eigval)),'ascend');
    [sortedeigs, lambdaindex] = sort(diag(eigval),'ascend');
    CSC_fullset = eigvec(:,lambdaindex);
else
    [eigvec, eigval] = eig(L,DD); % Generalized Eigen
    EIGVAL = sort(diag(real(eigval)),'ascend');
    [sortedeigs, lambdaindex] = sort(diag(eigval),'ascend');
    CSC_fullset = eigvec(:,lambdaindex);
end