
# Sistem User Telur Gulung 🍢📱

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey)
![License](https://img.shields.io/badge/license-For%20Education%20Only-blue)



## Deskripsi
**Sistem User Telur Gulung** adalah aplikasi mobile berbasis **Flutter** yang dirancang untuk memudahkan pengguna dalam memesan produk Telur Gulung secara praktis dan modern. Aplikasi ini mengintegrasikan sistem autentikasi, manajemen produk, pemesanan, lokasi outlet, hingga fitur religi seperti jadwal sholat otomatis.

---


## Fitur Utama

| No | Fitur             | Deskripsi                                                                 |
|----|-------------------|--------------------------------------------------------------------------|
| 1  | Autentikasi       | Login & registrasi pengguna dengan validasi keamanan                     |
| 2  | Manajemen Produk  | Daftar menu telur gulung lengkap dengan harga & deskripsi                |
| 3  | Sistem Pemesanan  | Pemesanan produk dengan berbagai pilihan rasa & topping                  |
| 4  | Riwayat Pesanan   | Melihat status & daftar pesanan yang telah dilakukan                     |
| 5  | Lokasi & Peta     | Integrasi peta lokasi outlet menggunakan Flutter Map                     |
| 6  | Fitur Religi      | Informasi jadwal sholat otomatis berdasarkan lokasi pengguna             |

---


## Teknologi yang Digunakan

### Framework & Bahasa
- **Framework**: Flutter 3.x
- **Bahasa**: Dart

### Dependencies Utama
Lihat file [pubspec.yaml](pubspec.yaml) untuk daftar lengkap. Beberapa dependencies utama:

```yaml
cupertino_icons: ^1.0.8
http: ^1.6.0
flutter_dotenv: ^6.0.0
shared_preferences: ^2.2.0
curved_navigation_bar: ^1.0.3
loading_animation_widget: ^1.0.1
flutter_map: ^6.1.0
latlong2: ^0.9.1
url_launcher: ^6.3.1
```

---

## 📦 Struktur Direktori

```
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── screens/
│   └── services/
├── assets/
│   └── images/
├── test/
├── android/ ios/ linux/ macos/ windows/ web/
├── pubspec.yaml
└── README.md
```

---

## 📱 Instalasi & Menjalankan

1. **Clone repository**
	```bash
	git clone https://github.com/BudiAmin/sistem-suser-telur-gulung.git
	cd sistem-suser-telur-gulung
	```
2. **Buat file .env** (jika perlu, salin dari .env.example)
3. **Install dependencies**
	```bash
	flutter pub get
	```
4. **Jalankan aplikasi**
	```bash
	flutter run
	```

---

## ⚙️ Konfigurasi Lingkungan


Salin file `.env.example` menjadi `.env` dan sesuaikan konfigurasi berikut:

```env
BASE_URL=your_api_base_url
API_JADWAL_URL=your_api_jadwal_url
```

---

## 👨‍💻 Tim Pengembang

| Foto | Nama | NIM |
|------|------|-----|
| <img src="assets/images/ikhsan.jpeg" width="80" style="border-radius:50%"> | Muhammad Ikhsan | 152022001 |
| <img src="assets/images/yusron.jpeg" width="80" style="border-radius:50%"> | Muhammad Usri Yusron | 152022132 |
| <img src="assets/images/yazid.jpeg" width="80" style="border-radius:50%"> | Muhammad Yazid | 152022192 |
| <img src="assets/images/budi.jpeg" width="80" style="border-radius:50%"> | Budi Amin | 152022213 |
| <img src="assets/images/faoyan.jpeg" width="80" style="border-radius:50%"> | Ahmad Faoyan | 152024601 |

---


---


## 📄 Lisensi | License |

Proyek ini dibuat untuk keperluan tugas mata kuliah **Pemrograman Mobile**.

This project was created for **Mobile Programming** course assignment.

---

<div align="center">

**Made with ❤️ using Flutter**

</div>