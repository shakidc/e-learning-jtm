% =====================================================================
% INSIALISASI DATA (Model Fisik Braket Mesin)
% =====================================================================
clear; clc;

% Mendefinisikan Matriks Koefisien A (gunakan titik koma untuk ganti baris)
A = [2, 1, 1; 
     1, 3, 2; 
     3, 1, 2];

% Mendefinisikan Vektor Konstanta B
B = [12; 
     17; 
     15];

disp('Matriks Koefisien A:'); disp(A);
disp('Vektor Beban B:'); disp(B);
disp('--------------------------------------------------');

% =====================================================================
% METODE 1: MATRIKS INVERS (X = A^-1 * B)
% =====================================================================
disp('>>> MEMULAI METODE MATRIKS INVERS <<<');

% Menghitung nilai kebalikan/invers matriks A
A_invers = inv(A);
disp('1. Hasil dari Invers Matriks A:'); disp(A_invers);

% Mengalikan matriks invers dengan vektor B
X_invers = A_invers * B;

disp('2. Solusi Gaya (F1, F2, F3) dengan Matriks Invers:');
fprintf('   F1 = %.1f kN\n', X_invers(1));
fprintf('   F2 = %.1f kN\n', X_invers(2));
fprintf('   F3 = %.1f kN\n', X_invers(3));
disp('--------------------------------------------------');

% =====================================================================
% METODE 2: ELIMINASI GAUSS-JORDAN (Menggunakan Fungsi 'rref')
% =====================================================================
disp('>>> MEMULAI METODE GAUSS-JORDAN <<<');

% Membuat Augmented Matrix [A, B] dengan menggabungkannya secara horizontal
augmented_awal = [A, B];
disp('1. Augmented Matrix Awal [A|B]:'); disp(augmented_awal);

% Fungsi 'rref' otomatis melakukan OBE Gauss-Jordan hingga menjadi matriks identitas
augmented_akhir = rref(augmented_awal);
disp('2. Augmented Matrix Akhir setelah OBE [I|X]:'); disp(augmented_akhir);

% Mengambil seluruh baris pada kolom ke-4 (kolom terakhir) sebagai solusi
X_gauss_jordan = augmented_akhir(:, 4);

disp('3. Solusi Gaya (F1, F2, F3) dengan Gauss-Jordan:');
fprintf('   F1 = %.1f kN\n', X_gauss_jordan(1));
fprintf('   F2 = %.1f kN\n', X_gauss_jordan(2));
fprintf('   F3 = %.1f kN\n', X_gauss_jordan(3));