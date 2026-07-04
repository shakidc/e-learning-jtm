clear; clc; close all;

% =========================================================================
% JURUSAN TEKNIK MESIN - UNIVERSITAS MALIKUSSALEH
% Kode Komputasi: Praktikum Metode Interpolasi Linear & Kuadrat
% =========================================================================

%% STUDI KASUS 1: INTERPOLASI LINEAR (Tabel Uap Termodinamika)
fprintf('==================================================\n');
fprintf('STUDI KASUS 1: INTERPOLASI LINEAR (STEAM TABLE)\n');
fprintf('==================================================\n');

% Definisi data input
x0 = 100; y0 = 2675.5;
x1 = 150; y1 = 2693.1;
x_target1 = 120;

% Perhitungan menggunakan rumus eksplisit
y_pred1 = y0 + ((y1 - y0) / (x1 - x0)) * (x_target1 - x0);

fprintf('Estimasi entalpi pada T = %d C adalah h = %.2f kJ/kg\n\n', x_target1, y_pred1);

% Plot Grafik Kasus 1
figure(1);
plot([x0, x1], [y0, y1], 'g-o', 'LineWidth', 2, 'MarkerSize', 8); hold on;
plot(x_target1, y_pred1, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
grid on;
title('Studi Kasus 1: Interpolasi Linear Entalpi Uap');
xlabel('Temperatur (^oC)');
ylabel('Entalpi Spesifik (kJ/kg)');
legend('Garis Interpolasi', 'Titik Target Estimasi', 'Location', 'NorthWest');


%% STUDI KASUS 2: INTERPOLASI KUADRAT (Viskositas Oli Mesin)
fprintf('==================================================\n');
fprintf('STUDI KASUS 2: INTERPOLASI KUADRAT (VISKOSITAS OLI)\n');
fprintf('==================================================\n');

% Definisi vektor data (3 titik)
x_oli = [20; 40; 60];
y_oli = [200; 70; 30];
x_target2 = 30;

% Mencari koefisien beda terbagi Newton Orde 2
b0 = y_oli(1);
b1 = (y_oli(2) - y_oli(1)) / (x_oli(2) - x_oli(1));

gradien_kanan = (y_oli(3) - y_oli(2)) / (x_oli(3) - x_oli(2));
b2 = (gradien_kanan - b1) / (x_oli(3) - x_oli(1));

% Hitung nilai taksiran pada titik target
y_pred2 = b0 + b1*(x_target2 - x_oli(1)) + b2*(x_target2 - x_oli(1))*(x_target2 - x_oli(2));

fprintf('Koefisien Newton: b0 = %.2f, b1 = %.2f, b2 = %.4f\n', b0, b1, b2);
fprintf('Estimasi Viskositas pada T = %d C adalah = %.2f mPa.s\n', x_target2, y_pred2);

% Generasi kurva mulus untuk representasi fungsi parabola kuadratik
x_kurva = 15:0.5:65;
y_kurva = b0 + b1.*(x_kurva - x_oli(1)) + b2.*(x_kurva - x_oli(1)).*(x_kurva - x_oli(2));

% Plot Grafik Kasus 2
figure(2);
plot(x_kurva, y_kurva, 'b-', 'LineWidth', 2); hold on;
plot(x_oli, y_oli, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
plot(x_target2, y_pred2, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
grid on;
title('Studi Kasus 2: Interpolasi Kuadrat Viskositas Oli SAE-40');
xlabel('Temperatur (^oC)');
ylabel('Viskositas Kinematik (mPa.s)');
legend('Kurva Parabola Kuadrat', 'Data Eksperimen', 'Titik Target Estimasi');