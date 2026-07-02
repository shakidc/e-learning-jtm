clear; clc; close all;

% =========================================================================
% JURUSAN TEKNIK MESIN - UNIVERSITAS MALIKUSSALEH
% Kode Penyelesaian Analisis Regresi Numerik
% =========================================================================

%% KASUS 1: KALIBRASI SENSOR GAYA (LINEAR REGRESSION)
fprintf('====================================\n');
fprintf('KASUS 1: KALIBRASI SENSOR GAYA\n');
fprintf('====================================\n');

x_gaya = [1; 2; 3; 4];
y_tegangan = [2.2; 4.1; 5.9; 8.1];
n1 = length(x_gaya);

% Perhitungan koefisien memakai matriks penurun murni
X1 = [ones(n1, 1), x_gaya];
A1 = X1 \ y_tegangan; % Menyelesaikan dengan least-squares murni

a0 = A1(1);
a1 = A1(2);

fprintf('Persamaan Garis: y = %.3f + %.3f * x\n\n', a0, a1);

% Plot Grafik Kasus 1
figure(1);
plot(x_gaya, y_tegangan, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); hold on;
x_fit = 0:0.1:5;
y_fit = a0 + a1 * x_fit;
plot(x_fit, y_fit, 'b-', 'LineWidth', 2);
grid on;
title('Kalibrasi Load Cell Sensor Gaya');
xlabel('Massa Beban (kg)');
ylabel('Tegangan Output (mV)');
legend('Data Eksperimen', 'Model Linier', 'Location', 'NorthWest');


%% KASUS 2: KORELASI PERPINDAHAN PANAS KONVEKSI (MULTIVARIABLE REGRESSION)
fprintf('====================================\n');
fprintf('KASUS 2: KORELASI EMPIRIS KONVEKSI\n');
fprintf('====================================\n');

% Definisi Data Hasil Uji Lab
Re = [1200; 2500; 5000; 8500; 12000];
Pr = [0.71; 0.71; 1.00; 4.30; 7.00];
Nu = [18.5; 26.8; 42.5; 98.2; 145.0];
n2 = length(Nu);

% Transformasi ke persamaan linier multivariabel
Y_mult = log(Nu);
x1_mult = log(Re);
x2_mult = log(Pr);

% Menyusun Matriks Desain Kompak X
X2 = [ones(n2, 1), x1_mult, x2_mult];

% Menyelesaikan Sistem Persamaan Normal (X^T * X) * A = X^T * Y
A2 = (X2' * X2) \ (X2' * Y_mult);

% Ekstraksi Nilai Parameter Fisik Asli
C_konstanta = exp(A2(1));
m_eksponen = A2(2);
n_eksponen = A2(3);

fprintf('Konstanta C          : %.4f\n', C_konstanta);
fprintf('Eksponen m (Reynolds): %.4f\n', m_eksponen);
fprintf('Eksponen n (Prandtl) : %.4f\n', n_eksponen);
fprintf('Persamaan Empiris: Nu = %.3f * Re^(%.3f) * Pr^(%.3f)\n', C_konstanta, m_eksponen, n_eksponen);

% Menghitung Kualitas Validitas (R^2)
Y_prediksi = X2 * A2;
St = sum((Y_mult - mean(Y_mult)).^2);
Sr = sum((Y_mult - Y_prediksi).^2);
R2 = (St - Sr) / St;
fprintf('Koefisien Determinasi R^2: %.5f\n', R2);

% Visualisasi Perbandingan Prediksi vs Aktual
figure(2);
plot(Nu, exp(Y_prediksi), 'md', 'MarkerFaceColor', 'm', 'MarkerSize', 8); hold on;
plot([0, 160], [0, 160], 'k--'); % Garis ideal 45 derajat
grid on;
axis([0 160 0 160]);
title('Evaluasi Model Konveksi Paksa: Aktual vs Prediksi');
xlabel('Nu Aktual (Eksperimen)');
ylabel('Nu Prediksi (Model Numerik)');
legend('Titik Uji', 'Garis Ideal 1:1', 'Location', 'NorthWest');
