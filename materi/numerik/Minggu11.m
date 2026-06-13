clc; clear;
%% =====================================================================
%% BLOK ALGORITMA UTAMA
%% =====================================================================
function [X, it] = fungsi_jacobi(A, B, X0, tol, max_iter)
    n = length(B);
    X = X0;
    X_baru = zeros(n,1);

    for it = 1:max_iter
        for i = 1:n
            s = A(i,1:n)*X - A(i,i)*X(i); % Menghitung j != i dengan teknik vektorisasi
            X_baru(i) = (B(i) - s) / A(i,i);
        end

        if max(abs(X_baru - X)) < tol
            X = X_baru;
            return;
        end
        X = X_baru;
    end
end

function [X, it] = fungsi_gauss_seidel(A, B, X0, tol, max_iter)
    n = length(B);
    X = X0;

    for it = 1:max_iter
        X_lama = X;
        for i = 1:n
            % Pada suku perkalian berikut, indeks yang telah dilewati otomatis memakai data baru
            s = A(i,1:n)*X - A(i,i)*X(i);
            X(i) = (B(i) - s) / A(i,i);
        end

        if max(abs(X - X_lama)) < tol
            return;
        end
    end
end

%% =====================================================================
%% STUDI KASUS KULIAH: ANALISIS PERBANDINGAN ITERASI TERMAL
%% =====================================================================
fprintf('------------------------------------------------------------\n');
fprintf('PERBANDINGAN METODE ITERASI PADA MATRIKS SPARSE DI TEKNIK MESIN\n');
fprintf('------------------------------------------------------------\n');

% Matriks Representasi Node Distribusi Panas (Beda Hingga)
A_termal = [4.0, -1.0,  0.0;
           -1.0,  4.0, -1.0;
            0.0, -1.0,  4.0];
B_suhu = [100.0; 50.0; 100.0];

X_nol = [0.0; 0.0; 0.0]; % Tebakan awal elemen vektor
Toleransi = 1e-5;

% Eksekusi Skema Jacobi
[X_jacobi, it_j] = fungsi_jacobi(A_termal, B_suhu, X_nol, Toleransi, 100);
fprintf('Solusi Jacobi: [%s] | Iterasi: %d\n', num2str(X_jacobi'), it_j);

% Eksekusi Skema Gauss-Seidel
[X_gs, it_gs] = fungsi_gauss_seidel(A_termal, B_suhu, X_nol, Toleransi, 100);
fprintf('Solusi Gauss-Seidel: [%s] | Iterasi: %d\n', num2str(X_gs'), it_gs);
