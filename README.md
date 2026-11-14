# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tentang Aplikasi
**MyPortofolio Mobile** merupakan sebuah aplikasi portofolio personal berbasis Flutter, guna memenuhi tugas individu (*Individual Assignment*) mata kuliah Pemrograman Berbasis Platform (PBP). Aplikasi ini dikembangkan sebagai versi *mobile* dari proyek portofolio sebelumnya yang berbasis Django.

**Identitas**
- **Nama    :** Fahira Ryhanabila
- **NPM     :** 2506623660
- **Kelas   :** PBP E

### Fitur Halaman Utama
- **InfoCard:** NPM, Name, dan Class.
- **ItemCard:** Lihat Skills, Lihat Experience, Lihat Education, Tambah Experience, Tambah Education, Log Out, dengan masing-masing item memiliki warna dan ikon yang berbeda.
- **SnackBar:** Muncul saat ItemCard ditekan.
- Halaman dapat di-scroll agar tidak overflow di layar kecil.

### Framework, Assets & Credits
- **Flutter & Dart** sebagai framework dan bahasa pemrograman.
- **Roboto** sebagai font bawaan Material.
- **Material Icons** sebagai ikon bawaan Flutter.

Tidak ada paket tambahan atau aset eksternal yang digunakan.

### Cara Menjalankan

