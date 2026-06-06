clc; clear;
%% =====================================================================
%% ARSITEKTUR FUNGSI INTERNAL ALGORITMA
%% =====================================================================
function [L, U, X] = fungsi_lu_doolittle(A, B)
    n = length(B);
    L = zeros(n,n);
    U = zeros(n,n);

    for i = 1:n
        L(i,i) = 1.0;
        for k = i:n
            U(i,k) = A(i,k) - L(i,1:i-1)*U(1:i-1,k);
        end
        for k = i+1:n
            L(k,i) = (A(k,i) - L(k,1:i-1)*U(1:i-1,i)) / U(i,i);
        end
    end

    % Substitusi Maju LY = B
    Y = zeros(n,1);
    for i = 1:n
        Y(i) = B(i) - L(i,1:i-1)*Y(1:i-1);
    end

    % Substitusi Mundur UX = Y
    X = zeros(n,1);
    for i = n:-1:1
        X(i) = (Y(i) - U(i,i+1:n)*X(i+1:n)) / U(i,i);
    end
end

function [L, X] = fungsi_cholesky(A, B)
    n = length(B);
    L = zeros(n,n);

    for i = 1:n
        for j = 1:i
            s = sum(L(i,1:j-1) .* L(j,1:j-1));
            if i == j
                L(i,j) = sqrt(A(i,i) - s);
            else
                L(i,j) = (A(i,j) - s) / L(j,j);
            end
        end
    end

    % Substitusi Maju LY = B
    Y = zeros(n,1);
    for i = 1:n
        Y(i) = (B(i) - L(i,1:i-1)*Y(1:i-1)) / L(i,i);
    end

    % Substitusi Mundur L^T X = Y
    LT = L';
    X = zeros(n,1);
    for i = n:-1:1
        X(i) = (Y(i) - LT(i,i+1:n)*X(i+1:n)) / LT(i,i);
    end
end

%% =====================================================================
%% STUDI KASUS 1: DEKOMPOSISI LU (METODE DOOLITTLE)
%% =====================================================================
fprintf('------------------------------------------------------------\n');
fprintf('KASUS 1: DEKOMPOSISI LU (Analisis Struktur Rangka)\n');
fprintf('------------------------------------------------------------\n');

A_truss = [4.0, -1.0, -1.0;
          -1.0,  3.0,  0.0;
          -1.0,  0.0,  5.0];
B_beban = [12.0; 10.0; 15.0];

[L, U, X_lu] = fungsi_lu_doolittle(A_truss, B_beban);
disp('Matriks L (Segitiga Bawah):'); disp(L);
disp('Matriks U (Segitiga Atas):');  disp(U);
disp('Solusi Gaya/Defleksi dengan LU:'); disp(X_lu);

%% =====================================================================
%% STUDI KASUS 2: DEKOMPOSISI CHOLESKY
%% =====================================================================
fprintf('------------------------------------------------------------\n');
fprintf('KASUS 2: DEKOMPOSISI CHOLESKY (Matriks FEA Simetris)\n');
fprintf('------------------------------------------------------------\n');

A_simetris = [6.0,  15.0,  55.0;
              15.0, 55.0,  225.0;
              55.0, 225.0, 979.0];
B_gaya = [76.0; 295.0; 1259.0];

[L_cholesky, X_cholesky] = fungsi_cholesky(A_simetris, B_gaya);
disp('Matriks L (Cholesky Lower):'); disp(L_cholesky);
disp('Solusi Perpindahan dengan Cholesky:'); disp(X_cholesky);
