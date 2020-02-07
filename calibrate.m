function C = calibrate(im, XYZ, uv)
%% TASK 1: CALIBRATE
%
% Function to perform camera calibration
%
% Usage:   K = calibrate(image, XYZ, uv)
%
%   Where:   image - is the image of the calibration target.
%            XYZ - is a N x 3 array of  XYZ coordinates
%                  of the calibration target points. 
%            uv  - is a N x 2 array of the image coordinates
%                  of the calibration target points.
%            K   - is the 3 x 4 camera calibration matrix.
%  The variable N should be an integer greater than or equal to 6.
%
%  This function plots the uv coordinates onto the image of the calibration
%  target. 
%
%  It also projects the XYZ coordinates back into image coordinates using
%  the calibration matrix and plots these points too as 
%  a visual check on the accuracy of the calibration process.
%
%  Lines from the origin to the vanishing points in the X, Y and Z
%  directions are overlaid on the image. 
%
%  The mean squared error between the positions of the uv coordinates 
%  and the projected XYZ coordinates is also reported.
%
%  The function should also report the error in satisfying the 
%  camera calibration matrix constraints.
u = uv(:,1); %get x coordinates of the six points in 2d image.
v = uv(:,2); %get y coordinates of the six points in 2d image.
x = XYZ(:,1); %get x coordinates of the six points in 3d image.
y = XYZ(:,2); %get y coordinates of the six points in 3d image.
z = XYZ(:,3); %get z coordinates of the six points in 3d image.
A = zeros(12,12);
for i=1:6 %identify the caculation matrix. 
A((i-1)*2+1:(i-1)*2+2,1:12) = [0, 0, 0, 0, -x(i), -y(i), -z(i), -1, v(i)*x(i), v(i)*y(i), v(i)*z(i), v(i);
                               x(i), y(i), z(i), 1, 0, 0, 0, 0, -u(i)*x(i), -u(i)*y(i), -u(i)*z(i), -u(i)];
end
[U,S,V]=svd(A); %Orthogonal decomposition, using svd()function to calculate the singular value.
c = V(:,12); %the the last column of singular value matrix is the matrix C.
c =c./c(12); %Normalized, the last element of matrix C is 1.
C = reshape(c,4,3)'; %change the one column to 3x4 matrix.

%projects the XYZ coordinates back into image coordinates by C.
XYZ2 = [XYZ';ones(1,6)]; %add 1 to change to homography coordination.
uv2 = C*XYZ2; %calculate the corresponding 2d corrdinates for 3d corrdinates.
uv2 = uv2(1:2,:)./uv2(3,:);  %Normalized
uv2 = uv2'; %change the homography coordination to 2d coordination.
a = immse(uv,uv2); %calculate the mean squared error.
display(a);

u2 = uv2(:,1);
v2 = uv2(:,2);
figure
imshow(im);hold on;plot(u,v,'r.'); %show the six input points in image.
hold on;plot(u2,v2,'b.'); %show calculated points in image.
hold on; 
%show the 3d coordination in image.
x = line([322 401],[338 355],'Color','red','LineWidth',2); text(411,365,'X','Color','red','FontSize',14);
y = line([322 310],[338 250],'Color','green','LineWidth',2); text(305,240,'Y','Color','green','FontSize',14);
z = line([322 262],[338 380],'Color','yellow','LineWidth',2); text(245,385,'Z','Color','yellow','FontSize',14);

end
