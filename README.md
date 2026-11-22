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
- **material_ui** sebagai paket pustaka Material (pengganti `flutter/material.dart`).

Tidak ada aset eksternal yang digunakan.

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
├── main.dart                    # Entry point dan konfigurasi tema aplikasi
├── screens/
│   ├── menu.dart                # Halaman utama
│   ├── experience_form.dart     # Form tambah experience
│   └── education_form.dart      # Form tambah education
└── widgets/
    ├── item_card.dart           # Kartu tombol menu (ItemCard)
    └── left_drawer.dart         # Drawer navigasi
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

## Tugas 8
1. Perbedaan antara `Navigator.push()`, `pushReplacement()`, dan `pop()`, antara lain:

| Method | Cara kerja pada stack route | Dipakai untuk |
|---|---|---|
| `Navigator.push()` | Menambahkan route baru **di atas** halaman yang sedang dibuka. Halaman sebelumnya tetap tersimpan. | Membuka halaman baru yang memungkinkan pengguna kembali ke halaman sebelumnya.|
| `Navigator.pushReplacement()` | **Mengganti** halaman yang sedang dibuka dengan halaman baru. Halaman sebelumnya dihapus dari *stack*, sedangkan halaman di bawahnya tidak berubah. | Berpindah halaman tanpa menyimpan halaman sebelumnya. |
| `Navigator.pop()` | **Menghapus** halaman paling atas dari *stack* dan menampilkan halaman sebelumnya. | Kembali ke halaman sebelumnya atau menutup dialog. |

* **Membuka formulir dari kartu aksi**: Pada `ItemCard`, tombol "Tambah Experience" dan "Tambah Education" menggunakan `Navigator.push()` untuk membuka halaman formulir melalui `MaterialPageRoute`. Dengan cara ini, halaman menu utama tetap tersimpan di *stack* tepat di bawah halaman formulir. Karena itu, pengguna dapat kembali ke menu utama dengan tombol Back bawaan perangkat atau *gesture swipe*, yang menjalankan `Navigator.pop()` dan menghapus *route* formulir dari *stack*.

* **Opsi Home di drawer**: Opsi Home menggunakan `Navigator.pushReplacement()` dengan `MaterialPageRoute(builder: (context) => MyHomePage())`. *Route* yang sedang tampil (halaman formulir) diganti oleh halaman utama, sedangkan *route* di bawahnya pada *stack* tidak diubah. Akibatnya, formulir tidak tertinggal di *stack* dan pengguna langsung sampai di halaman utama. Berbeda dengan `push`, *route* yang digantikan tidak dapat dikembalikan dengan tombol Back. Opsi "Add Experience" dan "Add Education" di drawer memakai `push`, sehingga formulir ditumpuk di atas halaman sebelumnya.

2. Mekanisme susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten:
`Scaffold` adalah kerangka standar halaman dengan slot `appBar`, `drawer`, dan `body`. Semua halaman (`MyHomePage`, `ExperienceFormPage`, `EducationFormPage`) memakai kerangka yang sama sehingga letak judul, ikon menu, dan area isi selalu konsisten. `Drawer` dibuat sekali sebagai widget terpisah (`LeftDrawer` di `lib/widgets/`) lalu dipasang lewat `drawer: const LeftDrawer()` di setiap halaman. Perubahan menu navigasi cukup dilakukan di satu file dan langsung berlaku di semua halaman. `AppBar` juga memberi tombol menu otomatis yang membuka drawer itu.

* **Contoh warna tema yang diterapkan pada lebih dari satu halaman:** warna utama marun (`#6D2932`) didefinisikan sekali di `ThemeData` pada `main.dart`, lalu dipakai lewat `Theme.of(context).colorScheme.primary` pada:
- `backgroundColor` `AppBar` halaman utama,
- `backgroundColor` `AppBar` halaman Tambah Experience dan Tambah Education,
- `decoration` `DrawerHeader` pada `LeftDrawer`.
Karena semuanya membaca satu sumber tema, mengganti seed color di `main.dart` otomatis mengubah warna seluruh halaman. Tombol simpan memakai `colorScheme.secondary` (cokelat `#3C2A21`) dengan cara yang sama.

