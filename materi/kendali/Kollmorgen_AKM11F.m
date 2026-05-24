clc; clear; close all;

function h = yline(yval, varargin)
  xlim_val = xlim(); % Get current x-axis limits
  h = line([xlim_val(1) xlim_val(2)], [yval yval], varargin{:});
end

% Cek paket control dasar
if exist('tf', 'file') ~= 2
    try
        pkg load control;
    catch
        error('Paket "control" tidak ditemukan. Install dengan: pkg install -forge control');
    end
end

% 1. DEFINISI PARAMETER FISIS
Ra = 1.8;           % Ohm
La = 0.00104;       % Henry
Kt = 0.046;         % Nm/A
Kb = 0.028;         % V/(rad/s)
J  = 0.0000017;     % kg.m^2
b  = 0.0000048;     % N.m.s/rad
TL = 0;             % Nm

% Parameter Simulasi
Vin_max = 75;       % Volt
Tsim    = 3;        % Detik
dt_plot = 0.001;    % Time step (1 ms)
t       = 0:dt_plot:Tsim;

% Hitung Koefisien Fungsi Alih (G(s) = speed / voltage)
den_s2 = La * J;
den_s1 = Ra * J + La * b;
den_s0 = Ra * b + Kt * Kb;


% -----------------------Model Open Loop---------------------------
disp('Analisis Skenario 1: Open Loop Response...');

% G(s) = Kt / (den_s2*s^2 + den_s1*s + den_s0)
sys_tf = tf([Kt], [den_s2, den_s1, den_s0]);

% Simulasi Step
[y_ol, t_ol] = step(sys_tf * Vin_max, t);

y_final = y_ol(end); % Steady State value

% 1. Rise Time (Waktu dari 10% ke 90% final value)
idx_10 = find(y_ol >= 0.1 * y_final, 1);
idx_90 = find(y_ol >= 0.9 * y_final, 1);
if isempty(idx_10) || isempty(idx_90)
    Tr = NaN;
else
    Tr = t_ol(idx_90) - t_ol(idx_10);
end

% 2. Settling Time (Waktu terakhir sinyal berada di luar toleransi 2%)
tolerance = 0.02 * y_final;
is_outside = abs(y_ol - y_final) > tolerance;
idx_settled = find(is_outside, 1, 'last');
if isempty(idx_settled)
    Ts = 0;
else
    Ts = t_ol(idx_settled + 1); % Ambil titik setelahnya
end

% 3. Overshoot (Persentase lonjakan maksimum)
y_max = max(y_ol);
if y_max > y_final
    OS = (y_max - y_final) / y_final * 100;
else
    OS = 0;
end

fprintf('\n[HASIL SKENARIO 1]\n');
fprintf('Final Speed (Steady State) : %.4f rad/s\n', y_final);
fprintf('Rise Time (Tr - 10%% to 90%%): %.4f s\n', Tr);
fprintf('Settling Time (Ts - 2%%)    : %.4f s\n', Ts);
fprintf('Overshoot (%%OS)            : %.2f %%\n', OS);

figure(1);
plot(t_ol, y_ol, 'LineWidth', 2, 'Color', 'b');
grid on; title('Skenario 1: Open Loop Response');
xlabel('Time (s)'); ylabel('Speed (rad/s)');

% -----------------------Model Closed Loop + Aksi Kendali--------------------
disp('-------------------------------------------------------------');
disp('Analisis Skenario 2: PID Control + Anti-Windup...');

% Parameter Kontroler
Kp = 0.5; Ki = 5.0; Kd = 0.01;
Setpoint = 2000; % rad/s = 19098.6 RPM

% Feedback Gain
Kf = 1.0;

% Setup Simulasi Presisi Tinggi (10 mikrosekon)
dt_calc = 0.00001;
steps = floor(Tsim / dt_calc);

% Array untuk Plotting
w_plot = []; u_plot = []; t_plot = [];

% State Awal
w = 0; curr = 0; integral_term = 0; prev_error = 0;
counter = 0;

