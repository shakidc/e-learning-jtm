clear; clc; close all;

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

fprintf('Data Acuan : (x0 = %d, y0 = %.1f) dan (x1 = %d, y1 = %.1f)\n', x0, y0, x1, y1);
fprintf('Target T   : %d ^\circ C\n', x_target1);
fprintf('Hasil h    : %.2f kJ/kg\n\n', y_pred1);

% Plot Grafik Kasus 1
figure(1);
plot([x0, x1], [y0, y1], 'g-o', 'LineWidth', 2, 'MarkerSize', 8); hold on;
plot(x_target1, y_pred1, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
grid on;
title('Studi Kasus 1: Interpolasi Linear Entalpi Uap');
xlabel('Temperatur (^\circ C)');
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

fprintf('Koefisien Newton : b0 = %.2f, b1 = %.2f, b2 = %.4f\n', b0, b1, b2);
fprintf('Target T         : %d ^\circ C\n', x_target2);
fprintf('Estimasi Viskositas: %.2f mPa.s\n\n', y_pred2);

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
xlabel('Temperatur (^\circ C)');
ylabel('Viskositas Kinematik (mPa.s)');
legend('Kurva Parabola Kuadrat', 'Data Eksperimen', 'Titik Target Estimasi');


%% STUDI KASUS 3: INTERPOLASI POLINOMIAL LAGRANGE (Torsi Mesin Diesel vs RPM)
fprintf('==================================================\n');
fprintf('STUDI KASUS 3: INTERPOLASI LAGRANGE (TORSI MESIN)\n');
fprintf('==================================================\n');

% Representasi Titik Data Dinamometer
x_rpm = [1200; 2000; 2800];
y_torsi = [250; 380; 320];
x_target3 = 1800;

% Perhitungan Fungsi Pembobot Lagrange Orde Dua
L0 = ((x_target3 - x_rpm(2)) * (x_target3 - x_rpm(3))) / ((x_rpm(1) - x_rpm(2)) * (x_rpm(1) - x_rpm(3)));
L1 = ((x_target3 - x_rpm(1)) * (x_target3 - x_rpm(3))) / ((x_rpm(2) - x_rpm(1)) * (x_rpm(2) - x_rpm(3)));
L2 = ((x_target3 - x_rpm(1)) * (x_target3 - x_rpm(2))) / ((x_rpm(3) - x_rpm(1)) * (x_rpm(3) - x_rpm(2)));

% Hitung Prediksi Torsi Akhir
y_pred3 = (L0 * y_torsi(1)) + (L1 * y_torsi(2)) + (L2 * y_torsi(3));

fprintf('Pembobot Lagrange: L0 = %.5f, L1 = %.5f, L2 = %.5f\n', L0, L1, L2);
fprintf('Target Kecepatan : %d RPM\n', x_target3);
fprintf('Estimasi Torsi   : %.4f Nm\n\n', y_pred3);

% Generasi Plot Kurva Kontinu Lagrange
x_kurva3 = 1100:10:2900;
y_kurva3 = zeros(size(x_kurva3));
for idx = 1:length(x_kurva3)
    x_val = x_kurva3(idx);
    l0_c = ((x_val - x_rpm(2)) * (x_val - x_rpm(3))) / ((x_rpm(1) - x_rpm(2)) * (x_rpm(1) - x_rpm(3)));
    l1_c = ((x_val - x_rpm(1)) * (x_val - x_rpm(3))) / ((x_rpm(2) - x_rpm(1)) * (x_rpm(2) - x_rpm(3)));
    l2_c = ((x_val - x_rpm(1)) * (x_val - x_rpm(2))) / ((x_rpm(3) - x_rpm(1)) * (x_rpm(3) - x_rpm(2)));
    y_kurva3(idx) = l0_c*y_torsi(1) + l1_c*y_torsi(2) + l2_c*y_torsi(3);
end

figure(3);
plot(x_kurva3, y_kurva3, 'm-', 'LineWidth', 2); hold on;
plot(x_rpm, y_torsi, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
plot(x_target3, y_pred3, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
grid on;
title('Studi Kasus 3: Polinomial Lagrange Torsi vs RPM');
xlabel('Putaran Mesin (RPM)');   ylabel('Torsi Mesin (Nm)');
legend('Kurva Lagrange Orde 2', 'Data Dinamometer', 'Titik Target 1800 RPM', 'Location', 'South');


%% STUDI KASUS 4: INTERPOLASI NATURAL CUBIC SPLINE (Lintasan Lengan Robot)
fprintf('==================================================\n');
fprintf('STUDI KASUS 4: NATURAL CUBIC SPLINE (LINTASAN ROBOT)\n');
fprintf('==================================================\n');

x_robot = [0; 1; 2];
y_robot = [0; 2; 1];

% Penentuan Solusi Momen Simultan dari Hitungan Aljabar Manual
M0 = 0;
M1 = -4.5;
M2 = 0;
M = [M0; M1; M2];

fprintf('Nilai Solusi Momen Kelengkungan Simpul:\n');
fprintf('M0 = %.1f | M1 = %.1f | M2 = %.1f\n', M(1), M(2), M(3));
fprintf('Status Sambungan : Kontinu Kontrol Orde 2 (Mulus)\n\n');

% Generasi Plot Kontinu Spline Kubik
x_kurva4 = 0:0.02:2;
y_kurva4 = zeros(size(x_kurva4));

for idx = 1:length(x_kurva4)
    x = x_kurva4(idx);
    if x <= 1
        % Evaluasi S0(x) pada interval [0, 1] dengan h0 = 1
        y_kurva4(idx) = (M(1)/6)*(1-x)^3 + (M(2)/6)*(x-0)^3 + (y_robot(1) - M(1)/6)*(1-x) + (y_robot(2) - M(2)/6)*(x-0);
    else
        % Evaluasi S1(x) pada interval [1, 2] dengan h1 = 1
        y_kurva4(idx) = (M(2)/6)*(2-x)^3 + (M(3)/6)*(x-1)^3 + (y_robot(2) - M(2)/6)*(2-x) + (y_robot(3) - M(3)/6)*(x-1);
    end
end

figure(4);
plot(x_kurva4, y_kurva4, 'g-', 'LineWidth', 2); hold on;
plot(x_robot, y_robot, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
grid on;
title('Studi Kasus 4: Trajectory Planning Spline Kubik Alami');
xlabel('Posisi Horizontal Lengan (X)');
ylabel('Posisi Vertikal Lengan (Y)');
legend('Lintasan Halus Gerak Robot', 'Simpul Koordinat Target', 'Location', 'South');
