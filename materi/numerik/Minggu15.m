clear; clc;

% =====================================================================
# STUDI KASUS 1: Estimasi Kecepatan Aktuator Hidrolik (Selisih Maju)
% =====================================================================
fprintf('=== STUDI KASUS 1 ===\n');
t_sk1 = [0.2, 0.3, 0.4];
x_sk1 = [0.050, 0.082, 0.120];
h_sk1 = t_sk1(2) - t_sk1(1);

% Evaluasi pada t = 0.2 (indeks 1 di Octave)
% Titik maju berada pada indeks 2
v_02 = (x_sk1(2) - x_sk1(1)) / h_sk1;
fprintf('Kecepatan piston pada t = 0.2 s: %.2f m/s\n\n', v_02);


% =====================================================================
# STUDI KASUS 2: Gradien Temperatur pada Sirip Pendingin (Selisih Tengahan)
% =====================================================================
fprintf('=== STUDI KASUS 2 ===\n');
x_sk2 = [0.00, 0.05, 0.10];
T_sk2 = [120.0, 98.5, 82.0];
h_sk2 = x_sk2(2) - x_sk2(1);

% Evaluasi pada x = 0.05 (indeks 2)
% Titik belakang = indeks 1, Titik maju = indeks 3
dTdx_005 = (T_sk2(3) - T_sk2(1)) / (2 * h_sk2);
fprintf('Gradien temperatur pada x = 0.05 m: %.1f degC/m\n\n', dTdx_005);


% =====================================================================
# STUDI KASUS 3: Analisis Percepatan Vibrasi Bantalan Gelinding (Turunan Kedua)
% =====================================================================
fprintf('=== STUDI KASUS 3 ===\n');
t_sk3 = [0.04, 0.06, 0.08];
u_sk3 = [2.15, 2.40, 2.22];
h_sk3 = t_sk3(2) - t_sk3(1);

% Evaluasi turunan kedua pada t = 0.06 (indeks 2)
a_006 = (u_sk3(3) - 2*u_sk3(2) + u_sk3(1)) / (h_sk3^2);
fprintf('Percepatan vibrasi pada t = 0.06 s: %.1f mm/s^2\n', a_006);
fprintf('Dalam satuan SI: %.3f m/s^2\n\n', a_006 / 1000);


% =====================================================================
# STUDI KASUS 4: Menentukan Titik Puncak Kurva Efisiensi Turbin Gas
% =====================================================================
fprintf('=== STUDI KASUS 4 ===\n');
rp_sk4 = [8, 10, 12];
eta_sk4 = [0.315, 0.340, 0.335];
h_sk4 = rp_sk4(2) - rp_sk4(1);

% Hitung turunan pertama dan kedua pada rp = 10 (indeks 2)
deta_drp = (eta_sk4(3) - eta_sk4(1)) / (2 * h_sk4);
d2eta_drp2 = (eta_sk4(3) - 2*eta_sk4(2) + eta_sk4(1)) / (h_sk4^2);

fprintf('Turunan Pertama (Gradien) pada rp = 10 : %.4f\n', deta_drp);
fprintf('Turunan Kedua (Kelengkungan) pada rp = 10: %.4f\n', d2eta_drp2);

% Logika kondisional keputusan optimasi puncak
if abs(deta_drp) < 0.01 && d2eta_drp2 < 0
    fprintf('Kesimpulan: Terbukti rp = 10 adalah wilayah Efisiensi Termal Maksimum.\n');
elseif abs(deta_drp) < 0.01 && d2eta_drp2 > 0
    fprintf('Kesimpulan: Terbukti rp = 10 adalah wilayah Minimum Lokal.\n');
else
    fprintf('Kesimpulan: Titik rp = 10 bukan merupakan titik puncak stasioner.\n');
end