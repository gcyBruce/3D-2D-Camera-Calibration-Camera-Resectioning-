function H = homography(u2Trans, v2Trans, uBase, vBase)
%% TASK 2: 
% Computes the homography H applying the Direct Linear Transformation
% The transformation is such that
% Hp = p' 
% H*(uBase, vBase, 1)'=(u2Trans , v2Trans, 1)' %
% CHAOYUN GONG, 22/Apr/2018
A = zeros(12,9); 
for i=1:6 %identify the caculation matrix. 
A((i-1)*2+1:(i-1)*2+2,1:9) = [0, 0, 0, -uBase(i), -vBase(i), -1, v2Trans(i)*uBase(i), v2Trans(i)*vBase(i), v2Trans(i);
                              uBase(i), vBase(i), 1, 0, 0, 0, -u2Trans(i)*uBase(i), -u2Trans(i)*vBase(i), -u2Trans(i)];
end
 
[U,S,V]=svd(A); %Orthogonal decomposition, using svd()function to calculate the singular value.
h= V(:,9); %the the last column of singular value matrix is the matrix H.
h=h./h(9); %Normalized, the last element of matrix H is 1.
H= reshape(h,3,3)'; %change the one column to 3x3 matrix.



end