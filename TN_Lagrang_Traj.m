% To advect a defined grid inside the instantenous velocity field and to
% generate the Lagrangian trajectory
function [A,I,VECRF,nx,ny] =TN_Lagrang_Traj(VEC,RF,t,FlowType,eps)


x = [VEC{1}.X(1):eps:VEC{1}.X(end)];
y = [-3:eps:3];

[P.X,P.Y] = meshgrid(x,y);
VECRF.C = logical(interp2(VEC{1}.X, VEC{1}.Y, double(VEC{1}.C), P.X, P.Y));
VECRF.X = interp2(VEC{1}.X, VEC{1}.Y, VEC{1}.X, P.X, P.Y);
VECRF.Y = interp2(VEC{1}.X, VEC{1}.Y, VEC{1}.Y, P.X, P.Y);
I = find(VECRF.C ==1);
k = sum(VECRF.C,'all');
count =1;
while count <= k
    G.X(count) = VECRF.X(I(count));
    G.Y(count) = VECRF.Y(I(count));
    count = count+1;
end
nx = size(VECRF.X, 2);
ny = size(VECRF.Y, 1);
A = PP_AdvectPoints(G, VEC, t(2)-t(1),'singlestep',FlowType);

