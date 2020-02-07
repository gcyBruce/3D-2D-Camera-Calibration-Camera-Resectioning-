# 3D-2D-Camera-Calibration-Camera-Resectioning-

(Acknowledgement: This task material is courtesy of Professor. Du Huynh of UWA).
Camera calibration involves finding the geometric relationship between 3D world coordinates and their 2D projected positions in the image.

Four images, stereo2012a.jpg, stereo2012b.jpg, stereo2012c.jpg, and stereo2012d.jpg, are given for this C-Lab-4. These images are different views of a calibration target and some objects. For example, the diagram below is stereo2012a.jpg with some text superimposed onto it:

On the calibration target there are 3 mutually orthogonal faces. The points marked on each face form a regular grid. They are all 7cm apart.

Use the suggested right-hand coordinate system shown in the diagram above and choose a sufficient number of calibration points on the calibration target.
Store the XYZ coordinates in a file so that you can load the data into Matlab (using the load function) and use them again and again. Note that each image can be calibrated independently. So you can choose different calibration points to calibrate each image. Neither do the numbers of calibration points need to be the same for your chosen images.
The uv coordinates can be obtained using the MATLAB function ginput. If one invokes ginput as follows:
>> uv = ginput(12) % e.g., to digitise 12 points in the image
and digitises a series of points by clicking with the left mouse button, then uv will be a matrix containing the column and row coordinates of the points that you digitised.
After the above operation, the variable uv should be a 12 × 2 matrix, each row of which should contain the coordinates of one image point.
You need to ensure that, for each image, the numbers of 3D and 2D calibration points are the same. Thus, if your uv variable is a 12 × 2 matrix, then your XYZ variable should be a 12 × 3 matrix. Also, the points should appear in the same order in the two matrices.
Use the DLT algorithm to solve the unknown camera calibration matrix of size 3x4. (Refer to textbook, page 284, Section 6.2, or online resource to set up the DLT linear matrix equation that needs to be solved. )
You will end up setting up an equation of the form:
Aq=b
where:
A is a 2N × 11 matrix of constraint coefficients (in this case, N=12).
q is an 11 element column vector of calibration matrix coefficients to be solved, and
b is a 2N column vector of the image coordinates of the target points. This is the vector that is composed of the coordinates stored in the uv matrix.
This over-constrained set of equations can be solved (in a least squares sense) in Matlab using the expression
q = A \ b;
In this case where the matrix equation is over-constrained Matlab will perform a QR decomposition on the matrix A in order to solve the least squares solution. This technique overcomes many of the numerical problems that arise if one attempts to solve least squares problems via classical equations. (do a help on mldivide).