3. Formulir disusun sebagai `Form` yang membungkus `SingleChildScrollView` berisi `Column`. Setiap field diberi label tebal di atasnya, lalu dikelompokkan dengan `Padding`. Tata letak vertikal dipilih karena cocok untuk layar ponsel yang sempit dan memudahkan pembacaan field satu per satu, seperti urutan pada form web.

- **Widget pengatur jarak** (`Padding`, `EdgeInsets`, `SizedBox`) memberi ruang antar-field dan di tepi layar sehingga field, label, dan pesan error tidak menempel dan tetap mudah disentuh.
- **Widget penggulir** (`SingleChildScrollView`) membuat seluruh isi formulir tetap dapat dijangkau ketika ruang layar terbatas. Form Education punya banyak field dan bisa lebih tinggi daripada layar. Saat papan ketik tampil, tinggi area yang terlihat makin kecil. Tanpa penggulir, isi akan terpotong dan Flutter menampilkan error overflow, sehingga tombol Simpan tidak bisa dijangkau.

4. Fungsi dari `GlobalKey<FormState>`, `validator`, dan `validate()` yaitu:
- **`GlobalKey<FormState>`** (`_formKey`) dipasang pada widget `Form`. Kunci ini memberi akses ke `FormState` dari luar widget field, termasuk dari `onPressed` tombol Simpan.
- **`validator`** adalah fungsi pada tiap `TextFormField` atau `DropdownButtonFormField`. Fungsi ini mengembalikan teks pesan kesalahan jika input tidak memenuhi aturan, atau `null` jika input valid.
- **`validate()`** (`_formKey.currentState!.validate()`) dipanggil saat tombol Simpan ditekan. Method ini menjalankan semua `validator` sekaligus, menampilkan pesan merah pada field yang gagal, dan mengembalikan `true` hanya jika semua lolos. Dialog ringkasan hanya ditampilkan di dalam `if (validate())`.

* **Contoh nilai yang ditolak**:
- Nama institusi hanya berisi spasi (`" "`), `value.trim().isEmpty` akan dijalankan sehingga muncul "Nama institusi tidak boleh kosong!".
- Validator memeriksa urutan tahun dan apabila tahun selesai sebelum tahun mulai (misal tahun mulai 2024, tahun selesai 2020), ia akan menolak dengan "Tahun selesai tidak boleh sebelum tahun mulai".
- URL gambar `abc`. Validator menolaknya karena bukan URL thumbnail Google Drive (`https://drive.google.com/thumbnail?id=...`) menyesuaikan dengan model proyek pada django.

**Mengapa memilih jenis input atau papan ketik saja belum cukup:** `keyboardType: TextInputType.number` hanya mengubah tampilan papan ketik. Papan ketik tidak menjamin isi field. Pengguna tetap bisa menempel (*paste*) teks, mengetik angka yang tidak masuk akal seperti `0001`, `9999`, atau `123`, atau mengosongkannya. Papan ketik juga tidak bisa memeriksa aturan antar-field seperti urutan tahun mulai dan selesai, atau format spesifik seperti URL Google Drive. Selain itu, tidak ada papan ketik khusus yang membatasi spasi saja atau batas panjang teks. Jadi validasi tetap diperlukan sebagai pemeriksaan sebenarnya, sedangkan pilihan jenis input hanya membantu kenyamanan pengguna.

### **AI Disclosure Tugas 8**
AI digunakan dalam proyek ini sebagai sarana pendukung dalam memahami konsep navigasi dan form pada flutter, menyusun halaman form Education, serta menyelesaikan masalah Git dan error saat pengerjaan. Keputusan dan implementasi akhir tetap dilakukan oleh saya berdasarkan *requirement* tugas dan kondisi proyek.

### **1. Alat AI yang Digunakan**
* **ChatGPT** (Model Bahasa / AI Assistant)

