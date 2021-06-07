function [cci] = TN_Clust_Coef(S) 

n = length(S);
cci = zeros(1,n);
for k = 1:n
    neighbours = [find(S(:,k))]';
    a = length(neighbours);
    if a == 0; cci(k) = NaN; continue; end
    if a < 2, continue; end
    E = 0;
    for ks = 1:a
        k1 = neighbours(ks);
        for k2 = neighbours(ks+1:a)
            if S(k1,k2)               % For symmetric matrix
             % S(k1,k2) || S(k2,k1)   % Otherwise
                E = E + 1;            % Count triangles
            end
        end
    end
    cci(k) =  2*E / (a * (a-1));
end