% Mulai Loop Fisika
for k = 1:steps
    % 1. PID Calculation
    error = Setpoint - w;
    P = Kp * error;
    D = Kd * (error - prev_error) / dt_calc;

    v_raw = P + integral_term + D;

    % 2. Saturasi
    if v_raw > Vin_max
        v_out = Vin_max; is_sat = true;
    elseif v_raw < -Vin_max
        v_out = -Vin_max; is_sat = true;
    else
        v_out = v_raw; is_sat = false;
    end

    % 3. Anti-Windup (Clamping Logic)
    is_helping = (v_raw * error < 0);
    if (~is_sat || is_helping)
        integral_term = integral_term + Ki * error * dt_calc;
    end

    % 4. Fisika Motor (Euler Integration for simplicity in validation)
    dw = (Kt * curr - b * w - TL) / J;
    di = (v_out - Ra * curr - Kb * w) / La;

    w = w + dw * dt_calc;
    curr = curr + di * dt_calc;
    prev_error = error;

    % 5. Downsampling (Simpan data setiap 1ms agar grafik ringan)
    counter = counter + 1;
    if counter >= (dt_plot / dt_calc)
        w_plot(end+1) = w;
        u_plot(end+1) = v_out;
        t_plot(end+1) = k * dt_calc;
        counter = 0;
    end
end

fprintf('\n[HASIL SKENARIO 2]\n');
fprintf('Setpoint                   : %.2f rad/s\n', Setpoint);
fprintf('Steady State Error         : %.4f rad/s\n', Setpoint - w_plot(end));

figure(2);
subplot(2,1,1); plot(t_plot, w_plot, 'r', 'LineWidth', 2); grid on;
title('Skenario 2: Closed Loop Response'); ylabel('Speed (rad/s)');
subplot(2,1,2); plot(t_plot, u_plot, 'm', 'LineWidth', 2); grid on;
yline(Vin_max); title('Control Signal (Anti-Windup Active)'); ylabel('Voltage (V)');

% -----------------------Analisis Ketangguhan & Kestabilan----------------------
disp('-------------------------------------------------------------');
disp('Analisis Skenario 3: Frequency & Stability...');

% Membuat Transfer Function Kontroler PID (Ideal)
% C(s) = Kp + Ki/s + Kd*s = (Kd*s^2 + Kp*s + Ki) / s
num_pid = [Kd, Kp, Ki];
den_pid = [1, 0];
sys_pid = tf(num_pid, den_pid);

% Membuat Transfer Function Open Loop Total (L = C * P)
% Loop Gain = PID * Motor Plant
sys_open_loop_total = sys_pid * sys_tf;

% Membuat Sistem Closed Loop (T = L / (1 + L*H))
% Feedback H = Kf_val
sys_closed_loop = feedback(sys_open_loop_total, Kf);

% Hitung Poles dari Sistem Closed Loop
cl_poles = pole(sys_closed_loop);

% Hitung Margin (Bode) dari Open Loop Total
[Gm, Pm, Wcg, Wcp] = margin(sys_open_loop_total);

% --- OUTPUT HASIL ---
fprintf('\n[HASIL VALIDASI SKENARIO 3 - CLOSED LOOP]\n');
fprintf('------------------------------------------------\n');
fprintf('Posisi Pole:\n');
% Urutkan pole
cl_poles_sorted = sort(cl_poles, 'ascend');
for i = 1:length(cl_poles_sorted)
    fprintf('s%d = %.4f\n', i, cl_poles_sorted(i));
end

% Plot Root Locus untuk melihat pergerakan pole
figure(3);
rlocus(sys_closed_loop);
grid on;
title('Root Locus (Sistem dengan PID)');

fprintf('\nAnalisis Margin (Bode Plot):\n');
if isinf(Gm)
    fprintf('Gain Margin (GM)  : Infinite (Stabil Mutlak)\n');
else
    fprintf('Gain Margin (GM)  : %.4f dB\n', 20*log10(Gm));
end

if isnan(Pm) || isempty(Pm)
    fprintf('Phase Margin (PM) : N/A (Sistem sangat stabil/tidak memotong 0dB)\n');
else
    fprintf('Phase Margin (PM) : %.4f deg at %.2f rad/s\n', Pm, Wcp);
end

figure(4);
bode(sys_open_loop_total); grid on;
title('Skenario 3: Bode Plot');

disp('-------------------------------------------------------------');
disp('SELESAI');