### **2. Ruang Lingkup Bantuan AI**
* **Konsep Flutter:** Memahami perbedaan `material.dart` dan `material_ui.dart` 
* **Struktur form:** Memahami langkah tutorial (Form, `GlobalKey<FormState>`, `TextFormField`, `validator`, dialog) dan menyesuaikannya dengan model Education.
* **Validasi:** Menyusun aturan validasi (isian kosong atau spasi, batas panjang, urutan tahun, format URL thumbnail Google Drive).
* **Navigasi:** Memahami `push`, `pushReplacement`, dan `pop` serta perilaku stack route.
* **Git dan Debugging:** Memperbaiki kondisi setelah pindah branch dan stash, file ganda, serta error `MaterialLocalizations` akibat import yang tercampur.

### **3. Strategi *Prompting***
* **Clarification Follow-up:** Menanyakan perbedaan `material_ui` dan `material.dart`.
* **Context-Providing Prompting:** Mengirim teks tutorial, screenshot form web, dan hasil `flutter analyze` atau `git status`.
* **Requirement-Based Prompting:** Menjelaskan model Django dan aturan yang saya inginkan (batas panjang, *dropdown*, *checkbox*, validasi antar-tahun, batas skill) lalu menanyakan *field* dan validasi apa saja yang dibutuhkan di Flutter.
* **Code Explanation Prompting:** Mengirim potongan kode validator URL gambar untuk menanyakan apakah validasinya sudah tepat dan bagaimana cara kerjanya.
* **Problem-Based Questioning:** Mengirim pesan error dan log Git untuk mencari penyebab error.

### **4. Log *Prompting* AI**
**Format Log:** `[ID] / [Tugas] - [Deskripsi Penggunaan AI]: [Link ke Chat]`
**001 / Tugas 8 - Memahami perbedaan `material_ui` dan `material.dart`**: https://chatgpt.com/share/6b025f02-4f98-83ec-8690-55bce34905e8
Menanyakan perbedaan kedua import. Jawaban AI awal kurang tepat karena menyamakan `material_ui` dengan Material UI untuk React, sehingga saya mencocokkannya dengan catatan Tutorial 09 bahwa pustaka Material dipindah ke paket `material_ui` mulai Flutter 3.50.
**002 / Tugas 8 - Menelusuri error `flutter analyze` (182 isu)**: https://chatgpt.com/share/6b025f02-4f98-83ec-8690-55bce34905e8
Mengirim hasil `flutter analyze` yang masih error. AI menduga penyebabnya adalah import `material_ui` yang tidak ditemukan dan menyarankan mengganti ke `package:flutter/material.dart`.
**003 / Tugas 8 - Memulihkan `experience_form.dart` yang hilang di branch `tugas-8`**: https://chatgpt.com/share/6b025f2d-5470-83ec-a79d-57adda74875c
Menanyakan penyebab file Experience hilang padahal ada di `main`. AI menyarankan memeriksa file di `main` dengan `git ls-tree` lalu memulihkannya dengan `git restore --source=main`, tanpa `reset --hard` atau `git clean`.
**004 / Tugas 8 - Menyesuaikan field dan validasi form Education dengan model Django**: https://chatgpt.com/share/6b025f02-4f98-83ec-8690-55bce34905e8
Menjelaskan model Education di Django dan menanyakan field serta validasi yang perlu dibuat di Flutter.
**005 / Tugas 8 - Memeriksa validator URL gambar Google Drive**: https://chatgpt.com/share/6b025f02-4f98-83ec-8690-55bce34905e8
Mengirim potongan kode `isDriveThumbnail` untuk memastikan validasi URL sudah benar.

### **5. Evaluasi Kritis terhadap Penggunaan AI**
AI membantu dalam mempermudah pemahaman dan penyelesaian masalah, tetapi tiap sarannya tetap perlu diverifikasi lebih lanjut. Saya mencocokkan penjelasan `material_ui` dengan catatan Tutorial 09, menelusuri error `flutter analyze` hingga menemukan masalah sinkronisasi branch, serta menyesuaikan validasi Education dengan model Django. Dengan demikian, AI berperan sebagai alat bantu, sedangkan verifikasi dan keputusan akhir tetap saya lakukan sendiri.