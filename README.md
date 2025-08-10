
## Judul Proyek
Time to Code - Mobile

## Deskripsi
Mengelola backend untuk menyimpan dan mengelola data pengguna, seperti progres pembelajaran, status tantangan, dan elemen gamifikasi. Backend bertanggung jawab untuk menyimpan progres pengguna secara lokal di perangkat, memungkinkan pengguna melanjutkan pembelajaran tanpa kehilangan data. Selain itu, backend mengelola data tantangan, level, skor pengguna, serta memastikan pencapaian dan poin gamifikasi tercatat dengan tepat. Sistem ini dirancang agar mudah diskalakan, memungkinkan integrasi fitur baru atau pembaruan tanpa mengganggu pengalaman pengguna yang sudah ada.

## Fitur
- **Mode Cerita                 :** Sebuah visual novel interaktif yang mengajarkan konsep-konsep pemrograman melalui pengalaman berbasis narasi.
- **Mode Tantangan              :** Serangkaian tantangan untuk menguji dan memperkuat konsep yang telah dipelajari di Mode Cerita.
- **Mode Drag and Drop          :** Pengalaman pengkodean langsung di mana pengguna dapat menyeret dan menjatuhkan blok kode untuk menyelesaikan masalah.
- **Penyimpanan Progres Lokal   :** Progres dan pengaturan pengguna disimpan secara lokal di perangkat untuk pengalaman yang lebih lancar.
- **Elemen Gamifikasi           :** Aplikasi ini menggabungkan elemen gamifikasi seperti poin, level, dan pencapaian untuk memotivasi pengguna.

## Teknologi yang Digunakan
- **Flutter         :** Framework utama untuk membangun aplikasi.
- **Riverpod        :** Berfungsi sebagai manajemen state.
- **Flame Engine    :** Berfungsi sebagai mekanika game dan pemutaran audio.
- **GoRouter        :** Berfungsi sebagai navigasi.
- **Freezed         :** Berfungsi sebagai kelas dan union yang tidak dapat diubah.
- **ScreenUtil      :** Berfungsi sebagai desain UI yang responsif.

## Instalasi
1. **Kloning repositori:**
    ```bash
    git clone https://github.com/pens-pbl/2025-timetocode-mobile.git
    ```
2. **Masuk ke direktori proyek:**
    ```bash
    cd time-to-code
    ```
3. **Instal dependensi:**
    ```bash
    flutter pub get
    ```

## Penggunaan
1. **Jalankan aplikasi:**
    ```bash
    flutter run
    ```
2. Aplikasi akan diluncurkan di perangkat yang terhubung atau emulator.
3. Dari menu utama, Anda dapat memilih antara "Mode Cerita" atau "Mode Tantangan" untuk mulai belajar.

## Variabel Lingkungan
Proyek ini tidak memerlukan variabel lingkungan. Semua konfigurasi sudah disertakan dalam kode sumber.

## Kontribusi
Kontribusi sangat diterima! Jika Anda memiliki ide, saran, atau laporan bug, silahkan buka issue atau kirim pull request.

## Lisensi
Proyek ini dilisensikan di bawah MIT License. Lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.
