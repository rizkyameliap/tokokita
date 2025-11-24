📦 TokoKita Amel

Flutter App dengan Backend CodeIgniter 4 REST API

Aplikasi sederhana untuk login, registrasi, dan manajemen produk menggunakan Flutter sebagai frontend dan CodeIgniter 4 sebagai REST API backend.

🚀 Fitur Utama
1. Autentikasi

Login

Registrasi

Validasi email & password

Auto-redirect setelah login

2. Manajemen Produk

List produk

Tambah produk

Edit produk

Hapus produk

Detail produk

📱 Screenshot Aplikasi
1. Halaman Login
<img width="951" height="517" alt="Screenshot 2025-11-24 190811" src="https://github.com/user-attachments/assets/7276515f-c85a-4a11-9769-be8dff9b567c" />

2. Halaman Registrasi
<img width="939" height="581" alt="Screenshot 2025-11-24 190837" src="https://github.com/user-attachments/assets/515903b2-1cfb-4f00-bdb6-a2dbc7440d4e" />

3. List Produk
<img width="939" height="506" alt="Screenshot 2025-11-24 185735" src="https://github.com/user-attachments/assets/7cf99303-466f-4e0e-a3a4-decf9235484d" />

5. Form Produk (Tambah / Edit)
<img width="948" height="414" alt="Screenshot 2025-11-24 190655" src="https://github.com/user-attachments/assets/4d1dd1e9-5c51-4dd0-aa9d-867dd6152842" />

<img width="937" height="439" alt="image" src="https://github.com/user-attachments/assets/8a242820-9094-473c-b687-de3bc28accc0" />

6. Detail Produk
<img width="939" height="744" alt="Screenshot 2025-11-24 190622" src="https://github.com/user-attachments/assets/1dca5153-3cb6-4e74-af03-aa280acc0237" />

🧩 Penjelasan Singkat Tiap Halaman
🔐 Login Page

Kode utama:

StatefulWidget untuk handle perubahan state

FormState untuk validasi

TextEditingController untuk input

Loading indicator saat proses login

Fitur:

Validasi email & password

Redirect ke halaman produk jika login sukses

Tombol ke halaman registrasi

📝 Registrasi Page

Email Validator:

Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


Fitur:

Validasi email dengan regex

Konfirmasi password harus sama

Minimal karakter untuk nama & password

Auto redirect ke login setelah registrasi

📦 List Produk

Kode inti:

List<Produk> items = [
  Produk(id: "1", kodeProduk: "A001", namaProduk: "Kamera Amel", hargaProduk: 5000000),
];


Fitur:

Tampilkan produk menggunakan ListView.builder

Drawer menu (logout)

Floating Action Button untuk tambah produk

Navigasi ke detail produk

🧾 Form Produk (Tambah/Edit)

Mode otomatis:

if (widget.produk != null) {
  judul = "UBAH PRODUK AMEL";
  tombolSubmit = "UBAH";
}


Fitur:

Mode Tambah & Edit dalam 1 file

Auto-fill ketika edit

Validasi wajib isi semua field

🔎 Detail Produk

Konfirmasi hapus:

AlertDialog alertDialog = AlertDialog(
  content: const Text("Yakin ingin menghapus data ini?"),
  actions: [
    OutlinedButton(
      child: const Text("Ya"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    ),
  ],
);


Fitur:

Tampilan detail lengkap

Tombol Edit → ke form

Tombol Delete → dialog konfirmasi + snackbar

🛠️ Backend: CodeIgniter 4 REST API
Endpoint Utama:
Method	Endpoint	Deskripsi
POST	/registrasi	Registrasi user
POST	/login	Login & token
GET	/produk	List produk
POST	/produk	Tambah produk
PUT	/produk/{id}	Update produk
DELETE	/produk/{id}	Hapus produk
📂 Struktur Project Flutter (Singkat)
lib/
│── main.dart
│── pages/
│   ├── login.dart
│   ├── registrasi.dart
│   ├── produk_page.dart
│   ├── produk_form.dart
│   └── produk_detail.dart
│── models/produk.dart
└── services/api_service.dart

🧪 Cara Menjalankan
Backend (CodeIgniter 4):
php spark serve

Flutter:
flutter pub get
flutter run

✨ Author

Rizky Amelia Putri (Amel)
Project TokoKita — Flutter × CodeIgniter 4