1. Pasang [Flutter SDK](https://docs.flutter.dev/get-started/install) dan pastikan `flutter doctor` tidak menunjukkan masalah pada Android toolchain atau Chrome.
2. Clone repositori dan masuk ke foldernya:
   ```bash
   git clone https://github.com/fahiraryhanabila/myportofolio_mobile.git
   cd myportofolio_mobile
   ```
3. Unduh dependensi:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi:
   ```bash
   flutter run -d chrome     # di browser Chrome
   flutter run               # di HP Android / emulator yang terhubung
   ```
5. (Opsional) Cek kualitas kode:
   ```bash
   flutter analyze
   ```

### Struktur Kode

File utama aplikasi berada di dalam folder `lib/` dengan pembagian sebagai berikut:

```
lib/
├── main.dart   # Entry point dan konfigurasi aplikasi
└── menu.dart   # Halaman utama dan komponen menu
```

## Tugas 7
1. Widget tree pada flutter merupakan sebuah struktur hierarkis yang menggambarkan bagaimana widget disusun dalam aplikasi Flutter. Setiap widget dapat memiliki widget lain sebagai anak (*child*), sehingga membentuk struktur seperti pohon (*tree*). Hubungan *parent-child* menentukan bagaimana tampilan aplikasi disusun. *Parent widget* berfungsi sebagai wadah atau pengatur bagi *child widget* yang berada di dalamnya.
Sebagai contoh pada proyek ini:
- `MaterialApp` menjadi *parent* yang membungkus aplikasi.
- `Scaffold` menjadi child dari `MaterialApp` sekaligus *parent* bagi `Column`.
- `Column` merupakan *parent* dari `Text` dan `InfoCard`.

2. Widget yang digunakan pada proyek ini terdiri atas widget bawaan Flutter dan widget yang dibuat sendiri.
### Built-in Widget

| Widget | Fungsi |
|---|---|
| `MaterialApp` | Mengatur konfigurasi utama aplikasi dan tema. |
| `Scaffold` | Menyediakan struktur dasar halaman. |
| `AppBar` | Menampilkan judul pada bagian atas halaman. |
| `Text` | Menampilkan teks pada aplikasi. |
| `SingleChildScrollView` | Memungkinkan halaman di-scroll. |
| `Padding` | Mengatur jarak di sekitar widget. |
| `Column` | Menyusun widget secara vertikal. |
| `Row` | Menyusun widget secara horizontal. |
| `Center` | Menempatkan widget di tengah. |
| `SizedBox` | Memberikan jarak antar-widget. |
| `GridView.count` | Menampilkan widget dalam bentuk grid. |
| `Card` | Menampilkan informasi dalam bentuk kartu. |
| `Container` | Mengatur ukuran, padding, dan tampilan konten. |
| `Material` | Mengatur tampilan Material Design pada tombol menu. |
| `InkWell` | Menangani interaksi ketika tombol ditekan. |
| `Icon` | Menampilkan ikon menu. |
| `SnackBar` | Menampilkan pesan sementara setelah tombol ditekan. |

### Custom Widget

| Widget | Fungsi |
|---|---|
| `MyApp` | Mengatur tema dan halaman awal aplikasi. |
| `MyHomePage` | Menampilkan halaman utama aplikasi. |
| `InfoCard` | Menampilkan informasi NPM, nama, dan kelas. |
| `ItemCard` | Menampilkan tombol menu beserta ikon dan warnanya. |

3. Fungsi dari `MaterialApp` adalah sebagai widget utama yang mengatur konfigurasi aplikasi Flutter dengan Material Design. Widget ini menyediakan berbagai pengaturan, sepeti tema (`theme`), judul aplikasi (`title`), dan halaman awal (`home`).
Umumnya, `MaterialApp` digunakan sebagai *root widget* karena menjadi titik awal struktur *widget tree* aplikasi. Dengan meletakkannya di bagian paling atas, konfigurasi seperti tema dan navigasi dapat digunakan oleh widget-widget lain yang berada di bawahnya. Pada proyek ini, `MaterialApp` digunakan pada class `MyApp` untuk mengatur tema aplikasi dan menentukan  `MyHomePage()` sebagai halaman awal melalui properti `home`.

4. Perbedaan antara `StatelessWidget` dan `StatefulWidget` terletak pada apakah widget perlu menyimpan dan mengelola `state` selama aplikasi berjalan. 
* `StatelessWidget` merupakan widget yang tidak memiliki *state* yang dapat berubah dan tampilannya bergantung pada konfigurasi yang diberikan saat widget dibuat. Widget ini cocok digunakan saat tampilannya tidak perlu berubah akibat interaksi pengguna.
Contoh pada proyek ini: `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard`.
* `StatefulWidget` merupakan widget yang memiliki *state* yang dapat berubah selama aplikasi berjalan. Saat nilai *state* berubah, widget dapat membangun ulang tampilannya menggunakan `setState()`. Widget ini cocok digunakan saat tampilannya perlu diperbarui akibat interaksi pengguna.
Contoh: fitur *counter* (angka terus bertambah setiap kali pengguna menekan tombol).

Dengan demikian, gunakan `StatelessWidget` jika tampilan hanya bergantung pada data yang diterima, sedangkan gunakan `StatefulWidget` jika widget perlu mengelola perubahan *state* dan memperbarui tampilannya selama aplikasi berjalan. 

5. `BuildContext` merubakan objek yang menyimpan informasi mengenai posisi sebuah widget dalam *widget tree*. Dengan `BuildContext`, suatu widget dapat mengakses informasi atau layanan yang disediakan oleh widget lain yang berada di atasnya (*ancestor*). Penggunaan `BuildContext` penting karena berguna dalam mengakses berbagai fitur Flutter, seperti tema aplikasi, navigasi, ukuran layar, dan menampilkan `SnackBar`.
Dalam penerapannya, method `build` menggunakan `BuildContext` sebagai parameter untuk mengakses informasi yang terkandung di dalamnya. Contoh pada proyek ini:
```
   Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),
  );
}
```
Sehingga dapat dikatakan `BuildContext` membantu widget berinteraksi dengan lingkungan dan widget lain di dalam *widget tree*. 

6. *Hot reload* merupakan fitur Flutter yang memungkinkan developer melihat perubahan kode secara langsung tanpa harus menjalankan ulang aplikasi dari awal. Fitur ini mempertahankan *state* aplikasi yang sedang berjalan sehingga proses pengembangan dan pengujian menjadi lebih cepat. 
Berbeda dengan *hot reload*, *hot restart* akan menjalankan ulang aplikasi dari awal dengan memuat kembali kode yang telah diperbarui. Selain itu, *hot reload* akan menghilangkan *state* aplikasi yang sedang berjalan. 
Sementara itu, *full restart* merupakan proses menghentikan dan menjalankan kembali aplikasi secara keseluruhan, termasuk melakukan proses kompilasi dan build ulang jika diperlukan. Misal jika terdapat perubahan yang memengaruhi konfigurasi atau kode pada native aplikasi.

Developer tidak bisa hanya mengandalkan *hot reload* , pada beberapa kasus diperlukan penggunaan *hot restart* dan *full restart*:
- **Perubahan struktur atau inisialisasi `State`:** Menambahkan variabel baru pada `StatefulWidget` yang membutuhkan inisialisasi ulang.
- **Perubahan pada fungsi `main()`atau `initState()`:** Perubahan pada bagian yang hanya dijalankan saat aplikasi pertama kali dimulai tidak akan dijalankan ulang melalui *hot reload*.
- **Perubahan *native code*:** Misalnya mengubah konfigurasi Android atau menambahkan plugin yang membutuhkan perubahan pada kode ntaive. Kondisi ini memerlukan *full restart*.

### **AI Disclosure Tugas 7**
AI digunakan dalam proyek ini sebagai sarana pendukung dalam memahami konsep dasar Flutter, menyesuaikan rancangan tampilan dengan *requirement* tugas, serta memahami cara pewarnaan tombol dan penggunaan `hot reload` / `hot restart`. Keputusan dan implementasi akhir tetap dilakukan oleh saya berdasarkan *requirement* tugas dan kondisi proyek.

### **1. Alat AI yang Digunakan**
* **ChatGPT** (Model Bahasa / AI Assistant)

### **2. Ruang Lingkup Bantuan AI**
* **Rancangan Tampilan:** Membantu memberi gambaran terkait tampilan dashboard, halaman menu, dan letak card pada proyek *mobile*. (berdasarkan role admin/editor/guest) sebagai bahan pertimbangan.
* **Penyesuaian dengan Requirement:** Membantu memastikan bahwa target Tugas 7 hanya mencakup perubahan identitas, penambahan tombol, dan pewarnaan, tanpa implementasi CRUD dan *role*.
* **Pewarnaan Tombol:** Membantu memahami maksud "tanpa percabangan if-else" dengan menambahkan atribut ``Color color`` pada class ``ItemHomepage``.
* **Hot Reload dan Hot Restart:** Membantu menentukan kapan cukup memakai `hot reload` dan kapan lebih aman memakai `hot restart` setelah mengubah struktur class.
* **Konsep Widget:** Membantu memahami apa itu widget, state, serta perbedaan ``StatelessWidget`` dan ``StatefulWidget``, termasuk alasan ``MyHomePage`` dibuat ``StatelessWidget``.
* **Ikon Flutter:** Membantu mengenal ikon bawaan Flutter (``Icons.*``) dan cara mencarinya.

### **3. Strategi *Prompting***
* **Context-Providing Prompting:** Mengirimkan *requirement* tugas agar jawaban AI sesuai dengan kebutuhan tugas.
* **Confirmation Prompting:** Menyampaikan pemahaman sendiri, yaitu bahwa tugas hanya perlu mengubah warna dan menambah tombol, untuk memastikan pemahaman tersebut sudah benar.
* **Conceptual Questioning:** Menanyakan fungsi dan alasan penggunaan ``StatelessWidget`` pada ``MyHomePage``.
* **Clarification Follow-up:** Menanyakan maksud kalimat "tanpa hardcoding banyak percabangan if-else" pada petunjuk tugas.
* **Decision-Based Questioning:** Menanyakan apakah setelah menambah atribut baru sebaiknya memakai `hot reload` atau `hot restart`.
* **Resource Seeking:** Menanyakan daftar ikon yang tersedia di Flutter.

### **4. Log *Prompting* AI**
Penggunaan AI dalam Tugas 7 didokumentasikan untuk menunjukkan bagian-bagian proses pengembangan yang mendapatkan bantuan AI.

**Format Log:** `[ID] / [Tugas] - [Deskripsi Penggunaan AI]: [Link ke Chat]`

Keterangan:
- **ID** = nomor urut interaksi AI.
- **Tugas** = nomor tugas yang dikerjakan.
- **Deskripsi Penggunaan AI** = ringkasan tujuan atau topik bantuan AI.
- **Link ke Chat** = tautan menuju percakapan AI yang digunakan

**001 / Tugas 7 - Meminta saran rancangan tampilan aplikasi mobile**: https://chatgpt.com/share/6af55f6b-8f00-83ec-8eaa-9c4943daee90
Membantu memberi gambaran terkait tampilan dashboard, halaman menu, dan letak card pada proyek *mobile*.

**002 / Tugas 7 - Menyesuaikan rancangan dengan requirement tugas**: https://chatgpt.com/share/6af55f6b-8f00-83ec-8eaa-9c4943daee90
Mengirimkan *requirement* tugas untuk memastikan cakupan pengerjaan tugas.

**003 / Tugas 7 - Memahami maksud pewarnaan tanpa percabangan if-else**: https://chatgpt.com/share/6af55f6b-8f00-83ec-8eaa-9c4943daee90
Membantu memahami bahwa warna dapat disimpan sebagai atribut ``Color color`` pada ``ItemHomepage`` sehingga widget cukup membaca ``item.color``, tanpa mengecek nama tombol satu per satu.

**004 / Tugas 7 - Memberi penjelasan penerapan antara hot reload dan hot restart**: https://chatgpt.com/share/6af55f6b-8f00-83ec-8eaa-9c4943daee90
Membantu memahami bahwa perubahan warna, teks, atau ikon cukup dengan hot reload, sedangkan penambahan atribut pada model atau perubahan struktur class lebih aman dengan hot restart.

**005 / Tugas 7 - Memahami ``StatelessWidget`` dan alasan penggunaannya**: https://chatgpt.com/share/6af55f6b-8f00-83ec-8eaa-9c4943daee90
Membantu memahami konsep widget dan state, perbedaan ``StatelessWidget`` dan ``StatefulWidget``, serta alasan ``MyHomePage`` cukup berupa ``StatelessWidget`` karena hanya menampilkan informasi dan menu, sedangkan ``SnackBar`` ditampilkan lewat ``ScaffoldMessenger`` tanpa mengubah state widget.

**006 / Tugas 7 - Mengenal ikon bawaan Flutter**: https://chatgpt.com/share/6af55f6b-8f00-83ec-8eaa-9c4943daee90
Membantu mengenal ikon Material bawaan Flutter, kategori ikon yang relevan untuk portofolio, dan cara mencari nama konstanta ``Icons`` yang tepat.

### **5. Evaluasi Kritis terhadap Penggunaan AI**
AI digunakan untuk membantu memahami konsep Flutter dan menyesuaikan pendekatan pengerjaan dengan *requirement* tugas. Saran awal AI berupa rancangan dashboard dengan CRUD dan role ternyata melebihi cakupan Tugas 7, sehingga saya memeriksanya kembali terhadap requirement dan hanya menerapkan bagian yang dibutuhkan. Setiap saran saya periksa dan sesuaikan dengan kondisi proyek. Implementasi, pengujian dengan ``flutter analyze``, dan keputusan akhir tetap dilakukan oleh saya, sehingga AI hanya berperan sebagai pendukung proses belajar.