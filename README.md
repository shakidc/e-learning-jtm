# E-Learning Hub - Jurusan Teknik Mesin Universitas Malikussaleh

Selamat datang di repositori resmi **E-Learning Hub Teknik Mesin Universitas Malikussaleh (UNIMAL)**. Platform ini dikembangkan sebagai pusat pembelajaran digital mandiri (*self-hosted learning hub*) yang dirancang khusus untuk mempermudah distribusi materi perkuliahan, modul praktikum, pengumpulan tugas, serta integrasi *Virtual Laboratory* interaktif bagi mahasiswa.

Aplikasi ini mengusung desain *Professional Dark Theme* yang minimalis, ringan, dan *enterprise-friendly* untuk kenyamanan visual yang optimal saat proses belajar-mengajar.

---

## 📚 Daftar Mata Kuliah

Platform ini menampung dan mengelola konten untuk 6 mata kuliah pokok berikut:
1. **Fisika 1**: Membahas konsep mekanika klasik, fluida, gelombang, hingga termodinamika dasar teknik.
2. **Praktikum Fisika**: Panduan eksperimen laboratorium mulai dari metrologi, getaran mekanik, hingga elektromagnetika & aktuator.
3. **Logika Pemrograman**: Fondasi pemrograman komputer menggunakan bahasa Python untuk komputasi dan simulasi teknik.
4. **Analisis Numerik**: Pendekatan matematis dan komputasi untuk penyelesaian akar persamaan, SPL skala besar, regresi, dan interpolasi.
5. **Teknik Tenaga Listrik**: Konsep dasar arus/tegangan, komponen pasif/aktif, transformator, serta karakteristik motor dan generator AC/DC.
6. **Sistem Kendali**: Pemodelan matematika sistem dinamik, analisis transien, transformasi Laplace, hingga perancangan kontroler PID komprehensif.

---

## 🚀 Fitur Utama Aplikasi

* **Dynamic Content Routing**: Peralihan antar mata kuliah dan tab informasi dilakukan secara dinamis menggunakan *Vanilla JavaScript* tanpa memerlukan *reload* halaman (Single Page Application experience).
* **Virtual Lab & Simulator Integration**: Tautan langsung menuju simulator eksternal berbasis web (GitHub Pages) untuk eksperimen interaktif (misalnya pada modul Fisika dan Sistem Kendali).
* **Robust Fail-Safe Mechanism**: Dibekali algoritma proteksi tingkat lanjut pada `app.js` untuk mendeteksi *array* kosong atau variabel kosong. Mencegah munculnya teks *error* atau `undefined` pada antarmuka mahasiswa saat tugas/bahan ajar belum diunggah.
* **Centralized Local Storage**: Struktur tautan unduhan bahan ajar diarahkan langsung ke direktori lokal repositori, memudahkan sinkronisasi file dokumen melalui Git.

---

## 📁 Struktur Direktori Proyek

```text
.
├── index.html          # Struktur utama antarmuka web (HTML5)
├── app.js              # Logika rendering dinamis & Database statis konten kuliah
├── style.css           # Desain gaya tampilan (Custom Professional Dark Mode)
├── logo.png            # Identitas visual / logo branding aplikasi
└── materi/             # Direktori penyimpanan berkas unduhan (PDF/Zip)
    ├── fisika1/        # Berkas dokumen untuk mata kuliah Fisika 1
    ├── praktikum/      # Berkas buku panduan & template praktikum
    ├── logpro/         # Berkas modul pemrograman Python
    ├── numerik/        # Berkas diktat metode numerik
    ├── listrik/        # Berkas slide materi tenaga listrik
    └── kendali/        # Berkas diktat utama sistem kendali linear