// Database Konten Statis E-Learning Hub Teknik Mesin UNIMAL
const courseData = {
  fisika1: {
    virtualLab: "https://shakidc.github.io/virtual-lab-fisika1/",
    materi: [
      { title: "Materi 1: Pengukuran dan Satuan serta Besaran", desc: "Sistem Satuan Internasional (SI), dimensi besaran fisik, konversi satuan teknik, serta analisis ketidakpastian dan instrumen ukur dasar mekanika." },
      { title: "Materi 2: Gerak Lurus dan Gerak dalam Dua Dimensi", desc: "Analisis kinematika partikel, GLB, GLBB, gerak peluru (parabola), dan gerak melingkar beraturan dalam ruang dua dimensi." },
      { title: "Materi 3: Gaya dan Tekanan serta Hukum Newton I", desc: "Konsep gaya gaya kontak dan medan, distribusi tekanan pada luasan, serta aplikasi Hukum Newton I (Inersia) pada sistem benda diam." },
      { title: "Materi 4: Kesetimbangan Gaya dan Hukum Newton tentang Gerak Kerja dan Energi, Momentum, Impuls dan Tumbukan", desc: "Analisis dinamika mekanik menggunakan Hukum Newton II & III, teorema kerja-energi, hukum kekekalan momentum linear, konsep impuls, serta fenomena tumbukan elastis/inelastis." },
      { title: "Materi 5: Rotasi Benda Tegar dan Gravitasi", desc: "Kinematika rotasi, momen gaya (torsi), momen inersia penampang, hukum kekekalan momentum sudut, serta hukum gravitasi universal Newton pada benda masif." },
      { title: "Materi 6: Fluida Statik dan Fluida Dinamik", desc: "Prinsip hidrostatik, Hukum Pascal, Hukum Archimedes (gaya apung), persamaan kontinuitas aliran fluida ideal, dan Hukum Bernoulli untuk aplikasi aliran pipa." },
      { title: "Materi 7: Gerak Periodik dan Konsep Dasar Gelombang", desc: "Sistem osilasi harmonik sederhana (pegas dan pendulum), persamaan gelombang mekanik berjalan, superposisi, dan sifat-sifat dasar gelombang." },
      { title: "Materi 8: Gelombang Bunyi", desc: "Karakteristik gelombang longitudinal, kecepatan rambat bunyi pada medium padat/cair/gas, efek Doppler, intensitas bunyi, dan aplikasi resonansi akustik." },
      { title: "Materi 9: Suhu dan Kalor", desc: "Definisi temperatur dan termometri, ekspansi termal bahan teknik, mekanisme perpindahan kalor (konduksi, konveksi, radiasi), serta asas Black." }
    ],
    "bahan-ajar": [
      { title: "Rencana Perkuliahan Semester.pdf", file: "./materi/fisika1/RPS_Fisika1.pdf" },
      { title: "Soal UAS Fisika I 2025.pdf", file: "./materi/fisika1/UAS Fisika I 2025.pdf" }
    ],
    tugas: [
      //{ title: "Tugas Mandiri 1: Problem Set Kinematika & Dinamika Newton", desc: "Selesaikan soal nomor 1-10 pada modul penugasan terlampir. Kumpulkan berkas jawaban dalam format PDF.", deadline: "04 Juni 2026", driveLink: "https://drive.google.com/" }
    ]
  },
  praktikum_fisika: {
    virtualLab: "https://shakidc.github.io/virtual-lab-fisika1/",
    materi: [
      { title: "Modul 1: Metrologi Dasar", desc: "Penggunaan jangka sorong, mikrometer sekrup, dial indicator, kalibrasi alat ukur, serta perhitungan galat/ketidakpastian berulang." },
      { title: "Modul 2: Dinamika Translasi dan Friksi", desc: "Pengujian koefisien gesek statis dan kinetis pada berbagai variasi permukaan material struktural." },
      { title: "Modul 3: Analisis Getaran Mekanik", desc: "Pengukuran frekuensi pribadi sistem pegas-massa dan pendulum tunggal untuk penentuan konstanta redaman alami." },
      { title: "Modul 4: Karakteristik Fluida Dasar", desc: "Eksperimen penentuan viskositas fluida cair menggunakan metode bola jatuh dan hukum Stokes." },
      { title: "Modul 5: Dinamika Rotasi dan Momen Inersia", desc: "Pengujian benda menggelinding pada bidang miring untuk memvalidasi nilai konstanta inersia geometri teratur." },
      { title: "Modul 6: Asas Black", desc: "Eksperimen kalorimetri untuk menentukan kalor jenis logam (tembaga/aluminium) dengan prinsip kesetimbangan termal." },
      { title: "Modul 7: Dasar Kelistrikan dan Hukum Ohm", desc: "Praktik perakitan rangkaian seri-paralel hambatan listrik, pengukuran arus-tegangan, dan validasi Hukum Ohm." },
      { title: "Modul 8: Elektromagnetika", desc: "Analisis hubungan lilitan kumparan terhadap kuat medan magnet induksi, gaya Lorentz, serta prinsip dasar kerja aktuator mekanik." }
    ],
    "bahan-ajar": [
      { title: "Modul Praktikum Fisika.pdf", file: "./materi/praktikum/Modul Praktikum Fisika.pdf" }
    ],
    tugas: [] // Contoh simulasi jika tugas sedang kosong bersih
  },
  logika_pemrograman: {
    materi: [
      { title: "Materi 1: Konsep Dasar Pemrograman", desc: "Pengenalan arsitektur komputer, logika algoritma, diagram alir (flowchart), pseudocode, dan dasar sintaks Python." },
      { title: "Materi 2: Struktur Data", desc: "Penerapan tipe data primitif dan kolektif di Python seperti Integer, Float, String, List, Tuple, Dictionary, dan Set." },
      { title: "Materi 3: Percabangan Logika", desc: "Konstruksi pengambilan keputusan menggunakan statemen kondisional (if, if-else, if-elif-else) dan operator logika bersarang." },
      { title: "Materi 4: Kalang Perulangan", desc: "Automasi proses iterasi menggunakan kontrol perulangan 'for' dan 'while', serta perintah break, continue, dan pass." },
      { title: "Materi 5: Array & String", desc: "Manipulasi data array satu/multi-dimensi menggunakan pustaka NumPy serta teknik slicing dan formatting data String." },
      { title: "Materi 6: Fungsi & Parameter", desc: "Modularisasi kode program melalui pembuatan fungsi (def), argumen posisional/keyword, return value, dan fungsi lambda." },
      { title: "Materi 7: Pemrograman Berbasis Objek (OOP)", desc: "Konsep dasar paradigma objek: pembuatan Class, Object, Constructor (__init__), Atribut, Method, serta konsep Pewarisan (Inheritance)." },
      { title: "Materi 8: Manajemen Berkas", desc: "Operasi I/O untuk membaca (read) dan menulis (write) berkas data eksternal berformat txt, csv, dan json." },
      { title: "Materi 9: Analisis & Visualisasi Data", desc: "Pengolahan data tabular menggunakan pustaka Pandas dan pembuatan grafik plot teknik menggunakan Matplotlib/Seaborn." },
      { title: "Materi 10: Debugging & Dokumentasi", desc: "Penanganan error menggunakan Try-Except (Exception Handling), penggunaan debugger, serta penulisan Docstrings standar PEP 8." },
      { title: "Materi 11: Studi Kasus: Permasalahan Mekanika", desc: "Implementasi program Python untuk menghitung distribusi tegangan balok, lintasan gerak peluru, dan analisis dinamika fluida." },
      { title: "Materi 12: Studi Kasus: Analisis Numerik", desc: "Penyusunan kode program mandiri untuk penyelesaian iterasi numerik seperti metode pencarian akar persamaan non-linier." }
    ],
    "bahan-ajar": [
      { title: "Rencana Perkuliahan Semester.pdf", file: "./materi/logpro/RPS Logika Pemrograman.pdf" },
      { title: "Deskripsi UAS Logika Pemrograman 2025.pdf", file: "./materi/logpro/Deskripsi UAS Logika Pemrograman 2025.pdf" },
      { title: "Soal Kuis LogPro 2025.pdf", file: "./materi/logpro/Kuis LogPro 2025.pdf" },
      { title: "Studi Kasus UAS LogPro 2025.pdf", file: "./materi/logpro/Studi Kasus UAS LogPro 2025.pdf" },
      { title: "Modul Ajar Logika Pemrograman.pdf", file: "./materi/logpro/Modul Ajar Logika Pemrograman.pdf" },
      { title: "Soal UTS LogPro 2025.pdf", file: "./materi/logpro/UTS LogPro 2025.pdf" },
      { title: "Bahan Ajar Minggu 1-7 Logika Pemrograman.pdf", file: "./materi/logpro/W1-W7_LogPro.pdf" }
    ],
    tugas: []
  },
  analisis_numerik: {
    materi: [
      { title: "Materi 1: Pengantar Analisis Numerik", desc: "Perbedaan solusi analitis dan numerik, representasi angka dalam komputer, serta dasar pendekatan diskritisasi matematis." },
      { title: "Materi 2: Definisi dan Jenis-jenis Error", desc: "Formulasi komputasi galat: galat bawaan (inheren), galat pemotongan (truncation error), galat pembulatan (round-off error), galat absolut, dan galat relatif." },
      { title: "Materi 3: Akar-akar Persamaan Kuadrat: Metode Setengah Interval", desc: "Metode pengurungan (bracketing method) menggunakan Bisection untuk mencari akar fungsi non-linier berdasarkan kontinuitas tanda." },
      { title: "Materi 4: Akar-akar Persamaan Kuadrat: Metode Interpolasi Linear", desc: "Algoritma pencarian akar menggunakan metode Regulafalsi (False Position) berbasis kemiringan garis secant." },
      { title: "Materi 5: Akar-akar Persamaan Kuadrat: Metode Newton-Raphson", desc: "Metode terbuka dengan memanfaatkan pendekatan turunan pertama fungsi (gradien) untuk mencapai konvergensi kuadratik yang cepat." },
      { title: "Materi 6: Akar-akar Persamaan Kuadrat: Metode Secant dan Iterasi", desc: "Pencarian akar tanpa komputasi turunan langsung (Metode Secant) serta teknik iterasi titik tetap (Fixed-Point Iteration)." },
      { title: "Materi 7: Matriks dan Sistem Persamaan Linear: Metode Eliminasi Gauss", desc: "Penyelesaian sistem persamaan linier simultan skala besar melalui operasi baris elementer (OBE) dan substitusi balik." },
      { title: "Materi 8: Sistem Persamaan Linear: Metode Matriks Invers dan Gauss-Jordan", desc: "Algoritma transformasi matriks augmentasi menjadi matriks identitas untuk mencari nilai invers matriks dan solusi SPL." },
      { title: "Materi 9: Sistem Persamaan Linear: Metode Iterasi Jacobi, Iterasi Gauss-Seidel, Dekomposisi LU dan Cholesky", desc: "Penyelesaian SPL secara iteratif (Jacobi & Gauss-Seidel) serta metode pemfaktoran matriks menjadi bentuk segitiga bawah (L) dan segitiga atas (U)." },
      { title: "Materi 10: Analisis Regresi: Metode Kuadrat Terkecil", desc: "Pencocokan kurva (curve fitting) untuk menarik garis linier terbaik dari himpunan data eksperimen berderau (Least-Squares Regression)." },
      { title: "Materi 11: Analisis Regresi: Regresi Polinomial", desc: "Ekstensi regresi non-linier untuk memodelkan keterkaitan variabel teknik berpangkat orde tinggi." },
      { title: "Materi 12: Interpolasi: Linear dan Kuadrat", desc: "Teknik estimasi nilai di antara titik data yang diketahui menggunakan pendekatan polinomial orde satu dan orde dua." },
      { title: "Materi 13: Interpolasi: Polinomial Lagrange dan Spline", desc: "Formulasi interpolasi Lagrange umum serta metode spline linier/kuadratik/kubik untuk kurva interpolasi yang mulus." },
      { title: "Materi 14: Differensiasi", desc: "Turunan numerik menggunakan skema selisih maju (forward), selisih mundur (backward), dan selisih tengah (central difference)." }
    ],
    "bahan-ajar": [
      { title: "Bahan Ajar Minggu 9 Analisis Numerik.pdf", file: "./materi/numerik/Analisis Numerik - W9.pdf" },
      { title: "Contoh Kode Sumber Python Minggu 9", file: "./materi/numerik/Minggu9.ipynb" },
      { title: "Contoh Kode Sumber Octave/MATLAB Minggu 9", file: "./materi/numerik/Minggu9.m" },
      { title: "Rencana Perkuliahan Semester.pdf", file: "./materi/numerik/RPS Analisis Numerik.pdf" },
      { title: "Bahan Ajar Minggu 10 Analisis Numerik.pdf", file: "./materi/numerik/Analisis Numerik - W10.pdf" },
      { title: "Contoh Kode Sumber Python Minggu 10", file: "./materi/numerik/Minggu10.ipynb" },
      { title: "Contoh Kode Sumber Octave/MATLAB Minggu 10", file: "./materi/numerik/Minggu10.m" },
      { title: "Bahan Ajar Minggu 11 Analisis Numerik.pdf", file: "./materi/numerik/Analisis Numerik - W11.pdf" },
      { title: "Contoh Kode Sumber Python Minggu 11", file: "./materi/numerik/Minggu11.ipynb" },
      { title: "Contoh Kode Sumber Octave/MATLAB Minggu 11", file: "./materi/numerik/Minggu11.m" },
      { title: "Soal Kuis SPL.pdf", file: "./materi/numerik/Kuis SPL.pdf" }
    ],
    tugas: [
      { title: "Kuis 2: Sistem Persamaan Linear", desc: "Silakan kerjakan sesuai dengan panduan pada 'Soal Kuis SPL.pdf' yang terdapat pada bagian 'Bahan Ajar & Dokumen'", deadline: "25 Juni 2026 | 21:00 WIB", driveLink: "https://forms.gle/yGNj6HK84ckjrseL7" }
    ]
  },
  tenaga_listrik: {
    virtualLab: "https://mechsimulator.com/electrical/",
    materi: [
      { title: "Materi 1: Konsep-konsep Dasar Teknik Tenaga Listrik", desc: "Sistem generasi, transmisi, distribusi tenaga listrik, serta pengenalan frekuensi kerja sistem daya." },
      { title: "Materi 2: Konsep Dasar Arus dan Tegangan", desc: "Definisi muatan listrik, arus konvensional, beda potensial, energi spesifik, daya listrik, dan sistem AC vs DC." },
      { title: "Materi 3: Elemen dan Model Ideal Sirkuit", desc: "Karakteristik komponen pasif (R, L, C) ideal serta sumber tegangan dan sumber arus independen/dependen." },
      { title: "Materi 4: Hukum Ohm", desc: "Hubungan linear antara tegangan, arus, dan resistansi, serta konsep konduktansi material hantaran." },
      { title: "Materi 5: Hukum Kirchoff", desc: "Aplikasi Hukum Kirchoff Arus (KCL) pada simpul rangkaian dan Hukum Kirchoff Tegangan (KVL) pada lintasan tertutup (loop)." },
      { title: "Materi 6: Kapasitor", desc: "Struktur fisik kapasitor, hubungan arus-tegangan, pengisian/pengosongan muatan, serta penyimpanan energi medan elektrostatik." },
      { title: "Materi 7: Induktor", desc: "Formulasi induktansi, hukum induksi induktif Faraday, hubungan v-i, dan penyimpanan energi dalam bentuk medan magnetik." },
      { title: "Materi 8: Dioda", desc: "Prinsip semikonduktor sambungan P-N, karakteristik I-V dioda, dan penerapannya sebagai penyearah gelombang (rectifier)." },
      { title: "Materi 9: Generator Listrik AC", desc: "Prinsip kerja generator sinkron tiga fasa dan fasa tunggal berdasarkan hukum induksi elektromagnetik generator rotatif." },
      { title: "Materi 10: Generator Listrik DC", desc: "Komponen konstruksi kumparan medan, jangkar, sistem komutator mekanik, dan pembentukan ggl searah." },
      { title: "Materi 11: Motor Listrik AC", desc: "Prinsip medan magnet putar, karakteristik kerja motor induksi (asinkron) dan motor sinkron untuk penggerak mula industri." },
      { title: "Materi 12: Motor Listrik DC", desc: "Karakteristik hubungan torsi-kecepatan pada motor DC eksitasi terpisah, seri, shunt, dan pengaturan kecepatan putar jangkar." },
      { title: "Materi 13: Transformator Fasa Tunggal", desc: "Konstruksi inti besi transformator, transformator ideal, rangkaian ekivalen praktis, rugi-rugi (inti & tembaga), dan efisiensi kerja." },
      { title: "Materi 14: Transformator Tiga Fasa", desc: "Metode hubungan belitan tiga fasa (Wye-Wye, Delta-Delta, Wye-Delta), trafo instrumen, dan aplikasi distribusi daya." }
    ],
    "bahan-ajar": [
      { title: "Rencana Perkuliahan Semester.pdf", file: "./materi/listrik/RPS TTL.pdf" },
      { title: "Bahan Ajar Minggu 9 Teknik Tenaga Listrik.pdf", file: "./materi/listrik/Teknik Tenaga Listrik - W9.pdf" },
      { title: "Bahan Ajar Minggu 10 Teknik Tenaga Listrik.pdf", file: "./materi/listrik/Teknik Tenaga Listrik - W10.pdf" }
    ],
    tugas: []
  },
  sistem_kendali: {
    virtualLab: "https://shakidc.github.io/simulator-sistem-kendali/",
    materi: [
      { title: "Materi 1: Pengantar Sistem Kendali", desc: "Definisi sistem dinamik, evolusi teknologi kontroler, serta perbandingan sistem kendali loop terbuka (open-loop) dan loop tertutup (close-loop)." },
      { title: "Materi 2: Konsep Dasar Pemodelan", desc: "Representasi matematis komponen fisik mekanik (translasional/rotasional) dan komponen elektrik menjadi model persamaan dinamis." },
      { title: "Materi 3: Transformasi Laplace", desc: "Metode matematika untuk mengubah persamaan diferensial domain waktu ke domain s (frekuensi kompleks) guna mempermudah analisis aljabar." },
      { title: "Materi 4: Sistem Linear & Persamaan Differensial", desc: "Asas superposisi linearitas, klasifikasi sistem LTI (Linear Time-Invariant), dan solusi tanggapan homogen/partikular." },
      { title: "Materi 5: Analisis Transien", desc: "Karakteristik performa sistem berdasarkan respons waktu fasa awal seperti settling time, peak time, rise time, dan overshoot maksimum." },
      { title: "Materi 6: Aksi Kendali", desc: "Jenis-jenis aksi kontrol dasar: On-Off (bang-bang), Proporsional (P), Integral (I), dan Derivative (D)." },
      { title: "Materi 7: Aljabar Diagram Blok & Fungsi Alih", desc: "Teknik reduksi diagram blok sistem kompleks, representasi grafik aliran sinyal, dan formulasi Fungsi Alih (Transfer Function) keseluruhan." },
      { title: "Materi 8: Kendali PID", desc: "Kombinasi kontroler PID komprehensif, efek masing-masing parameter penguatan terhadap kestabilan, serta pengenalan metode tuning Ziegler-Nichols." },
      { title: "Materi 9: Sistem Linear untuk Sistem Robust", desc: "Konsep ketahanan sistem kendali (robustness) terhadap adanya gangguan luar (disturbance rejection) dan variasi parameter internal plant." },
      { title: "Materi 10: Analisis Sistem Kendali dengan Metode Root Locus Analysis", desc: "Penggambaran jejak kedudukan akar-akar persamaan karakteristik sistem close-loop seiring perubahan nilai penguatan (gain) loop terbuka." },
      { title: "Materi 11: Analisis Kestabilan dengan Metode Routh-Hurwitz", desc: "Kriteria matematis mutlak untuk mendeteksi jumlah akar tidak stabil di belahan kanan bidang s tanpa perlu menyelesaikan akar polinomial secara langsung." }
    ],
    "bahan-ajar": [
      { title: "Rencana Perkuliahan Semester.pdf", file: "./materi/kendali/RPS Sistem Kendali.pdf" },
      { title: "Bahan Ajar Minggu 1 Sistem Kendali.pdf", file: "./materi/kendali/SisKen - W1.pdf" },
      { title: "Soal UAS Sistem Kendali 2025.pdf", file: "./materi/kendali/UAS SisKen 2025.pdf" },
      { title: "Contoh Kode Sumber Python Sistem Kendali", file: "./materi/kendali/Kollmorgen_AKM11F.ipynb" },
      { title: "Contoh Kode Sumber Octave/MATLAB Sistem Kendali", file: "./materi/kendali/Kollmorgen_AKM11F.m" }
    ],
    tugas: []
  }
};

