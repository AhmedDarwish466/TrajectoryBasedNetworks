function [S,A] = TN_Adjacency(A,eps,varargin) %[S,A,Ipt] =Adjacency(A,eps)
for m = 1 : size(A.X,2)
    D.X = A.X - repmat(A.X(:,m), [1, size(A.X,2)]);
    D.Y = A.Y - repmat(A.Y(:,m), [1, size(A.Y,2)]);
    
    Sx  = ((sqrt(D.X.^2+D.Y.^2))<=eps) & ((sqrt(D.X.^2+D.Y.^2))>0); % Find the trajectories approaching...
    
    if nargin == 3 && strcmpi(varargin{1},'Weighted')
        S(:,m) = (sum(Sx)); % As logical S can hold higher size
    else
        S(:,m) = logical(sum(Sx));
    end
end






