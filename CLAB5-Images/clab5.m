% CLAB5 


%   
I = imread('stereo2012a.jpg');

imshow(I);
display('click mouse for 6 features...')
uv = ginput(6);    % Graphical user interface to get 12 points
display(uv);
XYZ = [7, 7, 0;
       14, 14, 0;
       7, 0, 7;
       14, 0, 14;
       0, 7, 7;
       0, 14, 14];

C = calibrate(I, XYZ, uv);
[K, R, t] = vgg_KR_from_P(C);