// State Tracker Internal Aplikasi
let activeCourse = "fisika1";
let activeTab = "materi";

// DOM Elements
const courseCards = document.querySelectorAll('.course-card');
const tabButtons = document.querySelectorAll('.tab-btn');
const contentDisplay = document.getElementById('dynamic-content');
const vlabBanner = document.getElementById('vlab-banner');
const vlabLink = document.getElementById('vlab-link');

// Fungsi Render Konten Dinamis (Sudah Terproteksi dari 'undefined')
function renderContent() {
  const currentCourseData = courseData[activeCourse];
  
  // 1. Mengelola Kenampakan Banner Virtual Lab secara aman
  if (currentCourseData && currentCourseData.virtualLab) {
    vlabBanner.classList.remove('style-hidden');
    vlabLink.setAttribute('href', currentCourseData.virtualLab);
  } else {
    vlabBanner.classList.add('style-hidden');
  }

  // Proteksi jika data mata kuliah tidak ditemukan di database
  if (!currentCourseData) {
    contentDisplay.innerHTML = `<p style="color: var(--secondary); font-size: 0.95rem; padding: 1rem 0;">Mata kuliah tidak ditemukan.</p>`;
    return;
  }

  const data = currentCourseData[activeTab];
  contentDisplay.innerHTML = "";

  // 2. LAPIS PROTEKSI A: Jika properti tab kosong, [] atau tidak ditulis (Mencegah tampilan rusak/kosong)
  if (!data || data.length === 0) {
    let pesanKosong = "Belum ada konten untuk tab ini.";
    
    if (activeTab === 'materi') {
      pesanKosong = "Belum ada daftar pokok bahasan materi yang dimasukkan.";
    } else if (activeTab === 'bahan-ajar') {
      pesanKosong = "Belum ada berkas PDF atau dokumen bahan ajar yang diunggah.";
    } else if (activeTab === 'tugas') {
      pesanKosong = "Belum ada tugas atau proyek aktif yang dibebankan untuk mata kuliah ini.";
    }
    
    contentDisplay.innerHTML = `
      <p style="color: var(--secondary); font-size: 0.95rem; padding: 1.5rem 0; font-style: italic; text-align: center;">
        ${pesanKosong}
      </p>`;
    return;
  }

  // 3. LAPIS PROTEKSI B: Memberikan fallback value (||) pada tiap variabel objek di dalam loop
  data.forEach(item => {
    const itemDiv = document.createElement('div');
    itemDiv.className = 'content-item';

    // Jika Anda lupa mengisi salah satu parameter properti di database atas, teks default ini yang akan menggantikannya
    const title = item.title || "Judul Belum Tersedia";
    const desc = item.desc || "Tidak ada deskripsi rincian atau instruksi tambahan.";
    const file = item.file || "#";
    const deadline = item.deadline || "Tidak ada tenggat waktu";
    const driveLink = item.driveLink || "https://drive.google.com/";

    if (activeTab === 'materi') {
      itemDiv.innerHTML = `
        <h4>${title}</h4>
        <p>${desc}</p>
      `;
    } else if (activeTab === 'bahan-ajar') {
      itemDiv.innerHTML = `
        <h4>${title}</h4>
        <a href="${file}" class="resource-link" download>
          <svg style="width:16px;height:16px;fill:currentColor;vertical-align:middle;" viewBox="0 0 24 24"><path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM17 13l-5 5-5-5h3V9h4v4h3z"/></svg>
          Unduh Berkas Materi Kuliah
        </a>
      `;
    } else if (activeTab === 'tugas') {
      itemDiv.innerHTML = `
        <h4>${title} <span class="badge deadline">Tenggat: ${deadline}</span></h4>
        <p>${desc}</p>
        <a href="${driveLink}" class="drive-btn" target="_blank">
          <svg style="width:14px;height:14px;fill:currentColor;" viewBox="0 0 24 24"><path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM19 18H6c-2.21 0-4-1.79-4-4 0-2.05 1.53-3.76 3.56-3.97l1.07-.11.5-.95C8.08 7.14 9.94 6 12 6c2.62 0 4.88 1.86 5.39 4.43l.3 1.5 1.53.11c1.56.1 2.78 1.41 2.78 2.96 0 1.65-1.35 3-3 3zm-5.5-5V9h-3v4H8l4 4 4-4h-2.5z"/></svg>
          Kumpulkan Tugas via Google Drive
        </a>
      `;
    }

    contentDisplay.appendChild(itemDiv);
  });
}

// Event Listeners untuk Setiap Pilihan Mata Kuliah
courseCards.forEach(card => {
  card.addEventListener('click', () => {
    courseCards.forEach(c => c.classList.remove('active'));
    card.classList.add('active');
    activeCourse = card.getAttribute('data-course');
    renderContent();
  });
});

// Event Listeners untuk Navigasi Tab Internal
tabButtons.forEach(btn => {
  btn.addEventListener('click', () => {
    tabButtons.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    activeTab = btn.getAttribute('data-tab');
    renderContent();
  });
});

// Eksekusi Render Pertama Saat Dokumen Siap
window.addEventListener('DOMContentLoaded', () => {
  renderContent();
});