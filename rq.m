function [R,Q] = rq(A)
%% RQ factorisation

[q,r]=qr(A');       % Matlab has QR decomposition but not RQ decomposition  
                    % with Q: orthonormal and R: upper triangle. Apply QR
                    % for the A-transpose, then A = (qr)^T = r^T*q^T = RQ
R=r';
Q=q';
end